package news.controller;

import news.entity.newsno;
import news.entity.user;
import news.service.InewsnoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
@Controller
public class newsnoCotroller {
    @Autowired()
    InewsnoService inewsnoService;

    @RequestMapping("/homenews.do")
    @ResponseBody
    public Object listnews(){

        List<newsno> newsnos = inewsnoService.newsList(1);

        for (newsno item:newsnos
             ) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            item.setDate(sdf.format(item.getTime()));
           item.setTypename(item.getNewstype().getTypename());
           item.setStutasnames(item.getStutas().getStutasname());
            System.out.println(item.getImg());
        }

       return  newsnos;

    }
    @RequestMapping("/addnews.do")
    @ResponseBody
    public Object addnews(HttpServletRequest request,newsno newsnos){

        System.out.println(newsnos.getTypename());
             newsnos.setTime(new Date());
             newsnos.setZan(0);
             newsnos.setClick(0);
             newsnos.setTypeid(1);
             newsnos.setStatus(1);
        String stutas2 = request.getParameter("st");
        String titlecolor = request.getParameter("titlecolor");
        System.out.println(stutas2);
        newsnos.setStatus(Integer.parseInt(stutas2));
             String us=(String) request.getSession().getAttribute("user");
             newsnos.setUser(us);
             newsnos.setTitlecolor(titlecolor);
       return inewsnoService.addnews(newsnos);
    }
    @RequestMapping("/prolists.do")
    @ResponseBody
    public Object newslisttwo(HttpServletRequest request){
       String title= request.getParameter("title");
       int stutas=Integer.parseInt(request.getParameter("stutas"));
   if(("").equals(title)){
       title=null;
   }
        List<newsno> newsnos =inewsnoService.newsListtwo(title,stutas);
        for (newsno item:newsnos
                ) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            item.setDate(sdf.format(item.getTime()));
            item.setTypename(item.getNewstype().getTypename());
            item.setStutasnames(item.getStutas().getStutasname());
        }
        return   newsnos;

    }
    @RequestMapping("/update.do")
    @ResponseBody
    public Object  up(HttpServletRequest request){

      int id=Integer.parseInt(request.getParameter("id"));

       request.getSession().setAttribute("img",inewsnoService.news(id).getImg());
     return inewsnoService.news(id);
    }
    @RequestMapping("/delete.do")
    @ResponseBody
    public Object  delete(HttpServletRequest request){

        int id=Integer.parseInt(request.getParameter("id"));

       inewsnoService.delete(id);
        List<newsno> newsnos = inewsnoService.newsList(1);

        for (newsno item:newsnos
                ) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            item.setDate(sdf.format(item.getTime()));
            item.setTypename(item.getNewstype().getTypename());
            item.setStutasnames(item.getStutas().getStutasname());
            System.out.println(item.getImg());
        }

        return  newsnos;
    }
}
