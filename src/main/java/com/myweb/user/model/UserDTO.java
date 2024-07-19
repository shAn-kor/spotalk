package com.myweb.user.model;

import java.sql.Date;

public class UserDTO {
    String id;
    String pw;
    String pwq;
    String pwa;
    String name;
    Date bDate;
    String gender;
    String phone;
    String nick;
    String point;
    String gradeId;
    Date sDate;
    
    public UserDTO() {    }    
    
    public UserDTO(String id, String pw, String pwq, String pwa, String name, Date b_date, String phone, String nick, String point, String grade_id, Date s_date) {
        this.id = id;
        this.pw = pw;
        this.pwq = pwq;
        this.pwa = pwa;
        this.name = name;
        this.bDate = b_date;
        this.phone = phone;
        this.nick = nick;
        this.point = point;
        this.gradeId = grade_id;
        this.sDate = s_date;
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

    public Date getBDate() {
        return bDate;
    }

    public void setBDate(Date b_date) {
        this.bDate = b_date;
    }
    
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getGradeId() {
        return gradeId;
    }

    public void setGradeId(String grade_id) {
        this.gradeId = grade_id;
    }

    public Date getSDate() {
        return sDate;
    }

    public void setSDate(Date s_date) {
        this.sDate = s_date;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", pwq='" + pwq + '\'' +
                ", pwa='" + pwa + '\'' +
                ", name='" + name + '\'' +
                ", b_date='" + bDate + '\'' +
                ", phone='" + phone + '\'' +
                ", nick='" + nick + '\'' +
                ", point='" + point + '\'' +
                ", grade_id='" + gradeId + '\'' +
                ", s_date='" + sDate + '\'' +
                '}';
    }
}
