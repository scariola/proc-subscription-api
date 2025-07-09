%dw 2.0
output application/json

fun getSpiel(map, keyword, brand, spielType) = 
    map[keyword][brand][spielType] default map["ANY"]["ANY"]["system-error"]

---
{
    "sms-spiel": getSpiel(
        readUrl("classpath://dw/mapping-payload-sms-spiels.dwl", "application/json"),
        vars.formattedSubscriberData.keyword default "ANY",
        upper(vars.brand.'brand-name') default "ANY",
        vars.spielType 
    )
}