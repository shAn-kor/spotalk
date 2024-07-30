package com.myweb.user.model;

import java.sql.Date;
import java.text.DecimalFormat;
import java.util.Arrays;

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
    
    public UserDTO(String id, String pw, String pwq, String pwa, String name, Date bDate, String phone, String nick, String point, String gradeId, Date sDate) {
        this.id = id;
        this.pw = pw;
        this.pwq = pwq;
        this.pwa = pwa;
        this.name = name;
        this.bDate = bDate;
        this.phone = phone;
        this.nick = nick;
        this.point = point;
        this.gradeId = gradeId;
        this.sDate = sDate;
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
                ", bDate='" + bDate + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", nick='" + nick + '\'' +
                ", point='" + point + '\'' +
                ", gradeId='" + gradeId + '\'' +
                ", sDate='" + sDate + '\'' +
                '}';
    }

    public String toJSONString() {
        return "{" +
                "'id':'" + id + "'" +
                ", 'pw':'" + pw + "'" +
                ", 'pwq':'" + pwq + "'" +
                ", 'pwa':'" + pwa + "'" +
                ", 'name':'" + name + "'" +
                ", 'bDate':'" + bDate + "'" +
                ", 'gender':'" + gender + "'" +
                ", 'phone':'" + phone + "'" +
                "', 'nick':'" + nick + "'" +
                ", 'point':'" + point + "'" +
                ", 'gradeId':'" + gradeId + "'" +
                ", 'sDate':'" + sDate + "'" +
                '}';
    }

    public static UserDTO parseJSONToUserDTO(String json) {
        System.out.println(json);

        UserDTO dto = new UserDTO();

        String[] str = json.replace("{", "").replace("}", "").trim().split(", ");

        System.out.println(Arrays.toString(str));
        for (String s : str) {
            s = s.replace("'", "");
            String[] arr = s.split(":");
            if (arr[1].equals("null")) continue;

            if (arr[0].equals("id")) dto.setId(arr[1]);
            if (arr[0].equals("pw")) dto.setPw(arr[1]);
            if (arr[0].equals("pwq")) dto.setPwq(arr[1]);
            if (arr[0].equals("pwa")) dto.setPwa(arr[1]);
            if (arr[0].equals("name")) dto.setName(arr[1]);
            if (arr[0].equals("bDate")) dto.setBDate(Date.valueOf(arr[1]));
            if (arr[0].equals("gender")) dto.setGender(arr[1]);
            if (arr[0].equals("phone")) dto.setPhone(arr[1]);
            if (arr[0].equals("nick")) dto.setNick(arr[1]);
            if (arr[0].equals("point")) dto.setPoint(arr[1]);
            if (arr[0].equals("gradeId")) dto.setGradeId(arr[1]);
            if (arr[0].equals("sDate")) dto.setId(arr[1]);
        }

        return dto;
    }

    public String getPointFmt() {
        // 포맷된 숫자를 저장할 변수
        String formattedPoint = "";

        // 문자열을 숫자로 변환
        Long number = Long.parseLong(point);

        // 숫자를 포맷
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        formattedPoint = decimalFormat.format(number);

        return formattedPoint;
    }
}
