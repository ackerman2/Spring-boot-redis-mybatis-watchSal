package com.example.mapper;

import java.util.List;

import com.example.model.Brands;

public interface BrandsMapper {
	
	List<Brands> findAllBrands();
	int findCBrands();
	Brands findIdBrands(int brandid);
	int updateBrands(Brands brands);
	int deleteBrand(int brandid);
	int insertBrand(Brands brands);
}
