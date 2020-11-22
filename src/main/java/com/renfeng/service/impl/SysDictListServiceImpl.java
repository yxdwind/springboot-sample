package com.renfeng.service.impl;

import com.renfeng.common.Result;
import com.renfeng.common.ResultCodeEnum;
import com.renfeng.dao.mapper.SysDictListMapper;
import com.renfeng.model.SysDictList;
import com.renfeng.service.SysDictListService;
import com.renfeng.util.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;


@Service
public class SysDictListServiceImpl implements SysDictListService {

    @Resource
    private SysDictListMapper mapper;

    @Override
    public Result saveDictList(SysDictList sysDictList) {
        if (StringUtils.isBlank(sysDictList.getId())){
            sysDictList.setId(StringUtils.uuid());
            sysDictList.setCreateDate(new Date());
            sysDictList.setUpdateDate(new Date());
            sysDictList.setDelFlag("0");
            try {
                mapper.insert(sysDictList);
                return Result.success();
            }catch (Exception e){
                return Result.bizError(ResultCodeEnum.ParamError);
            }
        }else {
            sysDictList.setUpdateDate(new Date());
            try {
                mapper.updateByPrimaryKeySelective(sysDictList);
                return Result.success();
            }catch (Exception e){
                return Result.bizError(ResultCodeEnum.UserNotFound);
            }
        }
    }

    @Override
    public Result deleteDictList(String id) {
        try {
            mapper.deleteByPrimaryKey(id);
            return Result.success();
        }catch (Exception e){
            return Result.bizError(ResultCodeEnum.UserNotFound);
        }
    }
}
