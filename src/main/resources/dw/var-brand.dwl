%dw 2.0
output application/json

var redis = vars.brandResponse
var bridge = vars.bridgeResponse

var data = 
    if (!isEmpty(redis.result)) redis.result
    else bridge          
---
data
