/**
 * Copyright (c) 2015-2016, Michael Yang 杨福海 (fuhai999@gmail.com).
 * <p>
 * Licensed under the GNU Lesser General Public License (LGPL) ,Version 3.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.gnu.org/licenses/lgpl-3.0.txt
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.renfeng.util;


import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串工具类
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2019-08-15
 */
public class StringUtils {

    public final static String CHARSET_UTF8 = "utf8";

    public static final String HTML_NBSP = "&nbsp;";
    public static final String HTML_AMP = "&amp;";
    public static final String HTML_QUOTE = "&quot;";
    public static final String HTML_LT = "&lt;";
    public static final String HTML_GT = "&gt;";

    public static String urlDecode(String string) {
        try {
            if (StringUtils.isBlank(string)) {
                return string;
            }
            return URLDecoder.decode(string.replaceAll("%", "%25"), CHARSET_UTF8);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return string;
    }

    public static String urlEncode(String string) {
        try {
            return URLEncoder.encode(string, CHARSET_UTF8);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return string;
    }

    public static String urlRedirect(String redirect) {
        try {
            redirect = new String(redirect.getBytes(CHARSET_UTF8), "ISO8859_1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return redirect;
    }

    public static boolean areNotEmpty(String... strings) {
        if (strings == null || strings.length == 0) {
            return false;
        }

        for (String string : strings) {
            if (string == null || "".equals(string)) {
                return false;
            }
        }
        return true;
    }

    public static boolean isNotEmpty(String string) {
        return string != null && !"".equals(string);
    }

    public static boolean isEmpty(String string) {
        return string == null || !"".equals(string);
    }

    public static boolean areNotBlank(String... strings) {
        if (strings == null || strings.length == 0) {
            return false;
        }
        for (String string : strings) {
            if (string == null || "".equals(string.trim())) {
                return false;
            }
        }
        return true;
    }

    public static boolean isNotBlank(String string) {
        return string != null && !"".equals(string.trim());
    }

    public static boolean isBlank(String string) {
        return string == null || "".equals(string.trim());
    }

    public static long toLong(String value, Long defaultValue) {
        try {
            if (value == null || "".equals(value.trim())) {
                return defaultValue;
            }
            value = value.trim();
            if (value.startsWith("N") || value.startsWith("n")) {
                return -Long.parseLong(value.substring(1));
            }
            return Long.parseLong(value);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return defaultValue;
    }

    public static int toInt(String value, int defaultValue) {
        try {
            if (value == null || "".equals(value.trim())) {
                return defaultValue;
            }
            value = value.trim();
            if (value.startsWith("N") || value.startsWith("n")) {
                return -Integer.parseInt(value.substring(1));
            }
            return Integer.parseInt(value);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return defaultValue;
    }

    public static BigInteger toBigInteger(String value, BigInteger defaultValue) {
        try {
            if (value == null || "".equals(value.trim())) {
                return defaultValue;
            }
            value = value.trim();
            if (value.startsWith("N") || value.startsWith("n")) {
                return new BigInteger(value).negate();
            }
            return new BigInteger(value);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return defaultValue;
    }

    public static boolean match(String string, String regex) {
        Pattern pattern = Pattern.compile(regex, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(string);
        return matcher.matches();
    }

    public static boolean isNumeric(String str) {
        if (str == null) {
            return false;
        }
        for (int i = str.length(); --i >= 0; ) {
            int chr = str.charAt(i);
            if (chr < 48 || chr > 57) {
                return false;
            }
        }
        return true;
    }

    public static boolean isEmail(String email) {
//        return Pattern.matches("\\w+@(\\w+.)+[a-z]{2,3}", email);
        return Pattern.matches("^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,20})+$", email);
    }

    public static boolean isMobileNumber(String phoneNumber) {
        return Pattern.matches("^(1[2,3,4,5,6,7,8,9])\\d{9}$", phoneNumber);
    }

    public static String escapeHtml(String text) {
        if (isBlank(text)) {
            return text;
        }
        return text.replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#x27;").replace("/", "&#x2F;");
    }

    public static String escapeHtmlAndEnter(String text) {
        if (isBlank(text)) {
            return text;
        }
        return text.replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#x27;").replace("/", "&#x2F;").replaceAll("\\n", "");
    }

    public static String replaceAllEnterToSpace(String text) {
        if (isBlank(text)) {
            return text;
        }
        return text.replaceAll("\\n", "");
    }


    public static String uuid() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    /**
     * 生成流水号
     *
     * @param uuid 谋订单的主键ID
     * @return string
     */
    public static String generateSerialNumber(String uuid) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        return sdf.format(new Date()) + uuid.hashCode();
    }

    public static String clearSpecialCharacter(String string) {
        if (isBlank(string)) {
            return string;
        }

        /*
         P：标点字符；
         L：字母；
         M：标记符号（一般不会单独出现）；
         Z：分隔符（比如空格、换行等）；
         S：符号（比如数学符号、货币符号等）；
         N：数字（比如阿拉伯数字、罗马数字等）；
         C：其他字符
         */
        return string.replaceAll("[\\\\\'\"\\/\f\n\r\t]", "");
    }


    /**
     * 生成验证码
     */
    public static String getValidateCode() {
        Random random = new Random();
        return String.valueOf(random.nextInt(9999 - 1000 + 1) + 1000);//为变量赋随机值1000-9999
    }

    /**
     * 清除html标签
     *
     * @param htmlStr 网页
     * @return string
     */
    public static String clearHtmlTag(String htmlStr) {
        if (isBlank(htmlStr)) {
            return htmlStr;
        }
        return JsoupUtils.getText(htmlStr);
    }

    /**
     * 去除字符串中按照指定分隔符拆分后重复的
     *
     * @param str       源字符串
     * @param separator 分隔符
     * @return string
     */
    public static String removeDuplicate(String str, String separator) {
        if (isBlank(str) || isBlank(separator)) {
            return str;
        }
        String[] array = str.split(separator);
        Set<String> set = new HashSet<>();
        for (int i = 0; i < array.length; i++) {
            set.add(array[i]);
        }
        StringBuilder stringBuilder = new StringBuilder();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            stringBuilder.append(iterator.next()).append(separator);
        }
        return stringBuilder.toString().substring(0, stringBuilder.toString().length() - 1);
    }


    /**
     * 还原被转义的HTML特殊字符
     *
     * @param htmlStr 包含转义符的HTML内容
     * @return 转换后的字符串
     */
    public static String restoreEscaped(String htmlStr) {
        if (isBlank(htmlStr)) {
            return htmlStr;
        }
        return htmlStr
                .replace("&#39;", "'")
                .replace(HTML_LT, "<")
                .replace(HTML_GT, ">")
                .replace(HTML_AMP, "&")
                .replace(HTML_QUOTE, "\"")
                .replace(HTML_NBSP, " ");
    }

    /**
     * 去掉string中的特殊字符
     * ggy
     *
     * @param str 源字符串
     * @return string
     */
    public static String stringFilterAucreByte(String str) {
        if (!"".equals(str) && str != null) {
            // 清除掉所有特殊字符
            String regEx = "[`\"~!@#$%^&*()+=|{}':;',\\[\\].<>_/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
            Pattern p = Pattern.compile(regEx);
            Matcher m = p.matcher(str);
            return m.replaceAll("").trim();
        } else {
            return "";
        }
    }

    /**
     * 特殊字符替换成英文逗号
     */
    public static String stringReplace(String text) {
        if (isBlank(text)) {
            return text;
        }

        return text.trim().replace("，", ",").replace("\n", ",").replace("\r", ",").replace("\t", ",")
                .replace("\f", ",").replace(HTML_NBSP, ",").replace("\0", ",").replace("\b", ",")
                .replace("&ensp", ",").replaceAll(" +", ",").replace("\\", "")
                .replace(".", ",").replace("。", ",").replace(",,", ",");
    }

    /**
     * 指定字符串是否被包装
     *
     * @param str        字符串
     * @param prefixChar 前缀
     * @param suffixChar 后缀
     * @return 是否被包装
     */
    public static boolean isWrap(CharSequence str, char prefixChar, char suffixChar) {
        if (null == str) {
            return false;
        }

        return str.charAt(0) == prefixChar && str.charAt(str.length() - 1) == suffixChar;
    }

    /**
     * 正则表达式匹配两个指定字符串中间的内容
     *
     * @param soap 字符串
     * @param rgex 正则
     * @return list
     */
    public static List<String> getSubUtil(String soap, String rgex) {
        List<String> list = new ArrayList<>();
        Pattern pattern = Pattern.compile(rgex);
        Matcher m = pattern.matcher(soap);
        while (m.find()) {
            int i = 1;
            list.add(m.group(i));
            i++;
        }
        return list;
    }

    public static String removeQuotes(String str) {
        if (isBlank(str)) {
            return null;
        }
        return str.replaceAll("\"", "").replaceAll("'", "");
    }


    public static String getSnowFlakeValue() {
        return String.valueOf(new SnowFlake().nextId());
    }

    public static String getSnowFlakeValue(long datacenterId, long machineId) {
        return String.valueOf(new SnowFlake(datacenterId, machineId).nextId());
    }

    /**
     * 是否包含字符串
     *
     * @param str 验证字符串
     * @param strs 字符串组
     * @return 包含返回true
     */
    public static boolean inStringIgnoreCase(String str, String... strs)
    {
        if (str != null && strs != null)
        {
            for (String s : strs)
            {
                if (str.equalsIgnoreCase(trim(s)))
                {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 去空格
     */
    public static String trim(String str)
    {
        return (str == null ? "" : str.trim());
    }

    /**
     * * 判断一个对象是否为空
     *
     * @param object Object
     * @return true：为空 false：非空
     */
    public static boolean isNull(Object object)
    {
        return object == null;
    }


    public static void main(String[] args) {

    }

}
