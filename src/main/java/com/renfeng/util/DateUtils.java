package com.renfeng.util;

import java.sql.Timestamp;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * 日期工具类
 *
 * @author yanxiaodong
 * @version 1.0
 * @date 2017-04-03
 */
public class DateUtils {

    private static final ConcurrentMap<String, DateTimeFormatter> FORMATTER_CACHE = new ConcurrentHashMap<>();

    private static final int PATTERN_CACHE_SIZE = 500;

    private static final String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";

    private static final String WECHAT_PATTERN = "yyyyMMddHHmmss";

    private static final String UTC_PATTERN = "yyyy-MM-dd'T'HH:mm:ss'Z'";

    private static final String DATE_PATTERN = "yyyy-MM-dd";

    /**
     * 得到当前日期
     *
     * @return String
     */
    public static String now() {
//        return DateTime.now().toString(sdfString);
        return date2String(Date.from(Instant.now()));
    }

    /**
     * 得到当前日期
     *
     * @return Date
     */
    public static Date nowDate() {
        return string2Date(now());
    }

    /**
     * 转换Date为String
     *
     * @param date {@link Date}
     * @return String
     */
    public static String date2String(Date date) {
//        return new DateTime(date).toString(sdfString);
        return date2String(date, DEFAULT_PATTERN);
    }

    /**
     * 转换Date为String
     *
     * @param date    {@link Date}
     * @param pattern 格式
     * @return String
     */
    public static String date2String(Date date, String pattern) {
//        return new DateTime(date).toString(format);
        DateTimeFormatter dateTimeFormatter = createCacheFormatter(pattern);
        LocalDateTime localDateTime = LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
        return dateTimeFormatter.format(localDateTime);
    }

    /**
     * 转换String为Date
     *
     * @param string 日期
     * @return Date
     */
    public static Date string2Date(String string) {
//        return DateTimeFormat.forPattern(sdfString).parseDateTime(string).toDate();
        return string2Date(string, DEFAULT_PATTERN);
    }

    /**
     * 转换String为Date
     *
     * @param string  日期
     * @param pattern 格式
     * @return Date
     */
    public static Date string2Date(String string, String pattern) {
//        return DateTimeFormat.forPattern(pattern).parseDateTime(string).toDate();
        return Date.from(parseLocalDateTime(string, pattern).atZone(ZoneId.systemDefault()).toInstant());
    }

    /**
     * 统计两个日期间隔天数
     *
     * @param date1 {@link Date}
     * @param date2 {@link Date}
     * @return int
     */
    public static int getDayDiff(Date date1, Date date2) {
//        if (date1 == null || date2 == null) {
//            throw new InvalidParameterException("date1 and date2 cannot be null!");
//        }
//        long millSecondsInOneDay = 24 * 60 * 60 * 1000;
//        return (int) ((date1.getTime() - date2.getTime()) / millSecondsInOneDay);

        LocalDate start = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate end = date2.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        Period period = Period.between(start, end);
        return period.getDays();
    }

    /**
     * 获得两个时间间隔秒数
     *
     * @param date1 {@link Date}
     * @param date2 {@link Date}
     * @return long
     */
    public static long getSecondsDiff(Date date1, Date date2) {
//        if (date1 == null || date2 == null) {
//            throw new InvalidParameterException("date1 and date2 cannot be null!");
//        }
//        return (int) ((date1.getTime() - date2.getTime()) / 1000);

        LocalDateTime start = localDateToLocalDateTime(date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate());
        LocalDateTime end = localDateToLocalDateTime(date2.toInstant().atZone(ZoneId.systemDefault()).toLocalDate());
        Duration duration = Duration.between(start, end);
        return duration.getSeconds();
    }


    /**
     * 当前日期几天之后
     *
     * @param n 天数
     * @return Date
     */
    public static Date afterNDay(int n) {
//        return DateTime.now().plusDays(n).toDate();
        return Date.from(Instant.now().plus(n, ChronoUnit.DAYS));
    }


    /**
     * 指定日期的几天之后
     *
     * @param date 指定的日期
     * @param n    天数
     * @return Date
     */
    public static Date afterNDay(Date date, int n) {
//        return new DateTime(date).plusDays(n).toDate();
        return Date.from(date.toInstant().plus(n, ChronoUnit.DAYS));
    }


