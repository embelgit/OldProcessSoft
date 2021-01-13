package com.Fertilizer.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fertilizer.dao.CategoryDetailsDao;
import com.Fertilizer.hibernate.CategoryDetailsBean;
import com.Fertilizer.hibernate.SubCategoryDetailsBean;

public class CategoryDetailsHelper {

	public void catDetails(HttpServletRequest request,
			HttpServletResponse response) {

		String categoryName = request.getParameter("categoryName");
		/*String subCategoryName = request.getParameter("subCategoryName");*/
	
		CategoryDetailsBean cdb = new CategoryDetailsBean();
		
		cdb.setCategoryName(categoryName);
		/*cdb.setSubCategoryName(subCategoryName);*/
		
		
		
		CategoryDetailsDao cdd = new CategoryDetailsDao();
		cdd.addCategory(cdb);
	
	}

    
	public void subCatDetails(HttpServletRequest request,
			HttpServletResponse response) {
          
		
		System.out.println("IN HELPER");
		String fk_cat_id = request.getParameter("fk_cat_id");
		String subcategoryName = request.getParameter("subcategoryName");
		
		System.out.println("=== == ==="+fk_cat_id);
		System.out.println("=== == ==="+subcategoryName);
		
		
		SubCategoryDetailsBean scdb = new SubCategoryDetailsBean();
		
		scdb.setFk_cat_id(Long.parseLong(fk_cat_id));
		System.out.println("=== == ==="+fk_cat_id);
		scdb.setSubcategoryName(subcategoryName);
		System.out.println("=== == ==="+subcategoryName);
		
		CategoryDetailsDao cdd = new CategoryDetailsDao();
		cdd.addSubCategory(scdb);
	
	}

}