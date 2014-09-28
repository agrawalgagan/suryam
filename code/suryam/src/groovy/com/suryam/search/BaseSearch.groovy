package com.suryam.search

import com.suryam.util.Constants

/**
 * Created with IntelliJ IDEA.
 * User: Gagan Agrawal
 * Date: 9/28/14
 * Time: 10:50 PM
 */
class BaseSearch {
    String sort = "id"
    String order = "asc"
    int max = Constants.DEFAULT_MAX_PAGE_SIZE
    int offset = 0

    public def getParamMap(){
        [max : max, offset : offset, sort : sort, order : order]
    }
}
