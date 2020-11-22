package com.renfeng.service.impl;

import com.renfeng.common.Constants;
import com.renfeng.dao.mapper.SysRoleMenuMapper;
import com.renfeng.model.SysRoleMenu;
import com.renfeng.service.SysRoleMenuService;
import com.renfeng.util.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/11/4 16:32
 */
@Service
public class SysRoleMenuServiceImpl implements SysRoleMenuService {


    @Resource
    SysRoleMenuMapper sysRoleMenuMapper;

    @Override
    public int deleteByPrimaryKey(String id) {
        return sysRoleMenuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SysRoleMenu record) {
        return sysRoleMenuMapper.insert(record);
    }

    @Override
    public int insertSelective(SysRoleMenu record) {
        return sysRoleMenuMapper.insertSelective(record);
    }

    @Override
    public SysRoleMenu selectByPrimaryKey(String id) {
        return sysRoleMenuMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SysRoleMenu record) {
        return sysRoleMenuMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SysRoleMenu record) {
        return sysRoleMenuMapper.updateByPrimaryKey(record);
    }

    @Override
    public boolean saveOrUpdate(SysRoleMenu record) {
        if (record.getId() == null || "".equals(record.getId())) {
            record.setId(StringUtils.uuid());
            return insertSelective(record) > 0;
        }
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean deleteRecord(String id) {
        SysRoleMenu record = selectByPrimaryKey(id);
        if (record == null) {
            return true;
        }
        record.setDelFlag(Constants.TRUE);
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public List<SysRoleMenu> selectByRoleId(String roleId) {

        return sysRoleMenuMapper.selectByRoleId(roleId);
    }
}
