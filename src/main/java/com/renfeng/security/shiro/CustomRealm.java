package com.renfeng.security.shiro;

import com.renfeng.common.Result;
import com.renfeng.model.SysUser;
import com.renfeng.service.SysUserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

/**
 * 授权域
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2020/4/13 22:33
 */
public class CustomRealm extends AuthorizingRealm {
    @Autowired
    private SysUserService sysUserService;

    /**
     * 获取认证信息
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String) authenticationToken.getPrincipal();
        String password = (String) authenticationToken.getCredentials();
        SysUser user = sysUserService.selectByLoginName(username);
        if(user == null){
            return null;
        }
        Result result = sysUserService.doLogin(username,password);
        if(result.isStatus()){
            return new SimpleAuthenticationInfo(user,password,getName());
        }
        return null;
    }

    /**
     * 获取授权信息
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        for (Object principal : principalCollection.fromRealm(getName())) {
            if (principal != null && principal instanceof SysUser) {
                SysUser user = (SysUser) principal;
                Set<String> permissions = sysUserService.getPermissions(user);
                if (permissions != null) {
                    authorizationInfo.addStringPermissions(permissions);
                }
            }
        }
        return authorizationInfo;
    }

}
