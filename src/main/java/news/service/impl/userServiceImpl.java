package news.service.impl;

import news.dao.IUserDao;
import news.entity.user;
import news.service.IuserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
@Service("UserDao")
public class userServiceImpl implements IuserService {
    @Autowired()
    IUserDao userdao;
    public List<user> login(String username, String password) {

      return userdao.login(username,password);

    }
}
