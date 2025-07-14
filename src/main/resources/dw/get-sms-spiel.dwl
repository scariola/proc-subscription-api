%dw 2.0
output application/json
---
{
    "sms-spiel": 
        if (!isEmpty(vars.spielType)) 
            p(
                lower(vars.formattedSubscriberData.keyword) 
                ++ "." 
                ++ "any" default lower(vars.brand.'brand-name' replace " " with "_") 
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
            )
        default
        p('any.any.system-error')
}