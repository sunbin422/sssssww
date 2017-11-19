package news.controller;

import news.entity.user;
import news.service.IuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
@Controller
public class userController  {
    @Autowired()
    IuserService userservice;

    @RequestMapping("/login.do")
    public String login(String user , String pwd, HttpServletRequest request){
        List<news.entity.user> login = userservice.login(user, pwd);

        if(  login.size()>0){

            for (user item:login
                 ) {
                request.getSession().setAttribute("user",item.getUsername());
            }

          return "/tree";

      }else {
            request.setAttribute("login","账号密码错误");
          return "/login";
      }



    }
}
