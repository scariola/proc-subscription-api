%dw 2.0
output application/json

var keyword = vars.formattedSubscriberData.keyword
var state = if (keyword == "OPT-IN" or keyword == "BONUS") 1 else 0
---
{
    state: state
}