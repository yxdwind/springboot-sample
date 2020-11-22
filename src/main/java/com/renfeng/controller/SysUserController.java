package com.renfeng.controller;

import com.renfeng.common.Result;
import com.renfeng.common.ResultCodeEnum;
import com.renfeng.model.SysRole;
import com.renfeng.model.SysUser;
import com.renfeng.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

/**
 * 用户管理
 *
 * @author yanxiaodong
 */
@Slf4j
@RestController
@Api(tags = "用户模块api")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    /**
     * 查询用户实体对象SysUser
     */
    @GetMapping(value = "/users/name/{username}")
    @ApiOperation(value = "根据用户名查询用户实体")
    public SysUser selectByUsername(@PathVariable String username) {
        return sysUserService.selectByLoginName(username);
    }


    @GetMapping("/users/{id}")
    public SysUser findUserById(@PathVariable String id) {
        return sysUserService.selectByPrimaryKey(id);
    }

    /**
     * 管理后台修改用户
     *
     * @param sysUser
     */
    @PutMapping("/users")
    public void updateSysUser(@RequestBody SysUser sysUser) {
        sysUserService.saveOrUpdate(sysUser);
    }

    /**
     * 管理后台给用户分配角色
     *
     * @param id
     * @param roleIds
     */
    @PostMapping("/users/{id}/roles")
    public void setRoleToUser(@PathVariable String id, @RequestBody Set<String> roleIds) {
        sysUserService.setRoleToUser(id, roleIds);
    }

    /**
     * 获取用户的角色
     *
     * @param
     * @return
     */
    @GetMapping("/users/{id}/roles")
    public List<SysRole> findRolesByUserId(@PathVariable String id) {
        return sysUserService.selectRolesByUserId(id);
    }


    /**
     * 删除用户
     *
     * @param id
     */
    @DeleteMapping(value = "/users/{id}")
    public Result delete(@PathVariable String id) {
        if(sysUserService.deleteByPrimaryKey(id)>=0){
            return Result.success("删除成功");
        }
        return Result.bizError(ResultCodeEnum.OperateError);
    }


    /**
     * 新增or更新
     *
     * @param sysUser
     * @return
     */
    @PostMapping("/users/saveOrUpdate")
    public Result saveOrUpdate(@RequestBody SysUser sysUser) {
        if(sysUserService.saveOrUpdate(sysUser)){
            return Result.success("保存成功");
        }
        return Result.bizError(ResultCodeEnum.OperateError);
    }


}
