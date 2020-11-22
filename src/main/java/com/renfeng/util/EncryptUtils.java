package com.renfeng.util;


import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Map;
import java.util.UUID;

public class EncryptUtils {

    public static final long FNV_OFFSET_BASIS_64 = 0xcbf29ce484222325L;
    public static final long FNV_PRIME_64 = 0x100000001b3L;

    private static final java.security.SecureRandom random = new java.security.SecureRandom();
    private static final char[] HEX_DIGITS = "0123456789abcdef".toCharArray();
    private static final char[] CHAR_ARRAY = "_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();

    public static long fnv1a64(String key) {
        long hash = FNV_OFFSET_BASIS_64;
        for (int i = 0, size = key.length(); i < size; i++) {
            hash ^= key.charAt(i);
            hash *= FNV_PRIME_64;
        }
        return hash;
    }

    public static String md5(String srcStr) {
        return hash("MD5", srcStr);
    }

    public static String sha1(String srcStr) {
        return hash("SHA-1", srcStr);
    }

    public static String sha256(String srcStr) {
        return hash("SHA-256", srcStr);
    }

    public static String sha384(String srcStr) {
        return hash("SHA-384", srcStr);
    }

    public static String sha512(String srcStr) {
        return hash("SHA-512", srcStr);
    }

    public static String hash(String algorithm, String srcStr) {
        try {
            MessageDigest md = MessageDigest.getInstance(algorithm);
            byte[] bytes = md.digest(srcStr.getBytes("utf-8"));
            return toHex(bytes);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String toHex(byte[] bytes) {
        StringBuilder ret = new StringBuilder(bytes.length * 2);
        for (int i = 0; i < bytes.length; i++) {
            ret.append(HEX_DIGITS[(bytes[i] >> 4) & 0x0f]);
            ret.append(HEX_DIGITS[bytes[i] & 0x0f]);
        }
        return ret.toString();
    }

    /**
     * md5 128bit 16bytes
     * sha1 160bit 20bytes
     * sha256 256bit 32bytes
     * sha384 384bit 48bytes
     * sha512 512bit 64bytes
     */
    public static String generateSalt(int saltLength) {
        StringBuilder salt = new StringBuilder(saltLength);
        for (int i = 0; i < saltLength; i++) {
            salt.append(CHAR_ARRAY[random.nextInt(CHAR_ARRAY.length)]);
        }
        return salt.toString();
    }

    public static String generateSaltForSha256() {
        return generateSalt(32);
    }

    public static String generateSaltForSha512() {
        return generateSalt(64);
    }

    public static boolean slowEquals(byte[] a, byte[] b) {
        if (a == null || b == null) {
            return false;
        }

        int diff = a.length ^ b.length;
        for (int i = 0; i < a.length && i < b.length; i++) {
            diff |= a[i] ^ b[i];
        }
        return diff == 0;
    }

    public static String salt() {
        int random = (int) (10 + (Math.random() * 10));
        return UUID.randomUUID().toString().replace("-", "").substring(random);// 随机长度
    }

    public static String encryptPassword(String password, String salt) {
        return md5(password + salt);
    }

    public static boolean verlifyUser(String userPassword, String userSalt, String password) {

        if (userPassword == null)
            return false;

        if (userSalt == null) {
            return false;
        }
        return userPassword.equals(encryptPassword(password, userSalt));
    }

    public static String generateUcode(BigInteger id, String salt) {
        return md5(id + salt);
    }

    public static String signForRequest(Map<String, Object> params, String secret) {
        String[] keys = params.keySet().toArray(new String[0]);
        Arrays.sort(keys);

        StringBuilder query = new StringBuilder();
        query.append(secret);
        for (String key : keys) {
            Object value = params.get(key);
            if (value != null && StringUtils.areNotEmpty(key, value.toString())) {
                query.append(key).append(value);
            }
        }
        query.append(secret);
        return md5(query.toString()).toUpperCase();
    }

    /*public static void main(String[] args) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", "john");
        params.put("alias", "butcher");
        System.out.println(signForRequest(params, "mrbourne"));
        System.out.println(encryptPassword("123456", "abc"));


        System.out.println(md5("7e1de99326b34b5db73e53d6226be6754da4ac044a9ff2beb7"));

        System.out.println(MD5Utils.string2MD5("7e1de99326b34b5db73e53d6226be6754da4ac044a9ff2beb7"));
        System.out.println(MD5Utils.convertMD5("42af85a75e3d32b083ac158942f0a52e"));
    }*/

}
