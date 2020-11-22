package com.renfeng.service;

import com.github.pagehelper.PageInfo;
import com.renfeng.common.Result;
import com.renfeng.model.SysParam;

/**
 * TODO
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019/10/24 16:15
 */
public interface SysParamService {

    PageInfo<SysParam> selectByExample(int pageNumber, int pageSize, String name, String code);

    Result saveParam(SysParam sysParam);

    Result deleteByPrimaryKey(String id);
}
