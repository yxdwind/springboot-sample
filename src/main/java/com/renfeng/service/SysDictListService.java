package com.renfeng.service;


import com.renfeng.common.Result;
import com.renfeng.model.SysDictList;

public interface SysDictListService {

    Result saveDictList(SysDictList sysDictList);

    Result deleteDictList(String id);
}
