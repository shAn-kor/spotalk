package com.myweb.user.model;

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
}
