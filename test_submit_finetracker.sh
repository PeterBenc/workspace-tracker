#!/bin/bash

# x=('{"id":1,"synced":false,"comment":"Dev","issue":"ADLT-1633","dateStarted":"2022-10-31T17:15:00.000Z","freeTime":false,"timeSpentSeconds":900,"durationLabel":"15min"}')
x=(
    # '{"id":8,"synced":false,"comment":"lol","issue":"ADLT-1","dateStarted":"2023-03-30T08:00:00.000Z","freeTime":false,"timeSpentSeconds":900,"durationLabel":"15min"}'
    '{"id":0,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-06T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":1,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-07T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":2,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-08T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":3,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-08T12:00:00.000Z","durationLabel":"15min"}'
    '{"id":4,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-09T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":5,"synced":false,"comment":"calendar","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-09T11:30:00.000Z","durationLabel":"15min"}'
    '{"id":6,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-12T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":7,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-13T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":8,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-14T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":9,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":2700,"dateStarted":"2023-06-14T13:30:00.000Z","durationLabel":"15min"}'
    '{"id":10,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-15T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":11,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-16T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":12,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-19T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":13,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2023-06-19T10:15:00.000Z","durationLabel":"15min"}'
    '{"id":14,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":2460,"dateStarted":"2023-06-19T11:07:00.000Z","durationLabel":"15min"}'
    '{"id":15,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":5280,"dateStarted":"2023-06-19T11:48:00.000Z","durationLabel":"15min"}'
    '{"id":16,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2023-06-19T13:49:00.000Z","durationLabel":"15min"}'
    '{"id":17,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":2280,"dateStarted":"2023-06-19T19:25:00.000Z","durationLabel":"15min"}'
    '{"id":18,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":2580,"dateStarted":"2023-06-19T20:03:00.000Z","durationLabel":"15min"}'
    '{"id":19,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":11220,"dateStarted":"2023-06-19T20:46:00.000Z","durationLabel":"15min"}'
    '{"id":20,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2023-06-20T08:10:00.000Z","durationLabel":"15min"}'
    '{"id":21,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2023-06-20T08:29:00.000Z","durationLabel":"15min"}'
    '{"id":22,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-20T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":23,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-06-20T09:02:00.000Z","durationLabel":"15min"}'
    '{"id":24,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2023-06-20T09:19:00.000Z","durationLabel":"15min"}'
    '{"id":25,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":3300,"dateStarted":"2023-06-20T10:53:00.000Z","durationLabel":"15min"}'
    '{"id":26,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":3420,"dateStarted":"2023-06-20T11:48:00.000Z","durationLabel":"15min"}'
    '{"id":27,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":5940,"dateStarted":"2023-06-20T12:45:00.000Z","durationLabel":"15min"}'
    '{"id":28,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2023-06-20T14:34:00.000Z","durationLabel":"15min"}'
    '{"id":29,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2023-06-20T15:34:00.000Z","durationLabel":"15min"}'
    '{"id":30,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2023-06-20T15:53:00.000Z","durationLabel":"15min"}'
    '{"id":31,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1740,"dateStarted":"2023-06-20T16:17:00.000Z","durationLabel":"15min"}'
    '{"id":32,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":3120,"dateStarted":"2023-06-21T08:15:00.000Z","durationLabel":"15min"}'
    '{"id":33,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-21T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":34,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2023-06-21T09:07:00.000Z","durationLabel":"15min"}'
    '{"id":35,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2023-06-21T10:15:00.000Z","durationLabel":"15min"}'
    '{"id":36,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2023-06-21T11:40:00.000Z","durationLabel":"15min"}'
    '{"id":37,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":2580,"dateStarted":"2023-06-21T12:00:00.000Z","durationLabel":"15min"}'
    '{"id":38,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1620,"dateStarted":"2023-06-21T12:43:00.000Z","durationLabel":"15min"}'
    '{"id":39,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2023-06-21T14:42:00.000Z","durationLabel":"15min"}'
    '{"id":40,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":4380,"dateStarted":"2023-06-21T14:58:00.000Z","durationLabel":"15min"}'
    '{"id":41,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-22T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":42,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-22T12:00:00.000Z","durationLabel":"15min"}'
    '{"id":43,"synced":false,"comment":"Dev","issue":"ADLT-2166","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2023-06-22T12:33:00.000Z","durationLabel":"15min"}'
    '{"id":44,"synced":false,"comment":"Dev","issue":"ADLT-2166","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-06-22T12:50:00.000Z","durationLabel":"15min"}'
    '{"id":45,"synced":false,"comment":"Dev","issue":"ADLT-2166","freeTime":false,"timeSpentSeconds":1500,"dateStarted":"2023-06-22T14:33:00.000Z","durationLabel":"15min"}'
    '{"id":46,"synced":false,"comment":"Dev","issue":"ADLT-2166","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2023-06-22T15:02:00.000Z","durationLabel":"15min"}'
    '{"id":47,"synced":false,"comment":"Dev","issue":"ADLT-2166","freeTime":false,"timeSpentSeconds":4800,"dateStarted":"2023-06-22T15:38:00.000Z","durationLabel":"15min"}'
    '{"id":48,"synced":false,"comment":"Dev","issue":"ADLT-2166","freeTime":false,"timeSpentSeconds":1620,"dateStarted":"2023-06-22T16:58:00.000Z","durationLabel":"15min"}'
    '{"id":49,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-23T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":50,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":4140,"dateStarted":"2023-06-23T09:58:00.000Z","durationLabel":"15min"}'
    '{"id":51,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-23T11:17:00.000Z","durationLabel":"15min"}'
    '{"id":52,"synced":false,"comment":"Dev","issue":"ADLT-2166","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2023-06-23T11:47:00.000Z","durationLabel":"15min"}'
    '{"id":53,"synced":false,"comment":"Review","issue":"ADLT-1902","freeTime":false,"timeSpentSeconds":1260,"dateStarted":"2023-06-23T12:07:00.000Z","durationLabel":"15min"}'
    '{"id":54,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":3900,"dateStarted":"2023-06-23T12:28:00.000Z","durationLabel":"15min"}'
    '{"id":55,"synced":false,"comment":"Dev","issue":"ADLT-2153","freeTime":false,"timeSpentSeconds":8700,"dateStarted":"2023-06-25T21:17:00.000Z","durationLabel":"15min"}'
    '{"id":56,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-06-26T09:00:00.000Z","durationLabel":"15min"}'
)

