package news.controller;

import news.entity.newslist;
import news.entity.newss;
import news.entity.two;
import news.service.InewslistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
@Controller
public class newsController {
    @Autowired()
    InewslistService newslist;

    public List<news.entity.newslist> Shows(List<news.entity.newslist> one){

        for (news.entity.newslist item:one
                ) {
            if(item.getChildren().size()>0){
                Shows(item.getChildren());
            }else {
                if(null!=item.getUrl()){
                    two t=new two();
                    t.setUrl(item.getUrl());

                 item.setAttributes(t);
                }

            }
        }
        return one;
    }
    public List<news.entity.newss> Show(List<news.entity.newss> two){

        for (news.entity.newss item:two
                ) {
          if(item.getChildren().size()>0){
              Show(item.getChildren());
          }else {

              if(null!=item.getUrl()){
                  news.entity.two t=new two();
                  t.setUrl(item.getUrl());

                  item.setAttributes(t);
              }

          }
        }
        return two;
    }
    @RequestMapping("/one.do")
    @ResponseBody
    public Object one(){

        List<news.entity.newslist> one = newslist.one(0);

          return Shows(one);

    }
    @RequestMapping("/two.do")
    @ResponseBody
    public Object two(){

        List<newss> one = newslist.two(0);

        return Show(one);

    }

}
