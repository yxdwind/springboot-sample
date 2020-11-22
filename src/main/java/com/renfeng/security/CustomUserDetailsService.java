package com.renfeng.security;

import com.renfeng.model.SysUser;
import com.renfeng.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/12/6 22:48
 */

@Component
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private SysUserService userService;

    @Override
    public UserDetails loadUserByUsername(String account) throws UsernameNotFoundException {
        SysUser user = userService.selectByLoginName(account);
        if (user == null) {
            throw new UsernameNotFoundException("Username :" + account + "not found");
        }
        SecurityUser securityUser = new SecurityUser(user);
        return securityUser;
    }
}