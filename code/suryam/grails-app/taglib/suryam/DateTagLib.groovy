package suryam

import com.suryam.util.Constants
import com.suryam.util.DateUtil

import java.text.SimpleDateFormat

class DateTagLib {
    //static defaultEncodeAs = [taglib:'html']
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

    def dateTimePicker = {attrs->
        String name = attrs.name
        String id = attrs.id ? attrs.id : name
        String required = attrs.required ? "required" : ""
        def value = attrs.value? DateUtil.format(attrs.value, Constants.DATE_TIME_FORMAT) : ""
        String str = """
            <script>
            \$(function(){
                \$("#${id}").datetimepicker({
                    format : 'd/m/Y H:i'
                })
            })
            </script>
            <input type="text" name="${name}" id="${id}" value="${value}" ${required}/>
        """

        out << str
    }

    def datePicker = {attrs->
        String name = attrs.name
        String id = attrs.id ? attrs.id : name
        String required = attrs.required ? "required" : ""
        def value = attrs.value? DateUtil.format(attrs.value, Constants.DATE_FORMAT) : ""
        String str = """
            <script>
            \$(function(){
                \$("#${id}").datetimepicker({
                    format : 'd/m/Y',
                    timepicker : false
                })
            })
            </script>
            <input type="text" name="${name}" id="${id}" value="${value}" ${required}/>
        """

        out << str
    }
}
