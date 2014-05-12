package com.chj.util;

import java.text.SimpleDateFormat;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.processors.JsonValueProcessorMatcher;

public class JsonDateValueProcessor implements JsonValueProcessor {
	/**
	 * 将bean中的java.sql.Timestamp类型转化成 yyyy-MM-dd HH:mm:ss 
	 * JsonConfig jsonConfig = new JsonConfig();
	 * jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class , new
	 * JsonDateValueProcessor()); JSONArray jo = JSONArray.fromObject(bean,
	 * jsonConfig);
	 * 
	 * @param value
	 * @param config
	 * @return
	 */
	private String format = "yyyy-MM-dd hh:mm:ss";
	public JsonDateValueProcessor(Object value) {
		if(value !=null){
			format = value.toString();
		}
		
	}
	public Object processArrayValue(Object value, JsonConfig config) {
		return process(value);
	}

	public Object processObjectValue(String key, Object value, JsonConfig config) {
		return process(value);
	}

	private Object process(Object value) {
		if (value instanceof java.util.Date) {
			SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.UK);
			return sdf.format(value);
		}
		else if(value instanceof java.sql.Timestamp){
			SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.UK);
			return sdf.format(value);
		}
		return value == null ? "" : value.toString();
	}

}
