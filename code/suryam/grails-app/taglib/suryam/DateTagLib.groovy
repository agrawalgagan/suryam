package suryam

import com.suryam.util.Constants

import java.text.SimpleDateFormat

class DateTagLib {
    static defaultEncodeAs = [taglib:'html']
    static namespace = "sur"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def dob = {attrs ->
        if(attrs.value)
            out << new SimpleDateFormat(Constants.DOB_FORMAT).format(attrs.value)
    }

    def dateTime = {attrs ->
        if(attrs.value)
            out << new SimpleDateFormat(Constants.DATE_TIME_FORMAT).format(attrs.value)
    }
}
