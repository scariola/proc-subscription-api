%dw 2.0
output application/json
---
{
    "sms-spiel": 
        if (!isEmpty(error)) 
        	p('any.any.system-error')
        else if
          (!isEmpty(vars.spielType)) 
            p(
                lower(vars.formattedSubscriberData.keyword) 
                ++ "." 
                ++ if (!isEmpty(vars.vars.brand.'brand-name')) lower(vars.brand.'brand-name' replace " " with "_") else "any" 
                ++ "." 
                ++ vars.spielType
            ) 
        else 
            p(
                lower(vars.formattedSubscriberData.keyword) 
                ++ "." 
                ++ lower(vars.brand.'brand-name' replace " " with "_") 
                ++ if (isEmpty(vars.stateResponse.result)) "" else "." 
                ++ vars.stateResponse.result.state
            )  replace "expiryPlaceholder" with (vars.expiryDetails.'expiry-date' as LocalDateTime {format: "yyyy-MM-dd HH:mm:ss"}) as String {format: "MM/dd/yy, HH:mm"}
        default
        p('any.any.system-error')
}