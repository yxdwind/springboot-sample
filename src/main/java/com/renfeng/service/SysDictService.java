package com.renfeng.service;

import com.github.pagehelper.PageInfo;
import com.renfeng.common.Result;
import com.renfeng.model.SysDict;


public interface SysDictService {

    PageInfo<SysDict> selectByExample(int pageNumber, int pageSize, String name, String code);

    Result saveDict(SysDict sysDict);

    Result deleteDict(String id);

    PageInfo<SysDict> selectByDictId(int pageNumber, int pageSize, String dictId);
}
