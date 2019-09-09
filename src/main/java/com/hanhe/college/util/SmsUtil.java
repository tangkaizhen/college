package com.hanhe.college.util;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

/**
 * Created by Angelo on 2018/9/3.
 */
public class SmsUtil {

	// 产品名称:云通信短信API产品,开发者无需替换
	static final String PRODUCT = "Dysmsapi";
	// 产品域名,开发者无需替换
	static final String DOMAIN = "dysmsapi.aliyuncs.com";

	// 开发者自己的AK(在阿里云访问控制台寻找)
	static final String ACCESS_KEY_ID = "LTAIN3DtDlzdyKfh";
	static final String ACCESS_KEY_SECRET = "NnzkM7A0MH3Sxld02o1LeuqBPFxLQE";
	static final String SIGN_NAME = "汉和航空";

	public static boolean sendSms(String phone, String code) throws ClientException {

		// 可自助调整超时时间
		System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
		System.setProperty("sun.net.client.defaultReadTimeout", "10000");

		// 初始化acsClient,暂不支持region化
		IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", ACCESS_KEY_ID, ACCESS_KEY_SECRET);
		DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", PRODUCT, DOMAIN);
		IAcsClient acsClient = new DefaultAcsClient(profile);

		// 组装请求对象-具体描述见控制台-文档部分内容
		SendSmsRequest request = new SendSmsRequest();
		// 必填:待发送手机号
		request.setPhoneNumbers(phone);
		// 必填:短信签名-可在短信控制台中找到
		request.setSignName(SIGN_NAME);
		// 必填:短信模板-可在短信控制台中找到
		request.setTemplateCode("SMS_143719458");
		// 可选:模板中的变量替换JSON串,模板内容为"您的验证码为：${code}，请在10分钟内提交验证码，切勿将验证码泄露于他人"时,此处的值为
		request.setTemplateParam("{\"code\":\"" + code + "\"}");

		// 选填-上行短信扩展码(无特殊需求用户请忽略此字段)
		// request.setSmsUpExtendCode("90997");

		// 可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
		// request.setOutId("yourOutId");

		// hint 此处可能会抛出异常，注意catch
		SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
		if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
			return true;
		}
		return false;
	}
}
