package com.hanhe.college.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Preconditions;
import com.hanhe.college.common.ApiMsg;
import com.hanhe.college.common.RequestHolder;
import com.hanhe.college.common.UserBean;
import com.hanhe.college.constant.Constants;
import com.hanhe.college.entity.Administrator;
import com.hanhe.college.param.admin.PasswordParam;
import com.hanhe.college.service.AdministratorService;

/**
 * Created by Angelo on 2018/7/27.
 */
@Controller
@RequestMapping("/admin")
public class LoginController {
    @Autowired
    AdministratorService administratorService;

    public String index() {
        return "index";
    }

    @RequestMapping(value = "/login.page", method = RequestMethod.GET)
    public String login(Model model, Boolean error) {
        if (error != null && error.booleanValue()) {
            model.addAttribute("error", "账户密码不匹配");
        }
        return "admin/login";
    }

    @RequestMapping("/home.page")
    public String homePage(ModelMap model, HttpSession session) {
        String userName = getPrincipal();
        Administrator administrator = administratorService.getByName(userName);
        administratorService.updateLoginTime(administrator.getId());
        session.setAttribute(Constants.SESSION_USER, new UserBean(administrator));
        String redirectUrl = null;
        if (administrator.getType() == Constants.ADMINISTRATOR_TYPE_EXPERT) {
            redirectUrl = "/admin/knowledge/expert/expert_article.page";
        } else if (administrator.getType() == Constants.ADMINISTRATOR_TYPE_MASTER) {
            redirectUrl = "/admin/user/site/apply_manage.page";
        } else {
            String role = getAuthority();
            if ("ROLE_ADMIN".equals(role) || "ROLE_KNOWLEDGE".equals(role)) {
                redirectUrl = "/admin/knowledge/baike.page";
            } else if ("ROLE_COURSE".equals(role)) {
                redirectUrl = "/admin/course/course_manage.page";
            } else if ("ROLE_EXAM".equals(role)) {
                redirectUrl = "/admin/course/course_manage.page";
            } else if ("ROLE_TRAINING".equals(role)) {
                redirectUrl = "/admin/training/field_training.page";
            } else if ("ROLE_QA".equals(role)) {
                redirectUrl = "/admin/qa/expert/expert_ask.page";
            } else if ("ROLE_USER".equals(role)) {
                redirectUrl = "/admin/user/manager_manage.page";
            } else if ("ROLE_CONFIG".equals(role)) {
                redirectUrl = "/admin/config/identity_configuration.page";
            }
        }
        return "redirect:" + redirectUrl;
    }

    @RequestMapping("/denied/{errorCode}")
    public String deny(Model model, @PathVariable("errorCode") Integer errorCode) throws IOException {
        String error = "出现异常，请稍后再试";
        if (errorCode != null) {
            switch (errorCode) {
                case 1:
                case 2:
                    error = "对不起，您暂无权限，请刷新后再试";
                    break;
                default:
                    error = "系统异常，请刷新后再试";
            }
        }
        model.addAttribute("error",error);
        return "admin/exception";
    }

    @RequestMapping("/person_center.page")
    public String person_center(Model model) {
        long id = RequestHolder.getCurrentUserBean().getId();
        Administrator admin = administratorService.getById(id);
        Preconditions.checkNotNull(admin, "待查看的管理员不存在");
        model.addAttribute("admin", admin);
        return "admin/person_center";
    }

    @ResponseBody
    @RequestMapping("/modifyPwd.json")
    public ApiMsg modifyPwd(PasswordParam param) {
        int result = administratorService.modifyPwd(param);
        return result > 0 ? ApiMsg.success() : ApiMsg.fail("修改密码失败");
    }

    private String getPrincipal(){
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails)principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    public String getAuthority() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            List<GrantedAuthority> authorityList = ((UserDetails) principal).getAuthorities().stream().collect(Collectors.toList());
            if (authorityList.size() > 0) {
                return authorityList.get(0).getAuthority();
            }
        }
        return "";
    }
}
