package com.renfeng.service.impl;

import com.renfeng.common.Constants;
import com.renfeng.dao.mapper.SysUserRoleMapper;
import com.renfeng.model.SysUserRole;
import com.renfeng.service.SysUserRoleService;
import com.renfeng.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/11/4 16:31
 */
@Service
public class SysUserRoleServiceImpl implements SysUserRoleService {

    @Autowired
    SysUserRoleMapper sysUserRoleMapper;

    @Override
    public int deleteByPrimaryKey(String id) {
        return sysUserRoleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SysUserRole record) {
        return sysUserRoleMapper.insert(record);
    }

    @Override
    public int insertSelective(SysUserRole record) {
        return sysUserRoleMapper.insertSelective(record);
    }

    @Override
    public SysUserRole selectByPrimaryKey(String id) {
        return sysUserRoleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SysUserRole record) {
        return sysUserRoleMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SysUserRole record) {
        return sysUserRoleMapper.updateByPrimaryKey(record);
    }

    @Override
    public boolean saveOrUpdate(SysUserRole record) {
        if (record.getId() == null || "".equals(record.getId())) {
            record.setId(StringUtils.uuid());
            return insertSelective(record) > 0;
        }
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean deleteRecord(String id) {
        SysUserRole record = selectByPrimaryKey(id);
        if (record == null) {
            return true;
        }
        record.setDelFlag(Constants.TRUE);
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean deleteByUserId(String userId) {
        List<SysUserRole> list = selectByUserId(userId);
        list.stream().forEach(record -> deleteRecord(record.getId()));
        return true;
    }

    @Override
    public List<SysUserRole> selectByUserId(String userId) {
        return sysUserRoleMapper.selectByUserId(userId);
    }
}
