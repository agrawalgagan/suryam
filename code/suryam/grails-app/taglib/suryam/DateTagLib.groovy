package suryam

import java.text.SimpleDateFormat

class DateTagLib {
    static defaultEncodeAs = [taglib:'html']
    static namespace = "sur"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def dob = {attrs ->
        if(attrs.value)
            out << new SimpleDateFormat("dd/MM/yyyy").format(attrs.value)
    }
}