    /**
     * 当前日期的几秒后
     *
     * @param n 秒数
     * @return Date
     */
    public static Date afterNSeconds(int n) {
//        return DateTime.now().plusSeconds(n).toDate();
        return Date.from(Instant.now().plus(n, ChronoUnit.SECONDS));
    }

    /**
     * 转换date为hex
     *
     * @param date {@link Date}
     * @return String
     */
    public static String date2hex(Date date) {
        return Integer.toHexString(Integer.parseInt(String.valueOf(date.getTime()).substring(0, 10))).toUpperCase();
    }

    /**
     * 转换当前日期为hex
     *
     * @return String
     */
    public static String date2hex() {
        return Integer.toHexString(Integer.parseInt(String.valueOf(System.currentTimeMillis()).substring(0, 10))).toUpperCase();
    }

    /**
     * 将十六进制字符串转回时间戳
     *
     * @param hexString 十六进制字符串
     * @return Date
     */
    public static Date hex2Date(String hexString) {
        Date date = new Date();
        int stamp = Integer.parseInt(hexString, 16);
        date.setTime(stamp * 1000l);
        return date;
    }

    /**
     * 获取指定日期偏移指定时间后的时间
     *
     * @param date      基准日期
     * @param dateField 偏移的粒度大小（小时、天、月等）
     * @param offset    偏移量，正数为向后偏移，负数为向前偏移
     * @return 偏移后的日期
     */
//    public static Date offset(Date date, int dateField, int offset) {
//        Calendar cal = Calendar.getInstance();
//        cal.setTime(date);
//        cal.add(dateField, offset);
//        return cal.getTime();
//    }

//    /**
//     * 转换为Calendar对象
//     *
//     * @param date 日期对象
//     * @return Calendar对象
//     */
//    public static Calendar calendar(Date date) {
//        final Calendar cal = Calendar.getInstance();
//        cal.setTime(date);
//        return cal;
//    }
//
//    /**
//     * 获取某天的开始时间
//     *
//     * @param calendar 日期
//     * @return Calendar
//     */
//    public static Calendar beginOfDay(Calendar calendar) {
//        calendar.set(Calendar.HOUR_OF_DAY, 0);
//        calendar.set(Calendar.MINUTE, 0);
//        calendar.set(Calendar.SECOND, 0);
//        calendar.set(Calendar.MILLISECOND, 0);
//        return calendar;
//    }

//    /**
//     * 获取某天的结束时间
//     *
//     * @param calendar 日期
//     * @return Calendar
//     */
//    public static Calendar endOfDay(Calendar calendar) {
//        calendar.set(Calendar.HOUR_OF_DAY, 23);
//        calendar.set(Calendar.MINUTE, 59);
//        calendar.set(Calendar.SECOND, 59);
//        calendar.set(Calendar.MILLISECOND, 999);
//        return calendar;
//    }

//    /**
//     * 获取某月的开始时间
//     *
//     * @param calendar 日期
//     * @return
//     */
//    public static Calendar beginOfMonth(Calendar calendar) {
//        calendar.set(Calendar.DAY_OF_MONTH, 1);
//        return beginOfDay(calendar);
//    }

//    /**
//     * 获取本周的开始时间
//     *
//     * @param calendar
//     * @return
//     */
//    public static Calendar beginOfWeek(Calendar calendar) {
//        //西方文化中周日是第一天
//        int dayofweek = calendar.get(Calendar.DAY_OF_WEEK);
//        if (dayofweek == 1) {
//            dayofweek += 7;
//        }
//        calendar.add(Calendar.DATE, 2 - dayofweek);
//        return beginOfDay(calendar);
//    }
//
//    /**
//     * 获取某月的结束时间
//     *
//     * @param calendar 日期
//     * @return
//     */
//    public static Calendar endOfMonth(Calendar calendar) {
//        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
//        return endOfDay(calendar);
//    }

//    /**
//     * 获取某月的开始时间
//     *
//     * @param date 日期
//     * @return
//     */
//    public static Date beginOfMonth(Date date) {
//        return beginOfMonth(calendar(date)).getTime();
//    }


//    /**
//     * 获取某月的结束时间
//     *
//     * @param date 日期
//     * @return
//     */
//    public static Date endOfMonth(Date date) {
//        return endOfMonth(calendar(date)).getTime();
//    }
//
//    //获取本周的开始时间
//    public static Date beginOfWeek(Date date) {
//        return beginOfWeek(calendar(date)).getTime();
//    }
//
//    //获取本日开始时间
//    public static Date beginOfDay(Date date) {
//        return beginOfDay(calendar(date)).getTime();
//    }

