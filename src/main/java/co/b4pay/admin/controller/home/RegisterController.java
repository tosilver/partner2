package co.b4pay.admin.controller.home;

import co.b4pay.admin.common.constants.LinkConstants;
import co.b4pay.admin.common.core.constants.Constants;
import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.system.entity.Admin;
import co.b4pay.admin.common.system.service.AdminService;
import co.b4pay.admin.common.util.StringUtil;
import co.b4pay.admin.common.web.BaseController;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 登录控制器
 *
 * @author mac
 */
@Controller
@RequestMapping({"/register"})
public class RegisterController extends BaseController {

    @Autowired
    private AdminService adminService;


    private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);



    @RequestMapping(method = RequestMethod.GET)
    public String doGet() {
        return "register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String doPost(HttpServletRequest request ) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String invitationCode = request.getParameter("invitationCode");

        Admin admin = new Admin();
        admin.setUsername(username);
        admin.setPassword(password);
        Admin user = adminService.createUser(admin);

        adminService.startUsing(user.getId());
        return "login";
    }

    /**
     * 根据用户名查询
     * @throws IOException
     */
    @RequestMapping(value = "/findBrandByName",method = RequestMethod.GET)
    @ResponseBody
    public String findBrandByName(String username) throws IOException {
        //初始化
        String message="";
        boolean flag=true;
        //查询是否有输入的用户名
        Admin byUsername = adminService.getByUsername(username);
        //如果为0（没有该用户名）即可用
        if(byUsername==null){
            return "{\"msg\":\"true\"}";
        }else{

            return "{\"msg\":\"false\"}";
        }
    }

    /**
     * 根据用户名查询
     * @throws IOException
     */
    @RequestMapping(value = "/findByCode",method = RequestMethod.GET)
    @ResponseBody
    public String findByCode(String invitationCode) throws IOException {
        //查询是否有输入的用户名
        Admin byUsername = adminService.findByCode(invitationCode);
        //如果为0（没有该用户名）即可用
        if(byUsername==null){
            return "{\"msg\":\"true\"}";
        }else{

            return "{\"msg\":\"false\"}";
        }
    }

}
