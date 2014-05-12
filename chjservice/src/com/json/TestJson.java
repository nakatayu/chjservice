package com.json;

import java.util.Collection;
import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.util.JSONUtils;

public class TestJson {

	public static void main(String[] args) {
		String str="[[[1,2],3,5,6,7],[3,5,7,9,12],[],[],[3,4,5,6,8],[],[]]";
		
		JSONArray js=JSONArray.fromObject(str);
		
		System.out.println(str);
		System.out.println(js);
		List list=(List) JSONArray.toCollection(js, Collection.class);
		System.out.println(list);
	 
	}
}
