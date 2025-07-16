%dw 2.0
output application/json
---
{
  "sms-spiel": 
    if (isEmpty(error)) 
      p(
        lower(vars.formattedSubscriberData.keyword default "any") 
        ++ "." 
        ++ lower((vars.brand.'brand-name' default "any") replace " " with "_") 
        ++ (if (isEmpty(vars.state.state)) "" else "." ++ vars.state.state)
      ) replace "expiryPlaceholder" with (
        (vars.expiryDetails.'expiry-date' as LocalDateTime {format: "yyyy-MM-dd HH:mm:ss"}) 
          as String {format: "MM/dd/yy, HH:mm"}
      )
    else if (["ineligible", "invalid_keyword", "unsupported"] contains lower(error.errorType.identifier default ""))
      p(
        lower(vars.formattedSubscriberData.keyword default "any") 
        ++ "." 
        ++ lower((vars.brand.'brand-name' default "any") replace " " with "_") 
        ++ "." 
        ++ lower(error.errorType.identifier replace "_" with "-")
      )
    else
      p("any.any.system-error")
}