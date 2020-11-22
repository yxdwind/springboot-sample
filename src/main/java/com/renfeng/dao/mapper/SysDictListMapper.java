package com.renfeng.dao.mapper;

import com.renfeng.model.SysDictList;
import com.renfeng.model.SysDictListExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysDictListMapper {
    int countByExample(SysDictListExample example);

    int deleteByExample(SysDictListExample example);

    int deleteByPrimaryKey(String id);

    int insert(SysDictList record);

    int insertSelective(SysDictList record);

    List<SysDictList> selectByExample(SysDictListExample example);

    SysDictList selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") SysDictList record, @Param("example") SysDictListExample example);

    int updateByExample(@Param("record") SysDictList record, @Param("example") SysDictListExample example);

    int updateByPrimaryKeySelective(SysDictList record);

    int updateByPrimaryKey(SysDictList record);
}