# curl 'https://finetracker.vacuumlabs.com/api/submit' \
#   -H 'Accept: */*' \
#   -H 'Accept-Language: en-US,en;q=0.9' \
#   -H 'Cache-Control: max-age=0' \
#   -H 'Connection: keep-alive' \
#   -H 'Content-Type: application/json; charset=utf-8' \
#   -H 'Cookie: _ga=GA1.2.76014171.1680465223; _gid=GA1.2.1016546500.1680465223; tenantId=vacuumlabs; ssoToken=biEaMSvFSvNgX4HheIZsm4kUypjjuIJs; connect.sid=s%3AOzMQ8rr9KrN3gS8xS-wZIsj4P5gd6G1Q.jjAYdhWskct91hW%2FVvQC8UQhP2JkDSdyB%2FpeeYWqXlo; _gat=1' \
#   -H 'Origin: https://finetracker.vacuumlabs.com' \
#   -H 'Referer: https://finetracker.vacuumlabs.com/no-referrer' \
#   -H 'Sec-Fetch-Dest: empty' \
#   -H 'Sec-Fetch-Mode: cors' \
#   -H 'Sec-Fetch-Site: same-origin' \
#   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' \
#   -H 'sec-ch-ua: "Chromium";v="110", "Not A(Brand";v="24", "Google Chrome";v="110"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Linux"' \
#   --data-raw '{"id":3,"synced":false,"comment":"lol","issue":"ADLT-1","dateStarted":"2023-03-30T08:00:00.000Z","freeTime":false,"timeSpentSeconds":900,"durationLabel":"15min"}' \
#   --compressed

