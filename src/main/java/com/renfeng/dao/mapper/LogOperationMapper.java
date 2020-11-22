package com.renfeng.dao.mapper;


import com.renfeng.model.LogOperation;

public interface LogOperationMapper {

    int deleteByPrimaryKey(String id);

    int insert(LogOperation record);

    int insertSelective(LogOperation record);

    LogOperation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(LogOperation record);

    int updateByPrimaryKey(LogOperation record);
}