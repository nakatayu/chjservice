package com.chj.common;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

public class TestEncrypt {
	
	private static final String BYCSENDMESSAGE_KEY="BYCCHALV";
	
	public static void main(String[] args) {  //initSearchFlight   queryTaItinerary  queryTempTravller 
		System.out.println(encrypt("2013-09-06 12:25|admina|610324198710022050|initSearchFlight"));
		System.out.println(encrypt("2013-09-06 12:25|admina|610324198710022050|queryTaItinerary"));
		System.out.println(encrypt("2013-09-06 12:25|admina|610324198710022050|queryTempTravller"));
	}
	
	/**
	 * des加密star
	 * @param str
	 * @return str
	 * @author ethan
	 */
	public static byte[] encrypt(String message, String key) throws Exception {
		Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");

		DESKeySpec desKeySpec = new DESKeySpec(key.getBytes("UTF-8"));

		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
		SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
		IvParameterSpec iv = new IvParameterSpec(key.getBytes("UTF-8"));
		cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);

		return cipher.doFinal(message.getBytes("UTF-8"));
	}

	public static String encrypt(String value) {
		String result = "";
		try {
			//value = java.net.URLEncoder.encode(value, "utf-8");
			result = toHexString(encrypt(value, BYCSENDMESSAGE_KEY)).toUpperCase();
		} catch (Exception ex) {
			ex.printStackTrace();
			return "";
		}
		return result;
	}

	public static byte[] convertHexString(String ss) {
		byte digest[] = new byte[ss.length() / 2];
		for (int i = 0; i < digest.length; i++) {
			String byteString = ss.substring(2 * i, 2 * i + 2);
			int byteValue = Integer.parseInt(byteString, 16);
			digest[i] = (byte) byteValue;
		}
		return digest;
	}

	public static String toHexString(byte b[]) {
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			String plainText = Integer.toHexString(0xff & b[i]);
			if (plainText.length() < 2)
				plainText = "0" + plainText;
			hexString.append(plainText);
		}
		return hexString.toString();
	}

}
