package com.renfeng.controller;


import cn.hutool.core.collection.CollectionUtil;
import com.renfeng.common.Result;
import com.renfeng.common.ResultCodeEnum;
import com.renfeng.model.SysMenu;
import com.renfeng.model.SysRole;
import com.renfeng.service.SysMenuService;
import com.renfeng.service.SysRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 菜单管理
 *
 * @author yanxiaodong
 */
@RestController
@Api(tags = "菜单模块api")
@Slf4j
@RequestMapping("/menus")
public class SysMenuController {
    @Autowired
    private SysMenuService menuService;
    @Autowired
    private SysRoleService sysRoleService;


    /**
     * 两层循环实现建树
     *
     * @param sysMenus
     * @return
     */
    public static List<SysMenu> treeBuilder(List<SysMenu> sysMenus) {
        List<SysMenu> menus = new ArrayList<>();
        for (SysMenu sysMenu : sysMenus) {
            for (SysMenu menu : sysMenus) {
                if (menu.getParentId().equals(sysMenu.getId())) {
                    if (sysMenu.getSysMenuList() == null) {
                        sysMenu.setSysMenuList(new ArrayList<>());
                    }
                    sysMenu.getSysMenuList().add(menu);
                }
            }
        }
        return menus;
    }

    /**
     * 删除菜单
     *
     * @param id
     */
    @ApiOperation(value = "删除菜单")
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable String id) {
        if (menuService.deleteRecord(id)) {
            return Result.success("操作成功");
        }
        return Result.bizError(ResultCodeEnum.OperateError);
    }

    @ApiOperation(value = "根据roleId获取对应的菜单")
    @GetMapping("/{roleId}/menus")
    public List<Map<String, Object>> findMenusByRoleId(@PathVariable String roleId) {
        Set<String> roleIds = new HashSet<>();
        roleIds.add(roleId);
        //获取该角色对应的菜单
        List<SysMenu> roleMenus = menuService.findByRoles(roleIds);
        //全部的菜单列表
        List<SysMenu> allMenus = menuService.findSysMenuList();
        List<Map<String, Object>> authTrees = new ArrayList<>();

        Map<String, SysMenu> roleMenusMap = roleMenus.stream().collect(Collectors.toMap(SysMenu::getId, SysMenu -> SysMenu));

        for (SysMenu sysMenu : allMenus) {
            Map<String, Object> authTree = new HashMap<>();
            authTree.put("id", sysMenu.getId());
            authTree.put("name", sysMenu.getName());
            authTree.put("pId", sysMenu.getParentId());
            authTree.put("open", true);
            authTree.put("checked", false);
            if (roleMenusMap.get(sysMenu.getId()) != null) {
                authTree.put("checked", true);
            }
            authTrees.add(authTree);
        }
        return authTrees;
    }


    /**
     * 添加菜单 或者 更新
     *
     * @param menu
     * @return
     */
    @ApiOperation(value = "新增菜单")
    @PostMapping("saveOrUpdate")
    public Result saveOrUpdate(@RequestBody SysMenu menu) {
        if(menuService.saveOrUpdate(menu)){
            return Result.success("操作成功");
        }
        return Result.bizError(ResultCodeEnum.OperateError);
    }

    /**
     * 当前登录用户的菜单
     *
     * @return
     */
    @GetMapping("/current")
    @ApiOperation(value = "查询当前用户菜单")
    public List<SysMenu> findMyMenu(@PathVariable String loginName) {
        List<SysRole> roles = sysRoleService.getUserRole(loginName);
        if (CollectionUtil.isEmpty(roles)) {
            return Collections.emptyList();
        }
        List<SysMenu> menus = menuService.findByRoles(roles.parallelStream().map(SysRole::getId).collect(Collectors.toSet()));
        return treeBuilder(menus);
    }
}
