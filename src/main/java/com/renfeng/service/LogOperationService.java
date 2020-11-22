package com.renfeng.service;


import com.renfeng.model.LogOperation;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:15
 */
public interface LogOperationService {

    int deleteByPrimaryKey(String id);

    int insert(LogOperation record);

    int insertSelective(LogOperation record);

    LogOperation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(LogOperation record);

    int updateByPrimaryKey(LogOperation record);

    boolean saveOrUpdate(LogOperation record);

    boolean deleteRecord(String id);
}
