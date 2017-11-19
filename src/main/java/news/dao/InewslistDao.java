package news.dao;

import news.entity.newslist;
import news.entity.newss;

import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
public interface InewslistDao {

public List<newslist> one(int pid);


public List<newss> two(int pid);
}