for t in ${x[@]}; do
  echo $t
  curl 'https://finetracker.vacuumlabs.com/api/submit' \
  -s -o /dev/null -w "%{http_code}" \
  -H 'Accept: */*' \
  -H 'Accept-Language: sk-SK,sk;q=0.9,cs;q=0.8,en-US;q=0.7,en;q=0.6' \
  -H 'Cache-Control: max-age=0' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json; charset=utf-8' \
  -H 'Cookie: _gcl_au=1.1.784417420.1665748638; _rdt_uuid=1665748637810.fbf45c4f-1f22-4d22-adc3-d47d7b824d00; _hjSessionUser_1369478=eyJpZCI6IjFiYzIzMDVhLTU2NGQtNTVmOC1iZGNhLTExNzJkYjVmMWIwZCIsImNyZWF0ZWQiOjE2NjU3NDg2NDA5OTcsImV4aXN0aW5nIjp0cnVlfQ==; _hjSessionUser_2232077=eyJpZCI6IjU1ZGExZjFiLWY2ZTktNThkYi1iNDQ0LWQ0YTk5ZjA0YmMzYiIsImNyZWF0ZWQiOjE2NjU3NDg2Mzc5MzQsImV4aXN0aW5nIjp0cnVlfQ==; _ga_FPWGV1VLZX=GS1.1.1666261721.4.0.1666261721.0.0.0; _ga=GA1.2.80530476.1657624880; _gid=GA1.2.1427531962.1667236590; tenantId=vacuumlabs; ssoToken=2qSHTgibjWzQkFeem9IGmuOUYR89qeGv; connect.sid=s%3A8D0CMpDFWTvwWA8XQTJ_ZD0jo7lNCgwK.CTdu36j6g0BOpGokgVW3Y7Q82ZQ3oTgdZb0A7u7fPtA; _gat=1' \
  -H 'DNT: 1' \
  -H 'Origin: https://finetracker.vacuumlabs.com' \
  -H 'Referer: https://finetracker.vacuumlabs.com/no-referrer' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Google Chrome";v="105", "Not)A;Brand";v="8", "Chromium";v="105"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Linux"' \
  --data-raw $t \
  --compressed
 echo "\n"
 sleep 1
done


# curl 'https://finetracker.vacuumlabs.com/api/submit' \
#   -H 'Accept: */*' \
#   -H 'Accept-Language: en-US,en;q=0.9' \
#   -H 'Cache-Control: max-age=0' \
#   -H 'Connection: keep-alive' \
#   -H 'Content-Type: application/json; charset=utf-8' \
#   -H 'Cookie: _ga=GA1.2.76014171.1680465223; _gid=GA1.2.1016546500.1680465223; tenantId=vacuumlabs; ssoToken=biEaMSvFSvNgX4HheIZsm4kUypjjuIJs; connect.sid=s%3AOzMQ8rr9KrN3gS8xS-wZIsj4P5gd6G1Q.jjAYdhWskct91hW%2FVvQC8UQhP2JkDSdyB%2FpeeYWqXlo; _gat=1' \
#   -H 'Origin: https://finetracker.vacuumlabs.com' \
#   -H 'Referer: https://finetracker.vacuumlabs.com/no-referrer' \
#   -H 'Sec-Fetch-Dest: empty' \
#   -H 'Sec-Fetch-Mode: cors' \
#   -H 'Sec-Fetch-Site: same-origin' \
#   -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36' \
#   -H 'sec-ch-ua: "Chromium";v="110", "Not A(Brand";v="24", "Google Chrome";v="110"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Linux"' \
#   --data-raw '{"id":8,"synced":false,"comment":"lol","issue":"ADLT-1","dateStarted":"2023-03-30T08:00:00.000Z","freeTime":false,"timeSpentSeconds":900,"durationLabel":"15min"}' \
#   --compressed