package com.hanhe.college.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.UUID;
import java.util.regex.Pattern;

import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.albaba.tools.util.DateUtil;
import com.hanhe.college.common.CKFileResult;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.exception.ParamException;

import sun.misc.BASE64Decoder;

/**
 * Created by Angelo on 2018/8/27.
 */
public class UploadUtil {

	// 上传CKEditor图片文件夹
	private static final String UPLOAD_CK_DIR_PATH = "upload" + File.separator + "CKimg";
	// 上传视频文件夹
	private static final String UPLOAD_VIDEO_PATH = "upload" + File.separator + "medias";
	// 文件允许格式
	private static String[] allowVideoTypes = {".mp4", ".3gp", ".webm", ".ogg"};
	// 图片命名格式
	private static final String DEFAULT_FILE_NAME_FORMAT = "yyyyMMddHHmmss";
	//
	private static final String BASE64_IMAGE_REG = "^data:image/(jpeg|png|gif);base64,.*$";

	public static CKFileResult ckeditor(MultipartFile file, String projectPath, String projectName) throws IOException {
		if (file == null || file.isEmpty()) {
			return CKFileResult.fail("上传文件为空");
		} else {
			String fileName = file.getOriginalFilename();
			String contentType = file.getContentType();
			String expandedName = "";
			if (contentType.equals("image/pjpeg") || contentType.equals("image/jpeg")) {
				expandedName = ".jpg";
			} else if (contentType.equals("image/png") || contentType.equals("image/x-png")) {
				expandedName = ".png";
			} else if (contentType.equals("image/gif")) {
				expandedName = ".gif";
			} else if (contentType.equals("image/bmp")) {
				expandedName = ".bmp";
			} else {
				return CKFileResult.fail("文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）");
			}
			if (file.getSize() > 1024 * 1024 * 2) {
				return CKFileResult.fail("文件大小不得大于2M");
			}
			String imgName = upload(file, projectPath, expandedName);
			String imgUrl = projectName + File.separator + UPLOAD_CK_DIR_PATH + File.separator + imgName;
			return CKFileResult.success(imgName, imgUrl.replaceAll("\\\\", "/"));
		}
	}

