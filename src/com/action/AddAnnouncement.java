package com.action;

import com.dao.AnnouncementDao;

/**
 * Created by Admin on 2017/6/9.
 */
public class AddAnnouncement {
    private String title;
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {

        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void execute() throws Exception{
        new AnnouncementDao().addAnnouncement(title,content);
    }
}
