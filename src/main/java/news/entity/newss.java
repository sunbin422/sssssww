package news.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by sunbin on 2017/11/6.
 */
public class newss {
    private int id;
    private String text;
    private List<newss> children=new ArrayList<newss>();
    private   String iconCls;
    private String url;
    private two attributes;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<newss> getChildren() {
        return children;
    }

    public void setChildren(List<newss> children) {
        this.children = children;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public two getAttributes() {
        return attributes;
    }

    public void setAttributes(two attributes) {
        this.attributes = attributes;
    }
}
