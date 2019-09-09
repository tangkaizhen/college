package com.hanhe.college.controller.wechat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.albaba.tools.util.RandomValidateCode;
import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.common.UserBean;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.entity.User;
import com.hanhe.college.service.UserService;
import com.hanhe.college.service.WeixinService;

import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;

@Slf4j
@Controller
@RequestMapping("/wechat")
public class WechatController {
    @Autowired
    private WeixinService wxService;
    @Autowired
    private UserService userService;

    @ResponseBody
    @GetMapping(produces = "text/plain;charset=utf-8")
    public String authGet(@RequestParam(name = "signature", required = false) String signature,
                          @RequestParam(name = "timestamp", required = false) String timestamp,
                          @RequestParam(name = "nonce", required = false) String nonce,
                          @RequestParam(name = "echostr", required = false) String echostr) {
        log.info("\n接收到来自微信服务器的认证消息：[{}, {}, {}, {}]", signature, timestamp, nonce, echostr);

        if (StringUtils.isAnyBlank(signature, timestamp, nonce, echostr)) {
            throw new IllegalArgumentException("请求参数非法，请核实!");
        }

        if (this.getWxService().checkSignature(timestamp, nonce, signature)) {
            return echostr;
        }

        return "非法请求";
    }

    @ResponseBody
    @PostMapping(produces = "application/xml; charset=UTF-8")
    public String post(@RequestBody String requestBody, @RequestParam("signature") String signature,
                       @RequestParam(name = "encrypt_type", required = false) String encType,
                       @RequestParam(name = "msg_signature", required = false) String msgSignature,
                       @RequestParam("timestamp") String timestamp, @RequestParam("nonce") String nonce) {
        log.info(
                "\n接收微信请求：[signature=[{}], encType=[{}], msgSignature=[{}],"
                        + " timestamp=[{}], nonce=[{}], requestBody=[\n{}\n] ",
                signature, encType, msgSignature, timestamp, nonce, requestBody);

        if (!this.wxService.checkSignature(timestamp, nonce, signature)) {
            throw new IllegalArgumentException("非法请求，可能属于伪造的请求！");
        }

        String out = null;
//        if (encType == null) {
//            // 明文传输的消息
//            WxMpXmlMessage inMessage = WxMpXmlMessage.fromXml(requestBody);
//            WxMpXmlOutMessage outMessage = this.getWxService().route(inMessage);
//            if (outMessage == null) {
//                return "";
//            }
//
//            out = outMessage.toXml();
//        } else if ("aes".equals(encType)) {
//            // aes加密的消息
//            WxMpXmlMessage inMessage = WxMpXmlMessage.fromEncryptedXml(requestBody,
//                    this.getWxService().getWxMpConfigStorage(), timestamp, nonce, msgSignature);
//            log.debug("\n消息解密后内容为：\n{} ", inMessage.toString());
//            WxMpXmlOutMessage outMessage = this.getWxService().route(inMessage);
//            if (outMessage == null) {
//                return "";
//            }
//
//            out = outMessage.toEncryptedXml(this.getWxService().getWxMpConfigStorage());
//        }

        log.debug("\n组装回复信息：{}", out);

        return out;
    }

    protected WeixinService getWxService() {
        return this.wxService;
    }

    @RequestMapping("/index")
    public String index(Model model, HttpServletRequest request, HttpServletResponse response, String code, String ret) throws IOException, WxErrorException {
        HttpSession session = request.getSession();
        String openid = (String) session.getAttribute(Constants.SESSION_OPENID);
        if (StringUtils.isEmpty(openid)) {
            if (StringUtils.isEmpty(code)) {
                String redirect_uri = wxService.oauth2buildAuthorizationUrl(getURL(request), WxConsts.OAuth2Scope.SNSAPI_BASE, "1");
                log.info("redirect_uri =>" + redirect_uri);
                response.sendRedirect(redirect_uri);
                return null;
            } else {
                WxMpOAuth2AccessToken oAuth2AccessToken = wxService.oauth2getAccessToken(code);
                openid = oAuth2AccessToken.getOpenId();
                session.setAttribute(Constants.SESSION_OPENID, openid);
            }
        }
        User user = userService.getByOpenId(openid);
        if (user != null) {
            String retURL = "/wechat/home";
            log.info("ret =>" + ret);
            if (StringUtils.isNotBlank(ret)) {
                retURL = URLDecoder.decode(ret, "UTF-8");
            }
            request.getSession().setAttribute(Constants.SESSION_USER, new UserBean(user));
            return "redirect:" + retURL;
        } else {
            return "redirect:/wechat/register";
        }
    }

    String getURL(HttpServletRequest request) {
        String url = request.getRequestURL().toString();
        if (request.getQueryString() != null) {//判断请求参数是否为空
            url += "?" + request.getQueryString();   // 参数
        }
        return url.replace("127.0.0.1:8888", "test.nonghuobang365.com");
    }

    @RequestMapping(value = "/validateImg")
    public void validateImg(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setContentType("image/jpeg");// 设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");// 设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);// 输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/test1")
    public void test() throws WxErrorException {
        String accerssToken = wxService.getAccessToken();
        String jsApiTicket = wxService.getJsapiTicket();
        // wxService.oauth2buildAuthorizationUrl()
    }

    @ResponseBody
    @RequestMapping("/test2")
    public ApiMsg test2() {
        User user = userService.getById(1L);
        return ApiMsg.success(user);
    }

    @RequestMapping("/test3")
    public String test3() {
        return "redirect:/index";
    }
}
