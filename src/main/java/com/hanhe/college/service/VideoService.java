package com.hanhe.college.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.albaba.tools.image.GraphicsUtil;
import com.albaba.tools.util.DateUtil;
import com.albaba.tools.util.IpUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Preconditions;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.dao.UavTypeMapper;
import com.hanhe.college.dao.VideoMapper;
import com.hanhe.college.entity.UavType;
import com.hanhe.college.entity.Video;
import com.hanhe.college.exception.ParamException;
import com.hanhe.college.param.admin.VideoParam;
import com.hanhe.college.util.BeanValidator;
import com.hanhe.college.util.FileUtil;
import com.hanhe.college.util.UploadUtil;

/**
 * Created by Angelo on 2018/8/8.
 */
@Service
public class VideoService {
    @Autowired
    private VideoMapper videoMapper;
    @Autowired
    private UavTypeMapper uavTypeMapper;

    /**
     *  视频列表
     */
    public List<Video> list(Long uavTypeId, Integer pageNum, Integer pageSize) {
        if (uavTypeId == null) {
            uavTypeId = 0L;
        }
        if (pageNum == null) {
            pageNum = Constants.DEFAULT_PAGE_NUM;
        }
        if (pageSize == null) {
            pageSize = Constants.DEFAULT_PAGE_SIZE;
        }
        PageHelper.startPage(pageNum, pageSize);
        return videoMapper.list(uavTypeId);
    }

    /**
     *  添加视频
     */
	public long insert(VideoParam param, MultipartFile file) throws Exception {
		BeanValidator.check(param);
		UavType uavType = uavTypeMapper.selectByPrimaryKey(param.getUavTypeId());
		Preconditions.checkNotNull(uavType, "指定的机型不存在");

		String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
		String videoUrl = UploadUtil.uploadVideo(projectPath, file);

		Date now = DateUtil.getNow();
		Video video = Video.builder().uavTypeId(param.getUavTypeId()).uavType(uavType.getName()).name(param.getName())
				.videoUrl(videoUrl).image(param.getImage()).introduction(param.getIntroduction())
				.state(Constants.DEFAULT_STATE_NORMAL).createTime(now).build();
		// 视频封面
		if (UploadUtil.isUploadBase64Image(param.getImage())) {
			String base64ImageData = param.getImage().split(",")[1];
			String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_VIDEO);
			video.setImage(imgUrl);

			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(video.getImage())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_VIDEO, video.getImage());
				if (paths != null && paths.length > 0) {
					video.setImageSrc(video.getImage());
					video.setImage(paths[0]);
				}
			}
		} else {
			throw new ParamException("图片上传格式有误");
		}
		video.setAdminId(RequestHolder.getCurrentUserBean().getId());
		video.setOperator(RequestHolder.getCurrentUserBean().getName());
		video.setOperateTime(now);
		video.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
		videoMapper.insertSelective(video);
		long id = video.getId();
		Video update = Video.builder().id(id).seq(id).build();
		videoMapper.updateByPrimaryKeySelective(update);
		return id;
	}

	/**
	 * 更新视频
	 */
	public int update(VideoParam param, MultipartFile file) throws Exception {
		BeanValidator.check(param);
		Long id = param.getId();
		Video before = videoMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待更新的视频不存在");
		UavType uavType = uavTypeMapper.selectByPrimaryKey(param.getUavTypeId());
		Preconditions.checkNotNull(uavType, "指定的机型不存在");

		Video after = Video.builder().id(id).uavTypeId(param.getUavTypeId()).uavType(uavType.getName())
				.name(param.getName()).videoUrl(param.getVideoUrl()).image(param.getImage())
				.introduction(param.getIntroduction()).build();
		after.setAdminId(RequestHolder.getCurrentUserBean().getId());
		after.setOperator(RequestHolder.getCurrentUserBean().getName());
		after.setOperateTime(DateUtil.getNow());
		after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));

		boolean isNewVideo = false;
		String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
		if (file != null && !file.isEmpty()) {
			String videoUrl = UploadUtil.uploadVideo(projectPath, file);
			after.setVideoUrl(videoUrl);
			isNewVideo = true;
		}
		// 新上传文章封面
		boolean isNewCoverImg = false;
		if (UploadUtil.isUploadBase64Image(param.getImage())) {
			String base64ImageData = param.getImage().split(",")[1];
			String imgUrl = UploadUtil.uploadBase64Image(projectPath, base64ImageData, Constants.IMAGE_TYPE_VIDEO);
			after.setImage(imgUrl);

			if (Constants.IMAGE_MAGICK_ON && !StringUtils.isEmpty(after.getImage())) {
				String[] paths = GraphicsUtil.generateImage(Constants.IMAGE_MODULE_VIDEO, after.getImage());
				if (paths != null && paths.length > 0) {
					after.setImageSrc(after.getImage());
					after.setImage(paths[0]);
				}
			}
			isNewCoverImg = true;
		}
		int result = videoMapper.updateByPrimaryKeySelective(after);

		if (result > 0) {
			if (isNewVideo) {
				FileUtil.delete(projectPath, before.getVideoUrl());
			}
			if (isNewCoverImg) {
				FileUtil.delete(projectPath, before.getImageSrc());
				FileUtil.delete(projectPath, before.getImage());
			}
		}
		return result;
	}

    /**
     *  删除视频
     */
	public int delete(long id) {
		Video before = videoMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(before, "待删除的视频不存在");
		int result = videoMapper.deleteByPrimaryKey(id);
		if (result > 0) {
			String projectPath = RequestHolder.getCurrentRequest().getServletContext().getRealPath("/");
			FileUtil.delete(projectPath, before.getVideoUrl());
			FileUtil.delete(projectPath, before.getImageSrc());
			FileUtil.delete(projectPath, before.getImage());
		}
		return result;
    }

	public Video getDetails(Long id) {
    	Video video = videoMapper.selectByPrimaryKey(id);
		Preconditions.checkNotNull(video, "待查看的视频不存在");
		return video;
	}

	/**
	 *  浏览量+1
	 */
	public int increaseReadSize(long id) {
		int result = videoMapper.increaseReadSize(id);
		return result;
	}

	/**
	 *  上移/下移
	 */
	public int upDownMove(long upId, long downId) {
		Video upVideo = videoMapper.selectByPrimaryKey(upId);
		Video downVideo = videoMapper.selectByPrimaryKey(downId);
		Preconditions.checkNotNull(upVideo, "待移动的视频不存在");
		Preconditions.checkNotNull(downVideo, "待移动的视频不存在");
		Video update1 = Video.builder().id(upVideo.getId()).seq(downVideo.getSeq()).build();
		Video update2 = Video.builder().id(downVideo.getId()).seq(upVideo.getSeq()).build();
		int result = videoMapper.updateByPrimaryKeySelective(update1);
		if (result > 0) {
			result = videoMapper.updateByPrimaryKeySelective(update2);
		}
		return result;
	}
}
