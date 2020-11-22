package com.renfeng.controller;


import com.renfeng.common.Result;
import com.renfeng.common.ResultCodeEnum;
import com.renfeng.model.SysRole;
import com.renfeng.service.SysRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 角色管理
 *
 * @author yanxiaodong
 */
@Slf4j
@RestController
@Api(tags = "角色模块api")
public class SysRoleController {
    @Autowired
    private SysRoleService sysRoleService;

    /**
     * 用户管理查询所有角色
     *
     * @return
     */
    @ApiOperation(value = "后台管理查询角色")
    @GetMapping("/allRoles")
    public Result<List<SysRole>> findAll() {
        List<SysRole> result = sysRoleService.selectSysRoleList();
        return Result.success(result);
    }

    /**
     * 角色新增或者更新
     *
     * @param sysRole
     * @return
     */
    @PostMapping("/roles/saveOrUpdate")
    public Result saveOrUpdate(@RequestBody SysRole sysRole) {
        if (sysRoleService.saveOrUpdate(sysRole)) {
            return Result.success("操作成功");
        }
        return Result.bizError(ResultCodeEnum.OperateError);
    }

    /**
     * 后台管理删除角色
     * delete /role/1
     *
     * @param id
     */
    @ApiOperation(value = "后台管理删除角色")
    @DeleteMapping("/roles/{id}")
    public Result deleteRole(@PathVariable String id) {
        if (sysRoleService.deleteByPrimaryKey(id) >= 0) {
            return Result.success("操作成功");
        }
        return Result.bizError(ResultCodeEnum.OperateError);
    }
}
