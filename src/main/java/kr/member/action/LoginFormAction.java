package kr.member.action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.controller.Action;
import java.io.IOException;

public class LoginFormAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // 로그인 폼을 보여주기만 하면 되므로 단순히 JSP 경로만 반환
        return "member/loginForm.jsp";
    }
}
