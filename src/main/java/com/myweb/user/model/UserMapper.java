package com.myweb.user.model;

import java.util.List;

public interface UserMapper {
    String getPw(String user_id);
    String findId(UserDTO dto);
    UserDTO getUserById(String id);
    void updatePw(UserDTO dto);
    UserDTO checkPhone(String phone);
}
