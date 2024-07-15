package com.myweb.user.model;

public class UserDTO {
    String id;
    String pw;
    String pwq;
    String pwa;
    String name;
    String b_date;
    String phone;
    String nick;
    String point;
    String grade_id;
    String s_date;
    
    public UserDTO() {    }    
    
    public UserDTO(String id, String pw, String pwq, String pwa, String name, String b_date, String phone, String nick, String point, String grade_id, String s_date) {
        this.id = id;
        this.pw = pw;
        this.pwq = pwq;
        this.pwa = pwa;
        this.name = name;
        this.b_date = b_date;
        this.phone = phone;
        this.nick = nick;
        this.point = point;
        this.grade_id = grade_id;
        this.s_date = s_date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getPwq() {
        return pwq;
    }

    public void setPwq(String pwq) {
        this.pwq = pwq;
    }

    public String getPwa() {
        return pwa;
    }

    public void setPwa(String pwa) {
        this.pwa = pwa;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getB_date() {
        return b_date;
    }

    public void setB_date(String b_date) {
        this.b_date = b_date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getPoint() {
        return point;
    }

    public void setPoint(String point) {
        this.point = point;
    }

    public String getGrade_id() {
        return grade_id;
    }

    public void setGrade_id(String grade_id) {
        this.grade_id = grade_id;
    }

    public String getS_date() {
        return s_date;
    }

    public void setS_date(String s_date) {
        this.s_date = s_date;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", pwq='" + pwq + '\'' +
                ", pwa='" + pwa + '\'' +
                ", name='" + name + '\'' +
                ", b_date='" + b_date + '\'' +
                ", phone='" + phone + '\'' +
                ", nick='" + nick + '\'' +
                ", point='" + point + '\'' +
                ", grade_id='" + grade_id + '\'' +
                ", s_date='" + s_date + '\'' +
                '}';
    }
}
