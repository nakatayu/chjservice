package com.sand.crypto;

import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.util.JSONUtils;

public class TestJson {

	public static void main(String[] args) throws Exception {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.add(Calendar.DAY_OF_MONTH, 1);
		c.getTime();
		System.out.println(c.getTime());
	}
}