package com.myweb.user.model;

import java.sql.Date;
import java.util.List;

public interface UserMapper {
    String getPw(String user_id);
    String findId(UserDTO dto);
    UserDTO getUserById(String id);
    UserDTO getUserByNick(String nick);
    void updatePw(UserDTO dto);
    UserDTO checkPhone(String phone);
    List<UserDTO> getUserList();
    void createUser(UserDTO dto);

    int changeNick(UserDTO dto);

    void deleteUser(String id);

    void setPoint(UserDTO dto);

    void updateGrade(UserDTO dto);

    Date getDateByAttendance(String nick);

    void updateAttendanceDate(String nick);
}
