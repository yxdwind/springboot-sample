package com.renfeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renfeng.common.Result;
import com.renfeng.common.ResultCodeEnum;
import com.renfeng.dao.mapper.SysDictMapper;
import com.renfeng.model.SysDict;
import com.renfeng.model.SysDictExample;
import com.renfeng.service.SysDictService;
import com.renfeng.util.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class SysDiceServiceImpl implements SysDictService {

    @Resource
    private SysDictMapper mapper;

    @Override
    public PageInfo<SysDict> selectByExample(int pageNumber, int pageSize, String name, String code) {
        SysDictExample example = new SysDictExample();
        SysDictExample.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(name) && StringUtils.isEmpty(code)){
            criteria.andNameLike("%"+name+"%");
        }else if (StringUtils.isNotEmpty(code) && StringUtils.isEmpty(name)){
            criteria.andCodeEqualTo(code);
        }else if (StringUtils.isNotEmpty(name) && StringUtils.isNotEmpty(code)){
            criteria.andNameLike("%"+name+"%");
            criteria.andCodeEqualTo(code);
        }
        criteria.andDelFlagEqualTo("0");
        return PageHelper.startPage(pageNumber, pageSize).doSelectPageInfo(() -> mapper.selectByExample(example));
    }

    @Override
    public Result saveDict(SysDict sysDict) {
        if (StringUtils.isBlank(sysDict.getId())){
            sysDict.setId(StringUtils.uuid());
            sysDict.setCreateDate(new Date());
            sysDict.setUpdateDate(new Date());
            sysDict.setDelFlag("0");
            try {
                mapper.insert(sysDict);
                return Result.success();
            }catch (Exception e){
                return Result.bizError(ResultCodeEnum.ParamError);
            }
        }else {
            sysDict.setUpdateDate(new Date());
            try {
                mapper.updateByPrimaryKeySelective(sysDict);
                return Result.success();
            }catch (Exception e){
                return Result.bizError(ResultCodeEnum.UserNotFound);
            }
        }
    }

    @Override
    public Result deleteDict(String id) {
        try {
            mapper.deleteByPrimaryKey(id);
            return Result.success();
        }catch (Exception e){
            return Result.bizError(ResultCodeEnum.UserNotFound);
        }
    }

    @Override
    public PageInfo<SysDict> selectByDictId(int pageNumber, int pageSize, String id) {
        return PageHelper.startPage(pageNumber, pageSize).doSelectPageInfo(() -> mapper.selstcByDictId(id));
    }

}
