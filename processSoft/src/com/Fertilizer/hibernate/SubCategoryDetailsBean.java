package com.Fertilizer.hibernate;

public class SubCategoryDetailsBean {
	
	private Long fk_cat_id;
	private Long subcatId;
	private String subcategoryName;
	private String categoryName;
	//for mapping
	private CategoryDetailsBean categoryDetailsBean;
	
	
	public SubCategoryDetailsBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SubCategoryDetailsBean(Long fk_cat_id, Long subcatId,
			String subcategoryName, String categoryName,
			CategoryDetailsBean categoryDetailsBean) {
		super();
		this.fk_cat_id = fk_cat_id;
		this.subcatId = subcatId;
		this.subcategoryName = subcategoryName;
		this.categoryName = categoryName;
		this.categoryDetailsBean = categoryDetailsBean;
	}

	public CategoryDetailsBean getCategoryDetailsBean() {
		return categoryDetailsBean;
	}
	public void setCategoryDetailsBean(CategoryDetailsBean categoryDetailsBean) {
		this.categoryDetailsBean = categoryDetailsBean;
	}
	public Long getSubcatId() {
		return subcatId;
	}
	public void setSubcatId(Long subcatId) {
		this.subcatId = subcatId;
	}

	public Long getFk_cat_id() {
		return fk_cat_id;
	}

	public void setFk_cat_id(Long fk_cat_id) {
		this.fk_cat_id = fk_cat_id;
	}

	public String getSubcategoryName() {
		return subcategoryName;
	}

	public void setSubcategoryName(String subcategoryName) {
		this.subcategoryName = subcategoryName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	

	


}
