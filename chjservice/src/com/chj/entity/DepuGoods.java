package com.chj.entity;
/**
 * 德普商品信息对照表
 * @author Administrator
 *
 */
public class DepuGoods {
	Integer id;
	String name;
	String shop_cate_match_row;
	String description;
	String origin_price;
	String current_price;
	String images;
	String update_time;
	String status;
	public DepuGoods() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShop_cate_match_row() {
		return shop_cate_match_row;
	}
	public void setShop_cate_match_row(String shop_cate_match_row) {
		this.shop_cate_match_row = shop_cate_match_row;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOrigin_price() {
		return origin_price;
	}
	public void setOrigin_price(String origin_price) {
		this.origin_price = origin_price;
	}
	public String getCurrent_price() {
		return current_price;
	}
	public void setCurrent_price(String current_price) {
		this.current_price = current_price;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
