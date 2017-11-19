package news.service.impl;

import news.dao.InewsnoDao;
import news.entity.newsno;
import news.service.InewsnoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
@Service("newsnoDao")
public class newsnoServiceImpl implements InewsnoService {
    @Resource
    InewsnoDao inewsnoDao;
    public List<newsno> newsList(int type) {
        return inewsnoDao.newsList(type);
    }

    public int addnews(newsno newsnos) {
        return inewsnoDao.addnews(newsnos);
    }

    public List<newsno> newsListtwo(String title, int stutas) {
        return inewsnoDao.newsListtwo(title,stutas);
    }

    public newsno news(int id) {
        return inewsnoDao.news(id);
    }

    public int delete(int id) {
        return inewsnoDao.delete(id);
    }
}
