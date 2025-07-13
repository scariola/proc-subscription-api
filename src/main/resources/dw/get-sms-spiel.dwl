%dw 2.0
output application/json
---
{
    "sms-spiel": p(
        lower(vars.formattedSubscriberData.keyword) 
        ++ "." 
        ++ lower(vars.brand.'brand-name' replace " " with "_") 
        ++ if (isEmpty(vars.stateResponse.result)) "" else "." 
        ++ vars.stateResponse.result.state
    ) 
    default 
    p(
        lower(vars.formattedSubscriberData.keyword) 
        ++ "." 
        ++ lower(vars.brand.'brand-name' replace " " with "_") 
        ++ if (isEmpty(vars.stateResponse.result)) "" else "." 
        ++ 'ineligible'
    )
}