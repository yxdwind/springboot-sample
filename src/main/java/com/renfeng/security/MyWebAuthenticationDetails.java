package com.renfeng.security;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import javax.servlet.http.HttpServletRequest;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/12/6 15:42
 */
@Data
@Setter
@Getter
@ToString
//@Component
public class MyWebAuthenticationDetails extends WebAuthenticationDetails {

    private static final long serialVersionUID = 6975601077710753878L;

    private String username;

    private String password;

    private String validcode;

    private String sessionCodeValue;

    private long sessionCodeTime;

    public MyWebAuthenticationDetails(HttpServletRequest request) {
        super(request);
        username = request.getParameter("loginName");
        password = request.getParameter("password");
        validcode = request.getParameter("validateCode");
        sessionCodeValue = (String)request.getSession().getAttribute("codeValue");
        sessionCodeTime = (Long)request.getSession().getAttribute("codeTime");
    }
}
