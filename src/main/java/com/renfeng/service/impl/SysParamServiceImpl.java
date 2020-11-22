package com.renfeng.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renfeng.common.Result;
import com.renfeng.common.ResultCodeEnum;
import com.renfeng.dao.mapper.SysParamMapper;
import com.renfeng.model.SysParam;
import com.renfeng.model.SysParamExample;
import com.renfeng.service.SysParamService;
import com.renfeng.util.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class SysParamServiceImpl implements SysParamService {

    @Resource
    private SysParamMapper mapper;

    @Override
    public PageInfo<SysParam> selectByExample(int pageNumber, int pageSize, String name, String code) {
        SysParamExample example = new SysParamExample();
        SysParamExample.Criteria criteria = example.createCriteria();
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
    public Result saveParam(SysParam sysParam) {
        if (StringUtils.isBlank(sysParam.getId())){
            sysParam.setId(StringUtils.uuid());
            sysParam.setCreateDate(new Date());
            sysParam.setUpdateDate(new Date());
            sysParam.setDelFlag("0");
            try {
                mapper.insert(sysParam);
                return Result.success();
            }catch (Exception e){
                return Result.bizError(ResultCodeEnum.ParamError);
            }
        }else {
            sysParam.setUpdateDate(new Date());
            try {
                mapper.updateByPrimaryKeySelective(sysParam);
                return Result.success();
            }catch (Exception e){
                return Result.bizError(ResultCodeEnum.UserNotFound);
            }
        }
    }

    @Override
    public Result deleteByPrimaryKey(String id) {
        try {
            mapper.deleteByPrimaryKey(id);
            return Result.success();
        }catch (Exception e){
            return Result.bizError(ResultCodeEnum.UserNotFound);
        }
    }

}
