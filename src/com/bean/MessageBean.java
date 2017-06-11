package com.bean;

/**
 * Created by kh on 2017/5/18.
 */
public class MessageBean {
    private String M_Id;
    private String M_Theme;
    private String M_From;
    private String M_To;
    private String M_Content;
    private String M_Flag;

    public String getM_Id() {
        return M_Id;
    }

    public void setM_Id(String m_Id) {
        M_Id = m_Id;
    }

    public String getM_Flag() {
        return M_Flag;
    }

    public void setM_Flag(String m_Flag) {
        M_Flag = m_Flag;
    }

    public String getM_Content() {

        return M_Content;
    }

    public void setM_Content(String m_Content) {
        M_Content = m_Content;
    }

    public String getM_To() {

        return M_To;
    }

    public void setM_To(String m_To) {
        M_To = m_To;
    }

    public String getM_From() {

        return M_From;
    }

    public void setM_From(String m_From) {
        M_From = m_From;
    }

    public String getM_Theme() {

        return M_Theme;
    }

    public void setM_Theme(String m_Theme) {
        M_Theme = m_Theme;
    }
}