	public static String upload(MultipartFile file, String projectPath, String expandedName) throws IOException {
		String dirPath = projectPath + UPLOAD_CK_DIR_PATH;
		String imgName = newFileName(file.getOriginalFilename(), expandedName);
		File dir = new File(dirPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		File img = new File(dir, imgName);
		if (!img.exists()) {
			img.createNewFile();
		}
		file.transferTo(img);
		return imgName;
	}

	public static File uploadFile(MultipartFile multipartFile, String dirPath) throws IOException {
		String fileName = newFileName(multipartFile.getOriginalFilename(), null);
		File dir = new File(dirPath);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		File file = new File(dir, fileName);
		if (!file.exists()) {
			file.createNewFile();
		}
		multipartFile.transferTo(file);
		return file;
	}

	public static String uploadVideo(String rootPath, MultipartFile multipartFile) throws IOException {
		String fileName = multipartFile.getOriginalFilename().toString();
		// 判断文件不为空
		if (multipartFile == null || multipartFile.isEmpty() || multipartFile.getSize() == 0) {
			throw new ParamException("视频文件不存在");
		} else {
			if (!checkVideoType(fileName)) {
				throw new ParamException("文件格式不正确（仅支持.MP4/.3GP/.WebM/.Ogg文件）");
			} else if (multipartFile.getSize() > 1024 * 1024 * 300) {
				throw new ParamException("视频大小不得大于300M");
			} else {
				String newVideoName = newFileName(fileName);
				String dirPath = rootPath + UPLOAD_VIDEO_PATH;
				String videoPath = UPLOAD_VIDEO_PATH + File.separator + newVideoName;
				File dir = new File(dirPath);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				File video = new File(dir, newVideoName);
				if (!video.exists()) {
					video.createNewFile();
				}
				multipartFile.transferTo(video);
				return videoPath.replaceAll("\\\\", "/");
			}
		}
	}

	public static String getPCImagePath(String rootPath, MultipartFile file, Integer type) throws IOException {
		String subDir = "";
		String imgName = "";
		if (file != null && !file.isEmpty()) {
			imgName = newFileName(file.getOriginalFilename());
			switch (type) {
				case Constants.IMAGE_TYPE_ARTICLE :
					subDir = "upload" + File.separator + "articles";
					break;
				case Constants.IMAGE_TYPE_VIDEO :
					subDir = "upload" + File.separator + "videos";
					break;
				case Constants.IMAGE_TYPE_EXPERT :
					subDir = "upload" + File.separator + "experts";
					break;
				case Constants.IMAGE_TYPE_TRAINEE :
					subDir = "upload" + File.separator + "trainees";
					break;
			}

			String dirPath = rootPath + subDir;
			String imgPath = subDir + File.separator + imgName;
			File dir = new File(dirPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			File img = new File(dir, imgName);
			if (!img.exists()) {
				img.createNewFile();
			}

			file.transferTo(img);
			return imgPath.replaceAll("\\\\", "/");
		} else {
			throw new ParamException("文件不存在");
		}
	}

	public static String getWechatImagePath(String rootPath, String accessToken, String serverId, int type) throws IOException {
		if (!(StringUtils.isEmpty(accessToken) || StringUtils.isEmpty(serverId))) {
			String imgName = newFileName("x.jpg");
			String subDir = "";
			switch (type) {
				case Constants.IMAGE_TYPE_USER :
					subDir = "upload" + File.separator + "users";
					break;
				case Constants.IMAGE_TYPE_COMMENT :
					subDir = "upload" + File.separator + "comments";
					break;
			}
			String dirPath = rootPath + subDir;
			String imgPath = subDir + File.separator + imgName;
			File dir = new File(dirPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			File img = new File(dir, imgName);
			if (!img.exists()) {
				img.createNewFile();
			}
			WeChatUtil.downloadImage(accessToken, serverId, img);
			return imgPath.replaceAll("\\\\", "/");
		} else {
			throw new ParamException("文件不存在");
		}
	}

	public static boolean isUploadBase64Image(String base64ImgData) {
		Pattern p = java.util.regex.Pattern.compile(BASE64_IMAGE_REG);
		return p.matcher(base64ImgData).matches();
	}

	/**
	 * 把base64图片数据转为本地图片
	 * @param base64ImgData
	 * @throws IOException
	 */
	public static String uploadBase64Image(String rootPath, String base64ImgData, int type) throws IOException {
		String subDir = "";
		String imgName = "";
		if (!StringUtils.isEmpty(base64ImgData)) {
			imgName = newFileName("x.jpg");
			switch (type) {
				case Constants.IMAGE_TYPE_ARTICLE :
					subDir = "upload" + File.separator + "articles";
					break;
				case Constants.IMAGE_TYPE_VIDEO :
					subDir = "upload" + File.separator + "videos";
					break;
				case Constants.IMAGE_TYPE_EXPERT :
					subDir = "upload" + File.separator + "experts";
					break;
				case Constants.IMAGE_TYPE_TRAINEE :
					subDir = "upload" + File.separator + "trainees";
					break;
			}

			String dirPath = rootPath + subDir;
			String imgPath = subDir + File.separator + imgName;
			File dir = new File(dirPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

//			File img = new File(dir, imgName);
//			if (!img.exists()) {
//				img.createNewFile();
//			}
			String filePath = dirPath + File.separator + imgName;
			BASE64Decoder d = new BASE64Decoder();
			byte[] bs = d.decodeBuffer(base64ImgData);
			FileOutputStream os = new FileOutputStream(filePath);
			os.write(bs);
			os.close();
			return imgPath.replaceAll("\\\\", "/");
		} else {
			throw new ParamException("文件不存在");
		}

	}

	public static String newFileName(String fileName) {
		String name = String.valueOf(DateUtil.getNow().getTime() + (long) ((int) (Math.random() * 99.0D)));
		return fileName.indexOf(".") == -1 ? name : name + fileName.substring(fileName.lastIndexOf("."));
	}

	public static String newFileName(String fileName, String expandedName) {
		String name = String.valueOf(DateUtil.getNow().getTime() + (long) ((int) (Math.random() * 99.0D)));
		String suffix = !StringUtils.isEmpty(expandedName)
				? expandedName
				: (fileName.indexOf(".") == -1 ? "" : fileName.substring(fileName.lastIndexOf(".")));
		return name + suffix;
	}

	public static String renameToUUID(String fileName, String expandedName) {
		String suffix = !StringUtils.isEmpty(expandedName)
				? expandedName
				: (fileName.indexOf(".") == -1 ? "" : fileName.substring(fileName.lastIndexOf(".")));
		return UUID.randomUUID() + suffix;
	}

	private static boolean checkVideoType(String fileName) {
		Iterator<String> type = Arrays.asList(allowVideoTypes).iterator();
		while (type.hasNext()) {
			String ext = type.next();
			if (fileName.toLowerCase().endsWith(ext)) {
				return true;
			}
		}
		return false;
	}
}
