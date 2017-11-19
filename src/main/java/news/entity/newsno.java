package news.entity;

import java.util.Date;

/**
 * Created by sunbin on 2017/11/6.
 */
public class newsno
{
    private int status;
    private int id;
    private int typeid;
    private int zan;
    private int click;
    private String user;
    private String title;
    private String context;
    private Date time;
    private String date;
    private newstype newstype;
  private String typename;
  private stutas stutas;
  private String stutasnames;
  private String titlecolor;
  private String quanzhong;
  private String huiyuan;
  private String selectword;
  private String job;
  private String img;
  private String contextone;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int type) {
        this.typeid = type;
    }

    public int getZan() {
        return zan;
    }

    public void setZan(int zan) {
        this.zan = zan;
    }

    public int getClick() {
        return click;
    }

    public void setClick(int click) {
        this.click = click;
    }

    public String  getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }



    public news.entity.newstype getNewstype() {
        return newstype;
    }

    public void setNewstype(news.entity.newstype newstype) {
        this.newstype = newstype;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public news.entity.stutas getStutas() {
        return stutas;
    }

    public void setStutas(news.entity.stutas stutas) {
        this.stutas = stutas;
    }

    public String getStutasnames() {
        return stutasnames;
    }

    public void setStutasnames(String stutasnames) {
        this.stutasnames = stutasnames;
    }

    public String getQuanzhong() {
        return quanzhong;
    }

    public void setQuanzhong(String quanzhong) {
        this.quanzhong = quanzhong;
    }

    public String getHuiyuan() {
        return huiyuan;
    }

    public void setHuiyuan(String huiyuan) {
        this.huiyuan = huiyuan;
    }

    public String getSelectword() {
        return selectword;
    }

    public void setSelectword(String selectword) {
        this.selectword = selectword;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getContextone() {
        return contextone;
    }

    public void setContextone(String contextone) {
        this.contextone = contextone;
    }

    public String getTitlecolor() {
        return titlecolor;
    }

    public void setTitlecolor(String titlecolor) {
        this.titlecolor = titlecolor;
    }
}
