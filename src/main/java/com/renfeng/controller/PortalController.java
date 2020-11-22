package com.renfeng.controller;

import com.alibaba.fastjson.JSONObject;
import com.renfeng.common.Result;
import com.renfeng.common.ResultCodeEnum;
import com.renfeng.common.ThreadLocalManager;
import com.renfeng.model.SysMenu;
import com.renfeng.model.SysUser;
import com.renfeng.service.SysMenuService;
import com.renfeng.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:25
 */
@RestController
@RequestMapping(value = "/portal")
@Api(tags = "首页")
public class PortalController {

    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysMenuService sysMenuService;
//    @Autowired
//    private SessionRegistry sessionRegistry;

    @PostMapping(value = "/doLogin")
    @ApiOperation(value = "登录" ,httpMethod ="POST",  notes="登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "loginName", value = "登录名", required = true, dataType = "String", paramType = "path"),
            @ApiImplicitParam(name = "password", value = "密码", required = true, dataType = "String", paramType = "path")
    })
    public Result doLogin(@RequestParam String loginName, @RequestParam String password, HttpServletRequest request) {
        Result result = sysUserService.doLogin(loginName, password);

        if(result.isStatus()){
            request.getSession().setAttribute("user",result.getData());
            List<SysMenu> list = sysMenuService.findSysMenuList();
            List<SysMenu> ownerList=sysUserService.getUserMenu(loginName);
            for (int i = list.size(); i > 0; i--) {
                //判断一级菜单
                if(ownerList.contains(list.get(i-1))){
                    //判断三级菜单
                    compareList(list.get(i-1).getSysMenuList(),ownerList);
                }else{
                    list.remove(list.get(i-1));
                }
            }
            ThreadLocalManager.me().put("sysUser",result.getData());
            return Result.success(list);
        }
        return result;
    }

    @RequestMapping("/login")
    public Result login(SysUser user){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(),user.getPassword());
        try {
            subject.login(token);
        }catch (AuthenticationException e){
            e.printStackTrace();
            return Result.bizError(ResultCodeEnum.LoginFail);
        }catch (AuthorizationException e) {
            e.printStackTrace();
            return Result.bizError(ResultCodeEnum.PermissionNotFound);
        }
        return Result.success();
    }

    private void compareList(List<SysMenu> sonList,List<SysMenu> ownerList){
        for (int i =sonList.size() ; i >0; i--) {
            //判断二级菜单
            if(ownerList.contains(sonList.get(i-1))){
                //判断三级菜单
                compareList(sonList.get(i-1).getSysMenuList(),ownerList);
            }else{
                sonList.remove(sonList.get(i-1));
            }

        }
    }

    @PostMapping(value = "signOut")
    @ApiOperation(value = "退出" ,httpMethod ="POST",  notes="退出")
    public Result signOut(HttpServletRequest request) {
        request.getSession().invalidate();
        ThreadLocalManager.me().release();
        return Result.success();
    }

    @RequestMapping("invalid")
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ResponseBody
    public String invalid() {
        return "Session 已过期，请重新登录";
    }

//    @GetMapping("/kick")
//    @ResponseBody
//    public String removeUserSessionByUsername(@RequestParam String username) {
//        int count = 0;
//
//        // 获取session中所有的用户信息
//        List<Object> users = sessionRegistry.getAllPrincipals();
//        for (Object principal : users) {
//            if (principal instanceof SysUser) {
//                String principalName = ((SysUser)principal).getLoginName();
//                if (principalName.equals(username)) {
//                    // 参数二：是否包含过期的Session
//                    List<SessionInformation> sessionsInfo = sessionRegistry.getAllSessions(principal, false);
//                    if (null != sessionsInfo && sessionsInfo.size() > 0) {
//                        for (SessionInformation sessionInformation : sessionsInfo) {
//                            sessionInformation.expireNow();
//                            count++;
//                        }
//                    }
//                }
//            }
//        }
//        return "操作成功，清理session共" + count + "个";
//    }
    /**
     * 未登录，shiro应重定向到登录界面，此处返回未登录状态信息由前端控制跳转页面
     * @return
     */
    @RequestMapping(value = "/unauth")
    @ResponseBody
    public JSONObject unauth() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", "1000000");
        jsonObject.put("msg", "未登录");
        return jsonObject;
    }
}
