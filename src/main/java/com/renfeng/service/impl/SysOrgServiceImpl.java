package com.renfeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renfeng.common.Constants;
import com.renfeng.dao.mapper.SysOrgMapper;
import com.renfeng.model.SysOrg;
import com.renfeng.service.SysOrgService;
import com.renfeng.util.ArrayUtils;
import com.renfeng.util.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:10
 */
@Service
        public class SysOrgServiceImpl implements SysOrgService {

    @Resource
    SysOrgMapper sysOrgMapper;


    @Override
    public int deleteByPrimaryKey(String id) {
        return sysOrgMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SysOrg record) {
        return sysOrgMapper.insert(record);
    }

    @Override
    public int insertSelective(SysOrg record) {
        return sysOrgMapper.insertSelective(record);
    }

    @Override
    public SysOrg selectByPrimaryKey(String id) {
        return sysOrgMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SysOrg record) {
        return sysOrgMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SysOrg record) {
        return sysOrgMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageInfo<SysOrg> selectOrgPageByParentId(int pageNumber, int pageSize, String parentId) {
        return PageHelper.startPage(pageNumber, pageSize).doSelectPageInfo(() -> sysOrgMapper.selectByParentId(parentId));
    }

    @Override
    public List<SysOrg> selectListByParentId(String parentId) {
        return sysOrgMapper.selectByParentId(parentId);
    }

    @Override
    public boolean saveOrUpdate(SysOrg record) {
        if (record.getId() == null || "".equals(record.getId())) {
            record.setId(StringUtils.uuid());
            return insertSelective(record) > 0;
        }
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean deleteRecord(String id) {
        SysOrg record = selectByPrimaryKey(id);
        if (record == null) {
            return true;
        }
        record.setDelFlag(Constants.TRUE);
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public Map<String, String> selectAllParentById(String id) {
        StringBuilder ids = new StringBuilder(), names = new StringBuilder();
        SysOrg sysOrg = selectByPrimaryKey(id);
        if (sysOrg == null) {
            return null;
        }
        if (StringUtils.isNotBlank(sysOrg.getName()) && StringUtils.isNotBlank(ids.toString())) {
            ids.insert(0, "-");
            names.insert(0, "-");
        }
        ids.insert(0, sysOrg.getId());
        names.insert(0, sysOrg.getName());
        String parentId = sysOrg.getParentId();
        while (StringUtils.isNotBlank(parentId)) {
            SysOrg parent = selectByPrimaryKey(sysOrg.getParentId());
            if (parent == null) {
                parentId = null;
                continue;
            }
            if (StringUtils.isNotBlank(parent.getName()) && StringUtils.isNotBlank(ids.toString())) {
                ids.insert(0, "-");
                names.insert(0, "-");
            }
            ids.insert(0, parent.getId());
            names.insert(0, parent.getName());

            parentId = parent.getParentId();
        }
        Map<String, String> map = new HashMap<>(2);
        map.put("names", names.toString());
        map.put("ids", ids.toString());
        return map;
    }

    @Override
    public List<SysOrg> selectAll() {
        return sysOrgMapper.selectAll();
    }

    @Override
    public List<SysOrg> selectTop() {
        return sysOrgMapper.selectTop();
    }

    @Override
    public void packageTree(SysOrg sysOrg) {
         List<SysOrg> list = selectListByParentId(sysOrg.getId());
        if(ArrayUtils.isNullOrEmpty(list)){
            return;
        }
        sysOrg.setSonList(list);
         list.stream().forEach(record -> {
             List<SysOrg> sonList = selectListByParentId(record.getId());
             if(ArrayUtils.isNullOrEmpty(sonList)){
                 return;
            }else{
                 queryLower(sonList);
             }
             record.setSonList(sonList);
         });
    }

    public void queryLower ( List<SysOrg> list){
        list.stream().forEach(record -> {
            List<SysOrg> sonList = selectListByParentId(record.getId());
            if(ArrayUtils.isNullOrEmpty(sonList)){
                return;
            }else{
                queryLower(sonList);
            }
            record.setSonList(sonList);
        });
    }



}
