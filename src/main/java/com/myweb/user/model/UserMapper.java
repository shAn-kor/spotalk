package com.myweb.user.model;

import java.util.List;

public interface UserMapper {
    List<UserDTO> getMember();
    String getPw(String user_id);
    String findId(UserDTO dto);
    UserDTO findPw(String id);
    void updatePw(UserDTO dto);
}