    /**
     * unix时间戳转时间
     *
     * @param timestampString unix时间戳
     * @param pattern         日期格式
     * @return String
     */
    public static String unix2Date(String timestampString, String pattern) {
        if (pattern == null) {
            pattern = DEFAULT_PATTERN;
        }
        Long timestamp = Long.parseLong(timestampString) * 1000;
//        String date = new SimpleDateFormat(pattern, Locale.CHINA).format(new Date(timestamp));
//        System.out.println(date);
        DateTimeFormatter dateTimeFormatter = createCacheFormatter(pattern);
        Instant instant = Instant.ofEpochMilli(timestamp);
        return dateTimeFormatter.format(LocalDateTime.ofInstant(instant, ZoneId.systemDefault()));
    }

    /**
     * unix时间戳转时间
     *
     * @param timestampString unix时间戳
     * @return Date
     */
    public static Date unix2Date(String timestampString) {
        return string2Date(unix2Date(timestampString, null));
    }

    /**
     * 北京时间转UTC时间
     *
     * @param date {@link Date}
     * @return String
     */
    public static String getUtcDate(Date date) {
        return getUtcDate(date, UTC_PATTERN);
    }

    /**
     * 北京时间转UTC时间
     *
     * @param date    {@link Date}
     * @param pattern 日期格式
     * @return String
     */
    public static String getUtcDate(Date date, String pattern) {
//        // 取得本地时间：
//        Calendar cal = Calendar.getInstance();
//        cal.setTimeInMillis(date.getTime());
//        // 取得时间偏移量：
//        int zoneOffset = cal.get(Calendar.ZONE_OFFSET);
//        // 取得夏令时差：
//        int dstOffset = cal.get(Calendar.DST_OFFSET);
//        // 从本地时间里扣除这些差量，即可以取得UTC时间：
//        cal.add(Calendar.MILLISECOND, -(zoneOffset + dstOffset));
//
//        SimpleDateFormat foo = new SimpleDateFormat(sdf);
//        return foo.format(cal.getTime());

        LocalDateTime localDateTime = LocalDateTime.ofInstant(date.toInstant(), ZoneId.of("UTC"));
        ZonedDateTime utc = ZonedDateTime.of(localDateTime, ZoneId.of("UTC"));
        DateTimeFormatter dateTimeFormatter = createCacheFormatter(pattern);
        return dateTimeFormatter.format(utc);
    }

    /**
     * UTC时间转北京时间
     *
     * @param utcStr UTC时间串
     * @return
     */
    public static Date utcToDate(String utcStr) {
//        SimpleDateFormat sdf = new SimpleDateFormat(utcSdf);
//        Date date = null;
//        try {
//            date = sdf.parse(utcStr);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        Calendar calendar = Calendar.getInstance();
//        calendar.setTime(date);
//        calendar.set(Calendar.HOUR, calendar.get(Calendar.HOUR) + 8);
//        //calendar.getTime() 返回的是Date类型，也可以使用calendar.getTimeInMillis()获取时间戳
//        return calendar.getTime();

        LocalDateTime localDateTime = LocalDateTime.ofInstant(string2Date(utcStr).toInstant(), ZoneOffset.UTC);
        return Date.from(localDateTime.toInstant(ZoneOffset.UTC));
    }

