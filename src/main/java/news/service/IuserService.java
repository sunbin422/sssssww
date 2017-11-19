package news.service;

import news.entity.newslist;
import news.entity.user;

import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
public interface IuserService {
    public List<user> login(String username, String password);
}
