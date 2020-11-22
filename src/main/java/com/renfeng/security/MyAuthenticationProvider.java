package com.renfeng.security;

import com.renfeng.model.SysUser;
import com.renfeng.service.SysUserService;
import com.renfeng.util.EncryptUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collection;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/12/6 15:52
 */
@Component
public class MyAuthenticationProvider implements AuthenticationProvider {

    protected Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    SysUserService sysUserService;

    @Override
    public Authentication authenticate(Authentication authentication)
            throws AuthenticationException {
        log.info("now start custom authenticate process!");
        MyWebAuthenticationDetails details = (MyWebAuthenticationDetails) authentication.getDetails();

//        //校验码判断
//        if (!details.getValidcode().equals(details.getSessionCodeValue())) {
//            log.info("validate code error");
//            throw new BadCredentialsException("authenticate fail！");
//        }
//
//        //校验码有效期
//        if ((new Date()).getTime() - details.getSessionCodeTime() > 60000) {
//            log.info("validate code expired!");
//            throw new BadCredentialsException("authenticate fail！");
//        }

        //验密
        try {
            SysUser sysUser = sysUserService.selectByLoginName(details.getUsername());

            if (!sysUser.getPassword().equals(EncryptUtils.md5(details.getPassword() + sysUser.getSalt()))) {
                log.info("password error");
                throw new BadCredentialsException("authenticate fail！");
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        Collection<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
        auths.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        return new UsernamePasswordAuthenticationToken(details.getUsername(), details.getPassword(), auths);

    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

}