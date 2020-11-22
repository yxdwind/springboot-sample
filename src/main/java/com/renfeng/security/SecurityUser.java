package com.renfeng.security;

import com.renfeng.model.SysRole;
import com.renfeng.model.SysUser;
import com.renfeng.model.SysUserRole;
import com.renfeng.service.SysRoleService;
import com.renfeng.service.SysUserRoleService;
import com.renfeng.util.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/12/6 22:49
 */

public class SecurityUser extends SysUser implements UserDetails {

    private static final long serialVersionUID = 1L;

    @Autowired
    private SysUserRoleService sysUserRoleService;
    @Autowired
    private SysRoleService sysRoleService;

    public SecurityUser(SysUser suser) {

        if (suser != null) {

            this.setId(suser.getId());

            this.setLoginName(suser.getLoginName());

            this.setPassword(suser.getPassword());


            this.setSalt(suser.getSalt());


        }

    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        List<SysUserRole> sysUserRoleList = sysUserRoleService.selectByUserId(getId());
        if (ArrayUtils.isNotEmpty(sysUserRoleList)) {
            for(SysUserRole sysUserRole : sysUserRoleList) {
                SysRole sysRole = sysRoleService.selectByPrimaryKey(sysUserRole.getRoleId());
                SimpleGrantedAuthority authority = new SimpleGrantedAuthority(sysRole.getName());
                authorities.add(authority);
            }
        }
        return authorities;
    }

    @Override
    public String getUsername() {
        return getLoginName();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}