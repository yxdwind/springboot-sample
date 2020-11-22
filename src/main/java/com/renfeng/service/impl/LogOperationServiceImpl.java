package com.renfeng.service.impl;

import com.renfeng.common.Constants;
import com.renfeng.dao.mapper.LogOperationMapper;
import com.renfeng.model.LogOperation;
import com.renfeng.service.LogOperationService;
import com.renfeng.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/25 18:21
 */
@Service
public class LogOperationServiceImpl implements LogOperationService {
    @Autowired
    private LogOperationMapper logOperationMapper;

    @Override
    public int deleteByPrimaryKey(String id) {
        return logOperationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(LogOperation record) {
        return logOperationMapper.insert(record);
    }

    @Override
    public int insertSelective(LogOperation record) {
        return logOperationMapper.insertSelective(record);
    }

    @Override
    public LogOperation selectByPrimaryKey(String id) {
        return logOperationMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(LogOperation record) {
        return logOperationMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(LogOperation record) {
        return logOperationMapper.updateByPrimaryKey(record);
    }

    @Override
    public boolean saveOrUpdate(LogOperation record) {
        if (record.getId() == null || "".equals(record.getId())) {
            record.setId(StringUtils.uuid());
            return insertSelective(record) > 0;
        }
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }

    @Override
    public boolean deleteRecord(String id) {
        LogOperation record = selectByPrimaryKey(id);
        if (record == null) {
            return true;
        }
        record.setDelFlag(Constants.TRUE);
        record.setUpdateDate(new Date());
        return updateByPrimaryKeySelective(record) > 0;
    }
}
