package com.enovell.yunwei.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author roy 2014年8月29日-下午3:06:45
 */
public class MD5Util {

	/**进行MD5加密
	 * @param str
	 * @return
	 */
	public static String toMD5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte[] byteDigest = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < byteDigest.length; offset++) {
				i = byteDigest[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			// 32位加密
			return buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		System.out.println(toMD5("76f7e54c6300bf0df6b994872f9721a5"));
	}
}
