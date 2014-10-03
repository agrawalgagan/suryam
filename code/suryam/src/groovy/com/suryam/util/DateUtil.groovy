package com.suryam.util

import java.text.SimpleDateFormat

/**
 * Created with IntelliJ IDEA.
 * User: Gagan Agrawal
 * Date: 10/3/14
 * Time: 2:34 PM
 */
class DateUtil {
    static String format(Date date, String format){
        new SimpleDateFormat(format).format(date)
    }
}
