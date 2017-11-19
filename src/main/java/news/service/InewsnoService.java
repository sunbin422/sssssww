package news.service;

import news.entity.newsno;

import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
public interface InewsnoService {
    public List<newsno> newsList(int type);
    public  int addnews(newsno newsnos);
    public List<newsno>newsListtwo(String title,int stutas);
    public  newsno news(int id);
    public int delete(int id);
}
