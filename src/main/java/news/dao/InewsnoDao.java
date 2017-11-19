package news.dao;

import news.entity.newsno;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
public interface InewsnoDao {
    public  List<newsno> newsList(int type);
    public  newsno news(int id);
    public  int addnews(newsno newsnos);
    public List<newsno>newsListtwo(@Param("title")String title, @Param("status")int status);
    public int delete(int id);
}