    /**
     * 判断当前时间是否在指定时间范围内
     *
     * @param nowDate   {@link Date}
     * @param beginHour 开始时间-小时
     * @param endHour   结束时间-小时
     * @return boolean
     */
    public static boolean isEffectiveDate(Date nowDate, String beginHour, String endHour) {
        String DATE_PATTERN = date2String(nowDate, "HH");
        if (DATE_PATTERN.compareTo(beginHour) >= 0 && DATE_PATTERN.compareTo(endHour) <= 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 在缓存中创建DateTimeFormatter
     *
     * @param pattern 格式
     * @return formatter
     */
    private static DateTimeFormatter createCacheFormatter(String pattern) {
        if (pattern == null || pattern.length() == 0) {
            throw new IllegalArgumentException("Invalid pattern specification");
        }
        DateTimeFormatter formatter = FORMATTER_CACHE.get(pattern);
        if (formatter == null) {
            if (FORMATTER_CACHE.size() < PATTERN_CACHE_SIZE) {
                formatter = DateTimeFormatter.ofPattern(pattern);
                DateTimeFormatter oldFormatter = FORMATTER_CACHE.putIfAbsent(pattern, formatter);
                if (oldFormatter != null) {
                    formatter = oldFormatter;
                }
            }
        }
        return formatter;
    }

    /**
     * 格式化字符串转为LocalDateTime
     *
     * @param time    格式化时间
     * @param pattern 格式
     * @return localDateTime
     */
    public static LocalDateTime parseLocalDateTime(String time, String pattern) {
        DateTimeFormatter formatter = createCacheFormatter(pattern);
        return LocalDateTime.parse(time, formatter);
    }

    /**
     * LocalDate To LocalDateTime
     *
     * @param localDate {@link LocalDate}
     * @return LocalDateTime
     */
    public static LocalDateTime localDateToLocalDateTime(LocalDate localDate) {
        ZoneId zone = ZoneId.systemDefault();
        Instant instant = localDate.atStartOfDay().atZone(zone).toInstant();
        Date date = Date.from(instant);
        instant = date.toInstant();
        zone = ZoneId.systemDefault();
        return LocalDateTime.ofInstant(instant, zone);
    }

    /**
     * 获取当前年
     *
     * @return int
     */
    public static int getYear() {
//        Calendar now = Calendar.getInstance();
//        now.setTime(new Date());
//        return now.get(Calendar.YEAR);
        return LocalDate.now().getYear();
    }

    /**
     * 获取当前月
     *
     * @return int
     */
    public static int getMonth() {
//        Calendar now = Calendar.getInstance();
//        now.setTime(new Date());
//        return now.get(Calendar.MONTH) + 1;
        return LocalDate.now().getMonthValue();
    }

    /**
     * 获取"上午好", "下午好", "晚上好"
     *
     * @return String
     */
    public static String getAMPM() {
        String[] hello = {"上午好", "下午好", "晚上好"};
//        Calendar now = Calendar.getInstance();
//        int hour = now.get(Calendar.HOUR_OF_DAY);
        int index = 0;
        int hour = LocalTime.now().getHour();
        if (hour >= 12 && hour < 18) {
            index = 1;
        }
        if (hour >= 18 && hour <= 23) {
            index = 2;
        }
        return hello[index];
    }

    /**
     * 获取星期
     *
     * @param date 日期
     * @return String
     */
    public static String getWeekOfDate(Date date) {
//        String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
//        Calendar cal = Calendar.getInstance();
//        cal.setTime(dt);
//        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
//        if (w < 0) {
//            w = 0;
//        }
//        return weekDays[w];

        String[] weekDays = {"星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"};
        int index = date2LocalDate(date).getDayOfWeek().getValue();
        return weekDays[index - 1];
    }

    /**
     * 转换date为LocalDate
     *
     * @param date {@link Date}
     * @return LocalDate
     */
    public static LocalDate date2LocalDate(Date date) {
        if (null == date) {
            return null;
        }
        return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    /**
     * 转换LocalDate为Date
     *
     * @param localDate {@link LocalDate}
     * @return Date
     */
    public static Date localDate2Date(LocalDate localDate) {
        if (null == localDate) {
            return null;
        }
        ZonedDateTime zonedDateTime = localDate.atStartOfDay(ZoneId.systemDefault());
        return Date.from(zonedDateTime.toInstant());
    }

    /**
     * 转换LocalDateTime为Date
     *
     * @param localDateTime {@link LocalDateTime}
     * @return Date
     */
    public static Date localDateTime2Date(LocalDateTime localDateTime) {
        return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }

    /**
     * 转换Date为LocalDateTime
     *
     * @param date {@link Date}
     * @return LocalDateTime
     */
    public static LocalDateTime date2LocalDateTime(Date date) {
        return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
    }

    /**
     * 获取当天的开始时间
     *
     * @return Date
     */
    public static Date getDayBegin() {
//        Calendar cal = new GregorianCalendar();
//        cal.set(Calendar.HOUR_OF_DAY, 0);
//        cal.set(Calendar.MINUTE, 0);
//        cal.set(Calendar.SECOND, 0);
//        cal.set(Calendar.MILLISECOND, 0);
//        return cal.getTime();
        LocalDateTime today_start = LocalDateTime.of(LocalDate.now(), LocalTime.MIN);
        return localDateTime2Date(today_start);
    }

    /**
     * 获取当天的结束时间
     *
     * @return Date
     */
    public static Date getDayEnd() {
//        Calendar cal = new GregorianCalendar();
//        cal.set(Calendar.HOUR_OF_DAY, 23);
//        cal.set(Calendar.MINUTE, 59);
//        cal.set(Calendar.SECOND, 59);
//        return cal.getTime();
        LocalDateTime today_start = LocalDateTime.of(LocalDate.now(), LocalTime.MAX);
        return localDateTime2Date(today_start);
    }


    /**
     * 获取某周的开始日期
     *
     * @param offset 0本周，1下周，-1上周，依次类推
     * @return Date
     */
    public static Date getBeginDayOfWeek(int offset) {
//        Date date = new Date();
//        if (date == null) {
//            return null;
//        }
//        Calendar cal = Calendar.getInstance();
//        cal.setTime(date);
//        int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
//        if (dayofweek == 1) {
//            dayofweek += 7;
//        }
//        cal.add(Calendar.DATE, 2 - dayofweek);
//        return getDayStartTime(cal.getTime());

        return localDateTime2Date(LocalDateTime.now().plusWeeks(offset).with(DayOfWeek.MONDAY));

    }

    /**
     * 获取某周的结束日期
     *
     * @param offset 0本周，1下周，-1上周，依次类推
     * @return Date
     */
    public static Date getEndDayOfWeek(int offset) {
//        Calendar cal = Calendar.getInstance();
//        cal.setTime(getBeginDayOfWeek());
//        cal.add(Calendar.DAY_OF_WEEK, 6);
//        Date weekEndSta = cal.getTime();
//        return getDayEndTime(weekEndSta);

        return localDateTime2Date(LocalDateTime.now().plusWeeks(offset).with(DayOfWeek.SUNDAY));
    }

    /**
     * 获取某个日期的开始时间
     *
     * @param date {@link Date}
     * @return Timestamp
     */
    public static Timestamp getDayStartTime(Date date) {
//        Calendar calendar = Calendar.getInstance();
//        if(null != d) {calendar.setTime(d);}
//        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),    calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
//        calendar.set(Calendar.MILLISECOND, 0);
//        return new Timestamp(calendar.getTimeInMillis());

        return Timestamp.valueOf(LocalDateTime.of(date2LocalDate(date), LocalTime.MIN));
    }

    /**
     * 获取某个日期的结束时间
     *
     * @param date {@link Date}
     * @return Timestamp
     */

    public static Timestamp getDayEndTime(Date date) {
//        Calendar calendar = Calendar.getInstance();
//        if(null != d) {calendar.setTime(d);}
//        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),    calendar.get(Calendar.DAY_OF_MONTH), 23, 59, 59);
//        calendar.set(Calendar.MILLISECOND, 999);
//        return new Timestamp(calendar.getTimeInMillis());
        return Timestamp.valueOf(LocalDateTime.of(date2LocalDate(date), LocalTime.MAX));
    }

    public static void main(String[] args) {
//        System.out.println(getDayBegin());
//        System.out.println(getDayEnd());
//        System.out.println(getEndDayOfWeek(-2));
//        System.out.println(LocalDateTime.now().atZone(ZoneOffset.UTC));
//        System.out.println(LocalDateTime.now(Clock.systemUTC()));
//        System.out.println(getUtcDate(new Date()));
//        System.out.println(utcToDate("2020-04-28 08:58:37",UTC_PATTERN));
        System.out.println(unix2Date("1588035992"));
    }

}
