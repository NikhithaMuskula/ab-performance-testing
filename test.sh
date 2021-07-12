#!/bin/sh


var=$(curl -s -X POST https://restful-booker.herokuapp.com/auth  -H 'Content-Type: application/json'  -d '{"username" : "admin","password" : "password123"}' | jq -r '.token')

#echo $var
#curl -X PUT \
#  https://restful-booker.herokuapp.com/booking/1 \
#  -H 'Content-Type: application/json' \
#  -H 'Accept: application/json' \
#  -H "Cookie: token= $var " -d '{"firstname" : "James","lastname" : "Brown","totalprice" : 111,"depositpaid" : true,"bookingdates" : {"checkin" : "2018-01-01","checkout" : "2019-01-01"},"additionalneeds" : "Breakfast"}'

ab -n 1 -c 1 -u ./inputFiles/update.json -T application/json -C token=$var -H 'Accept:application/json' https://restful-booker.herokuapp.com/booking/1

