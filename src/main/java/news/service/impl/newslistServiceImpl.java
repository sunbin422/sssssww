package news.service.impl;

import news.dao.InewslistDao;
import news.entity.newslist;
import news.entity.newss;
import news.service.InewslistService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
@Service("newslistDao")
public class newslistServiceImpl implements InewslistService {
    @Resource
    InewslistDao newslist;

    public List<news.entity.newslist> one(int tid) {
        return newslist.one(tid);
    }

    public List<newss> two(int pid) {
        return newslist.two(pid);
    }
}
