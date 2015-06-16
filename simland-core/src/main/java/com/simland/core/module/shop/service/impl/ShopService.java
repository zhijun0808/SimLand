package com.simland.core.module.shop.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.simland.core.module.shop.entity.Shop;
import com.simland.core.module.shop.mapper.ShopMapper;
import com.simland.core.module.shop.service.IShopService;

@Service("shopService")
@Transactional(rollbackFor = java.lang.Exception.class)
public class ShopService implements IShopService {

	@Autowired
	private ShopMapper shopMapper;

	@Override
	public List<Shop> getSplitShopList(Map<String, Object> param) {
		return shopMapper.getSplitShopList(param);
	}

	@Override
	public Integer getShopCount(Map param) {
		return shopMapper.getShopCount(param);
	}

}