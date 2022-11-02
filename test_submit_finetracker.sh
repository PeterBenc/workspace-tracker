#!/bin/bash

# x=('{"id":1,"synced":false,"comment":"Dev","issue":"ADLT-1633","dateStarted":"2022-10-31T17:15:00.000Z","freeTime":false,"timeSpentSeconds":900,"durationLabel":"15min"}')
x=(
    # '{"id":0,"synced":false,"comment":"Dev","issue":"ADLT-1506","freeTime":false,"timeSpentSeconds":1620,"dateStarted":"2022-10-03T07:35:00.000Z","durationLabel":"15min"}'
    # '{"id":1,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-03T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":2,"synced":false,"comment":"Dev","issue":"ADLT-1492","freeTime":false,"timeSpentSeconds":2400,"dateStarted":"2022-10-03T13:28:00.000Z","durationLabel":"15min"}'
    # '{"id":3,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2022-10-03T14:12:00.000Z","durationLabel":"15min"}'
    # '{"id":4,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2022-10-03T14:31:00.000Z","durationLabel":"15min"}'
    # '{"id":5,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":2700,"dateStarted":"2022-10-03T20:00:00.000Z","durationLabel":"15min"}'
    # '{"id":6,"synced":false,"comment":"Dev","issue":"ADLT-1506","freeTime":false,"timeSpentSeconds":3960,"dateStarted":"2022-10-03T20:45:00.000Z","durationLabel":"15min"}'
    # '{"id":7,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":3180,"dateStarted":"2022-10-03T21:57:00.000Z","durationLabel":"15min"}'
    # '{"id":8,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2022-10-04T07:08:00.000Z","durationLabel":"15min"}'
    # '{"id":9,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2022-10-04T08:30:00.000Z","durationLabel":"15min"}'
    # '{"id":10,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-04T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":11,"synced":false,"comment":"Dev","issue":"ADLT-1625","freeTime":false,"timeSpentSeconds":1680,"dateStarted":"2022-10-04T10:18:00.000Z","durationLabel":"15min"}'
    # '{"id":12,"synced":false,"comment":"Dev","issue":"ADLT-1625","freeTime":false,"timeSpentSeconds":1500,"dateStarted":"2022-10-04T10:52:00.000Z","durationLabel":"15min"}'
    # '{"id":13,"synced":false,"comment":"Dev","issue":"ADLT-1625","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2022-10-04T11:21:00.000Z","durationLabel":"15min"}'
    # '{"id":14,"synced":false,"comment":"Dev","issue":"ADLT-1625","freeTime":false,"timeSpentSeconds":1740,"dateStarted":"2022-10-04T11:41:00.000Z","durationLabel":"15min"}'
    # '{"id":15,"synced":false,"comment":"Dev","issue":"ADLT-1644","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-04T12:22:00.000Z","durationLabel":"15min"}'
    # '{"id":16,"synced":false,"comment":"Dev","issue":"ADLT-1625","freeTime":false,"timeSpentSeconds":1620,"dateStarted":"2022-10-04T14:51:00.000Z","durationLabel":"15min"}'
    # '{"id":17,"synced":false,"comment":"Review","issue":"ADLT-1630","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2022-10-04T15:18:00.000Z","durationLabel":"15min"}'
    # '{"id":18,"synced":false,"comment":"Review","issue":"ADLT-1630","freeTime":false,"timeSpentSeconds":4680,"dateStarted":"2022-10-04T15:36:00.000Z","durationLabel":"15min"}'
    # '{"id":19,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":4680,"dateStarted":"2022-10-04T16:54:00.000Z","durationLabel":"15min"}'
    # '{"id":20,"synced":false,"comment":"Dev","issue":"ADLT-1644","freeTime":false,"timeSpentSeconds":1980,"dateStarted":"2022-10-04T18:16:00.000Z","durationLabel":"15min"}'
    # '{"id":21,"synced":false,"comment":"Dev","issue":"ADLT-1625","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2022-10-04T18:52:00.000Z","durationLabel":"15min"}'
    # '{"id":22,"synced":false,"comment":"Dev","issue":"ADLT-1625","freeTime":false,"timeSpentSeconds":1260,"dateStarted":"2022-10-04T19:08:00.000Z","durationLabel":"15min"}'
    # '{"id":23,"synced":false,"comment":"Dev","issue":"ADLT-1630","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2022-10-04T19:29:00.000Z","durationLabel":"15min"}'
    # '{"id":24,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-05T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":25,"synced":false,"comment":"Review","issue":"ADLT-1630","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2022-10-05T11:06:00.000Z","durationLabel":"15min"}'
    # '{"id":26,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-05T11:30:00.000Z","durationLabel":"15min"}'
    # '{"id":27,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1620,"dateStarted":"2022-10-05T12:19:00.000Z","durationLabel":"15min"}'
    # '{"id":28,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2022-10-05T12:49:00.000Z","durationLabel":"15min"}'
    # '{"id":29,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":3600,"dateStarted":"2022-10-05T13:35:00.000Z","durationLabel":"15min"}'
    # '{"id":30,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":2700,"dateStarted":"2022-10-05T13:45:00.000Z","durationLabel":"15min"}'
    # '{"id":31,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-05T14:30:00.000Z","durationLabel":"15min"}'
    # '{"id":32,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":19080,"dateStarted":"2022-10-05T14:35:00.000Z","durationLabel":"15min"}'
    # '{"id":33,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":4860,"dateStarted":"2022-10-06T07:39:00.000Z","durationLabel":"15min"}'
    # '{"id":34,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-06T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":35,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2022-10-06T11:24:00.000Z","durationLabel":"15min"}'
    # '{"id":36,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2022-10-06T11:44:00.000Z","durationLabel":"15min"}'
    # '{"id":37,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":3300,"dateStarted":"2022-10-06T12:33:00.000Z","durationLabel":"15min"}'
    # '{"id":38,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1680,"dateStarted":"2022-10-06T15:22:00.000Z","durationLabel":"15min"}'
    # '{"id":39,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1380,"dateStarted":"2022-10-06T15:50:00.000Z","durationLabel":"15min"}'
    # '{"id":40,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2022-10-06T16:38:00.000Z","durationLabel":"15min"}'
    # '{"id":41,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1620,"dateStarted":"2022-10-06T17:13:00.000Z","durationLabel":"15min"}'
    # '{"id":42,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1320,"dateStarted":"2022-10-07T07:40:00.000Z","durationLabel":"15min"}'
    # '{"id":43,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":3300,"dateStarted":"2022-10-07T08:05:00.000Z","durationLabel":"15min"}'
    # '{"id":44,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-07T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":45,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1680,"dateStarted":"2022-10-07T10:26:00.000Z","durationLabel":"15min"}'
    # '{"id":46,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2022-10-07T10:54:00.000Z","durationLabel":"15min"}'
    # '{"id":47,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-07T12:00:00.000Z","durationLabel":"15min"}'
    # '{"id":48,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2022-10-07T13:53:00.000Z","durationLabel":"15min"}'
    # '{"id":49,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2022-10-07T14:16:00.000Z","durationLabel":"15min"}'
    # '{"id":50,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2400,"dateStarted":"2022-10-07T14:36:00.000Z","durationLabel":"15min"}'
    # '{"id":51,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-10T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":52,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2220,"dateStarted":"2022-10-10T10:34:00.000Z","durationLabel":"15min"}'
    # '{"id":53,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-10T11:18:00.000Z","durationLabel":"15min"}'
    # '{"id":54,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":4920,"dateStarted":"2022-10-10T11:48:00.000Z","durationLabel":"15min"}'
    # '{"id":55,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":3000,"dateStarted":"2022-10-10T13:32:00.000Z","durationLabel":"15min"}'
    # '{"id":56,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2400,"dateStarted":"2022-10-10T15:41:00.000Z","durationLabel":"15min"}'
    # '{"id":57,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2022-10-10T20:16:00.000Z","durationLabel":"15min"}'
    # '{"id":58,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":4740,"dateStarted":"2022-10-10T20:36:00.000Z","durationLabel":"15min"}'
    # '{"id":59,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":5700,"dateStarted":"2022-10-11T07:26:00.000Z","durationLabel":"15min"}'
    # '{"id":60,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-11T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":61,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1680,"dateStarted":"2022-10-11T10:29:00.000Z","durationLabel":"15min"}'
    # '{"id":62,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2022-10-11T10:57:00.000Z","durationLabel":"15min"}'
    # '{"id":63,"synced":false,"comment":"calendar","issue":"ADLT-1667","freeTime":false,"timeSpentSeconds":2700,"dateStarted":"2022-10-11T11:30:00.000Z","durationLabel":"15min"}'
    # '{"id":64,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2280,"dateStarted":"2022-10-11T12:22:00.000Z","durationLabel":"15min"}'
    # '{"id":65,"synced":false,"comment":"calendar","issue":"ADLT-1677","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-11T13:00:00.000Z","durationLabel":"15min"}'
    # '{"id":66,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2022-10-11T15:49:00.000Z","durationLabel":"15min"}'
    # '{"id":67,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2022-10-11T17:30:00.000Z","durationLabel":"15min"}'
    # '{"id":68,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2022-10-11T17:50:00.000Z","durationLabel":"15min"}'
    # '{"id":69,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":5100,"dateStarted":"2022-10-11T18:16:00.000Z","durationLabel":"15min"}'
    # '{"id":70,"synced":false,"comment":"Dev","issue":"ADLT-1574","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2022-10-11T19:48:00.000Z","durationLabel":"15min"}'
    # '{"id":71,"synced":false,"comment":"calendar","issue":"ADLT-1677","freeTime":false,"timeSpentSeconds":5400,"dateStarted":"2022-10-12T07:30:00.000Z","durationLabel":"15min"}'
    # '{"id":72,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-12T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":73,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":2160,"dateStarted":"2022-10-12T10:32:00.000Z","durationLabel":"15min"}'
    # '{"id":74,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2022-10-12T11:09:00.000Z","durationLabel":"15min"}'
    # '{"id":75,"synced":false,"comment":"calendar","issue":"ADLT-1678","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-12T11:30:00.000Z","durationLabel":"15min"}'
    # '{"id":76,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2022-10-12T12:08:00.000Z","durationLabel":"15min"}'
    # '{"id":77,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":3300,"dateStarted":"2022-10-12T12:54:00.000Z","durationLabel":"15min"}'
    # '{"id":78,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1980,"dateStarted":"2022-10-12T14:39:00.000Z","durationLabel":"15min"}'
    # '{"id":79,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":3420,"dateStarted":"2022-10-12T15:12:00.000Z","durationLabel":"15min"}'
    # '{"id":80,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2022-10-12T16:10:00.000Z","durationLabel":"15min"}'
    # '{"id":81,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":3600,"dateStarted":"2022-10-12T16:28:00.000Z","durationLabel":"15min"}'
    # '{"id":82,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2022-10-13T08:38:00.000Z","durationLabel":"15min"}'
    # '{"id":83,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-13T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":84,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1320,"dateStarted":"2022-10-13T10:34:00.000Z","durationLabel":"15min"}'
    # '{"id":85,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2460,"dateStarted":"2022-10-13T11:12:00.000Z","durationLabel":"15min"}'
    # '{"id":86,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-13T12:00:00.000Z","durationLabel":"15min"}'
    # '{"id":87,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":4260,"dateStarted":"2022-10-13T15:18:00.000Z","durationLabel":"15min"}'
    # '{"id":88,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":4140,"dateStarted":"2022-10-13T16:36:00.000Z","durationLabel":"15min"}'
    # '{"id":89,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":3000,"dateStarted":"2022-10-13T17:46:00.000Z","durationLabel":"15min"}'
    # '{"id":90,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2022-10-14T08:56:00.000Z","durationLabel":"15min"}'
    # '{"id":91,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-14T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":92,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":3780,"dateStarted":"2022-10-14T11:32:00.000Z","durationLabel":"15min"}'
    # '{"id":93,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":1980,"dateStarted":"2022-10-14T12:51:00.000Z","durationLabel":"15min"}'
    # '{"id":94,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-14T13:24:00.000Z","durationLabel":"15min"}'
    # '{"id":95,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":3180,"dateStarted":"2022-10-14T13:56:00.000Z","durationLabel":"15min"}'
    # '{"id":96,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2022-10-14T14:49:00.000Z","durationLabel":"15min"}'
    # '{"id":97,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":3600,"dateStarted":"2022-10-14T15:21:00.000Z","durationLabel":"15min"}'
    # '{"id":98,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2022-10-14T16:21:00.000Z","durationLabel":"15min"}'
    # '{"id":99,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-17T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":100,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2022-10-17T15:35:00.000Z","durationLabel":"15min"}'
    # '{"id":101,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1260,"dateStarted":"2022-10-17T16:07:00.000Z","durationLabel":"15min"}'
    # '{"id":102,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":2760,"dateStarted":"2022-10-17T16:40:00.000Z","durationLabel":"15min"}'
    # '{"id":103,"synced":false,"comment":"Dev","issue":"ADLT-1632","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2022-10-17T17:26:00.000Z","durationLabel":"15min"}'
    # '{"id":104,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":4200,"dateStarted":"2022-10-17T17:46:00.000Z","durationLabel":"15min"}'
    # '{"id":105,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":3000,"dateStarted":"2022-10-18T07:39:00.000Z","durationLabel":"15min"}'
    # '{"id":106,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-18T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":107,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2022-10-18T09:07:00.000Z","durationLabel":"15min"}'
    # '{"id":108,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":4260,"dateStarted":"2022-10-18T09:37:00.000Z","durationLabel":"15min"}'
    # '{"id":109,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":4080,"dateStarted":"2022-10-18T11:27:00.000Z","durationLabel":"15min"}'
    # '{"id":110,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2022-10-18T12:35:00.000Z","durationLabel":"15min"}'
    # '{"id":111,"synced":false,"comment":"calendar","issue":"OP-3","freeTime":false,"timeSpentSeconds":5400,"dateStarted":"2022-10-18T13:00:00.000Z","durationLabel":"15min"}'
    # '{"id":112,"synced":false,"comment":"calendar","issue":"OP-3","freeTime":false,"timeSpentSeconds":5400,"dateStarted":"2022-10-18T13:00:00.000Z","durationLabel":"15min"}'
    # '{"id":113,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2022-10-18T13:08:00.000Z","durationLabel":"15min"}'
    # '{"id":114,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2022-10-18T13:56:00.000Z","durationLabel":"15min"}'
    # '{"id":115,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2760,"dateStarted":"2022-10-18T15:06:00.000Z","durationLabel":"15min"}'
    # '{"id":116,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":4560,"dateStarted":"2022-10-18T15:52:00.000Z","durationLabel":"15min"}'
    # '{"id":117,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2022-10-19T07:57:00.000Z","durationLabel":"15min"}'
    # '{"id":118,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1680,"dateStarted":"2022-10-19T08:33:00.000Z","durationLabel":"15min"}'
    # '{"id":119,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-19T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":120,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2022-10-19T10:18:00.000Z","durationLabel":"15min"}'
    # '{"id":121,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":2160,"dateStarted":"2022-10-19T11:02:00.000Z","durationLabel":"15min"}'
    # '{"id":122,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2022-10-19T12:10:00.000Z","durationLabel":"15min"}'
    # '{"id":123,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2022-10-19T12:48:00.000Z","durationLabel":"15min"}'
    # '{"id":124,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":2700,"dateStarted":"2022-10-19T13:45:00.000Z","durationLabel":"15min"}'
    # '{"id":125,"synced":false,"comment":"Dev","issue":"ADLT-1684","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2022-10-19T13:50:00.000Z","durationLabel":"15min"}'
    # '{"id":126,"synced":false,"comment":"Dev","issue":"ADLT-1651","freeTime":false,"timeSpentSeconds":2460,"dateStarted":"2022-10-19T14:38:00.000Z","durationLabel":"15min"}'
    # '{"id":127,"synced":false,"comment":"Dev","issue":"ADLT-1684","freeTime":false,"timeSpentSeconds":3060,"dateStarted":"2022-10-19T15:21:00.000Z","durationLabel":"15min"}'
    # '{"id":128,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":1980,"dateStarted":"2022-10-19T16:12:00.000Z","durationLabel":"15min"}'
    # '{"id":129,"synced":false,"comment":"Dev","issue":"ADLT-1644","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2022-10-19T16:45:00.000Z","durationLabel":"15min"}'
    # '{"id":130,"synced":false,"comment":"Dev","issue":"ADLT-1507","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2022-10-19T17:04:00.000Z","durationLabel":"15min"}'
    # '{"id":131,"synced":false,"comment":"Dev","issue":"ADLT-1621","freeTime":false,"timeSpentSeconds":11340,"dateStarted":"2022-10-19T17:21:00.000Z","durationLabel":"15min"}'
    # '{"id":132,"synced":false,"comment":"Dev","issue":"ADLT-1684","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2022-10-19T20:30:00.000Z","durationLabel":"15min"}'
    # '{"id":133,"synced":false,"comment":"Dev","issue":"ADLT-1644","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2022-10-20T08:02:00.000Z","durationLabel":"15min"}'
    # '{"id":134,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2022-10-20T08:31:00.000Z","durationLabel":"15min"}'
    # '{"id":135,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-20T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":136,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":2520,"dateStarted":"2022-10-20T10:32:00.000Z","durationLabel":"15min"}'
    # '{"id":137,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":3180,"dateStarted":"2022-10-20T11:14:00.000Z","durationLabel":"15min"}'
    # '{"id":138,"synced":false,"comment":"calendar","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-20T11:30:00.000Z","durationLabel":"15min"}'
    # '{"id":139,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2022-10-20T12:07:00.000Z","durationLabel":"15min"}'
    # '{"id":140,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":1500,"dateStarted":"2022-10-20T13:04:00.000Z","durationLabel":"15min"}'
    # '{"id":141,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":3540,"dateStarted":"2022-10-20T14:58:00.000Z","durationLabel":"15min"}'
    # '{"id":142,"synced":false,"comment":"Dev","issue":"ADLT-1621","freeTime":false,"timeSpentSeconds":1380,"dateStarted":"2022-10-20T15:57:00.000Z","durationLabel":"15min"}'
    # '{"id":143,"synced":false,"comment":"Dev","issue":"ADLT-1684","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2022-10-20T16:26:00.000Z","durationLabel":"15min"}'
    # '{"id":144,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":2340,"dateStarted":"2022-10-20T16:44:00.000Z","durationLabel":"15min"}'
    # '{"id":145,"synced":false,"comment":"Dev","issue":"ADLT-1644","freeTime":false,"timeSpentSeconds":1500,"dateStarted":"2022-10-20T17:23:00.000Z","durationLabel":"15min"}'
    # '{"id":146,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-21T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":147,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2022-10-21T10:50:00.000Z","durationLabel":"15min"}'
    # '{"id":148,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2022-10-21T11:07:00.000Z","durationLabel":"15min"}'
    # '{"id":149,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":6360,"dateStarted":"2022-10-21T11:40:00.000Z","durationLabel":"15min"}'
    # '{"id":150,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-21T13:00:00.000Z","durationLabel":"15min"}'
    # '{"id":151,"synced":false,"comment":"Dev","issue":"ADLT-1621","freeTime":false,"timeSpentSeconds":2940,"dateStarted":"2022-10-21T13:26:00.000Z","durationLabel":"15min"}'
    # '{"id":152,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2022-10-21T14:19:00.000Z","durationLabel":"15min"}'
    # '{"id":153,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":2940,"dateStarted":"2022-10-21T14:49:00.000Z","durationLabel":"15min"}'
    # '{"id":154,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":6240,"dateStarted":"2022-10-21T15:38:00.000Z","durationLabel":"15min"}'
    # '{"id":155,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-24T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":156,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":7800,"dateStarted":"2022-10-24T11:18:00.000Z","durationLabel":"15min"}'
    # '{"id":157,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":4320,"dateStarted":"2022-10-24T16:32:00.000Z","durationLabel":"15min"}'
    # '{"id":158,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":2940,"dateStarted":"2022-10-24T17:45:00.000Z","durationLabel":"15min"}'
    # '{"id":159,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2022-10-25T08:13:00.000Z","durationLabel":"15min"}'
    # '{"id":160,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":1380,"dateStarted":"2022-10-25T08:47:00.000Z","durationLabel":"15min"}'
    # '{"id":161,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-25T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":162,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":5160,"dateStarted":"2022-10-25T10:36:00.000Z","durationLabel":"15min"}'
    # '{"id":163,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":5040,"dateStarted":"2022-10-25T12:02:00.000Z","durationLabel":"15min"}'
    # '{"id":164,"synced":false,"comment":"Dev","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-25T13:27:00.000Z","durationLabel":"15min"}'
    # '{"id":165,"synced":false,"comment":"Dev","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2022-10-25T14:50:00.000Z","durationLabel":"15min"}'
    # '{"id":166,"synced":false,"comment":"Dev","issue":"ADLT-1717","freeTime":false,"timeSpentSeconds":1980,"dateStarted":"2022-10-25T15:14:00.000Z","durationLabel":"15min"}'
    # '{"id":167,"synced":false,"comment":"Dev","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":2220,"dateStarted":"2022-10-25T15:47:00.000Z","durationLabel":"15min"}'
    # '{"id":168,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-26T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":169,"synced":false,"comment":"calendar","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":5400,"dateStarted":"2022-10-26T10:00:00.000Z","durationLabel":"15min"}'
    # '{"id":170,"synced":false,"comment":"Review","issue":"ADLT-1701","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2022-10-26T11:32:00.000Z","durationLabel":"15min"}'
    # '{"id":171,"synced":false,"comment":"Dev","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2022-10-26T12:09:00.000Z","durationLabel":"15min"}'
    # '{"id":172,"synced":false,"comment":"Dev","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2022-10-26T12:47:00.000Z","durationLabel":"15min"}'
    # '{"id":173,"synced":false,"comment":"Dev","issue":"ADLT-1603","freeTime":false,"timeSpentSeconds":1320,"dateStarted":"2022-10-26T13:11:00.000Z","durationLabel":"15min"}'
    # '{"id":174,"synced":false,"comment":"Dev","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":4740,"dateStarted":"2022-10-26T13:33:00.000Z","durationLabel":"15min"}'
    # '{"id":175,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":2700,"dateStarted":"2022-10-26T13:45:00.000Z","durationLabel":"15min"}'
    # '{"id":176,"synced":false,"comment":"Review","issue":"ADLT-1701","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2022-10-26T14:52:00.000Z","durationLabel":"15min"}'
    # '{"id":177,"synced":false,"comment":"Dev","issue":"ADLT-1603","freeTime":false,"timeSpentSeconds":4020,"dateStarted":"2022-10-26T15:26:00.000Z","durationLabel":"15min"}'
    # '{"id":178,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-27T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":179,"synced":false,"comment":"Dev","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":2160,"dateStarted":"2022-10-27T11:06:00.000Z","durationLabel":"15min"}'
    # '{"id":180,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-27T12:00:00.000Z","durationLabel":"15min"}'
    # '{"id":181,"synced":false,"comment":"calendar","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-27T13:15:00.000Z","durationLabel":"15min"}'
    # '{"id":182,"synced":false,"comment":"Dev","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":1380,"dateStarted":"2022-10-27T13:17:00.000Z","durationLabel":"15min"}'
    # '{"id":183,"synced":false,"comment":"Dev","issue":"ADLT-1603","freeTime":false,"timeSpentSeconds":2280,"dateStarted":"2022-10-27T13:49:00.000Z","durationLabel":"15min"}'
    # '{"id":184,"synced":false,"comment":"Review","issue":"ADLT-1616","freeTime":false,"timeSpentSeconds":1860,"dateStarted":"2022-10-27T14:38:00.000Z","durationLabel":"15min"}'
    # '{"id":185,"synced":false,"comment":"Dev","issue":"ADLT-1730","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2022-10-27T15:14:00.000Z","durationLabel":"15min"}'
    # '{"id":186,"synced":false,"comment":"Dev","issue":"ADLT-1691","freeTime":false,"timeSpentSeconds":1980,"dateStarted":"2022-10-27T15:37:00.000Z","durationLabel":"15min"}'
    # '{"id":187,"synced":false,"comment":"Dev","issue":"ADLT-1574","freeTime":false,"timeSpentSeconds":3060,"dateStarted":"2022-10-27T16:10:00.000Z","durationLabel":"15min"}'
    # '{"id":188,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-28T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":189,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2022-10-28T13:42:00.000Z","durationLabel":"15min"}'
    # '{"id":190,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":1620,"dateStarted":"2022-10-28T14:01:00.000Z","durationLabel":"15min"}'
    # '{"id":191,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":2820,"dateStarted":"2022-10-28T14:28:00.000Z","durationLabel":"15min"}'
    # '{"id":192,"synced":false,"comment":"Dev","issue":"ADLT-1574","freeTime":false,"timeSpentSeconds":2340,"dateStarted":"2022-10-28T15:15:00.000Z","durationLabel":"15min"}'
    # '{"id":193,"synced":false,"comment":"Dev","issue":"ADLT-1621","freeTime":false,"timeSpentSeconds":2280,"dateStarted":"2022-10-28T15:54:00.000Z","durationLabel":"15min"}'
    # '{"id":194,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":3060,"dateStarted":"2022-10-28T16:32:00.000Z","durationLabel":"15min"}'
    # '{"id":195,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2022-10-31T09:00:00.000Z","durationLabel":"15min"}'
    # '{"id":196,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2022-10-31T10:00:00.000Z","durationLabel":"15min"}'
    # '{"id":197,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2022-10-31T11:17:00.000Z","durationLabel":"15min"}'
    # '{"id":198,"synced":false,"comment":"Review","issue":"ADLT-1633","freeTime":false,"timeSpentSeconds":3360,"dateStarted":"2022-10-31T11:47:00.000Z","durationLabel":"15min"}'
    # '{"id":199,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2022-10-31T12:43:00.000Z","durationLabel":"15min"}'
    # '{"id":200,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":1980,"dateStarted":"2022-10-31T13:11:00.000Z","durationLabel":"15min"}'
    # '{"id":201,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":5520,"dateStarted":"2022-10-31T13:49:00.000Z","durationLabel":"15min"}'
    # '{"id":202,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":1860,"dateStarted":"2022-10-31T16:40:00.000Z","durationLabel":"15min"}'
    # '{"id":203,"synced":false,"comment":"Review","issue":"ADLT-1633","freeTime":false,"timeSpentSeconds":2760,"dateStarted":"2022-10-31T17:11:00.000Z","durationLabel":"15min"}'
    # '{"id":204,"synced":false,"comment":"Dev","issue":"ADLT-1741","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2022-10-31T18:00:00.000Z","durationLabel":"15min"}'
    # '{"id":205,"synced":false,"comment":"Dev","issue":"ADLT-1633","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2022-10-31T18:32:00.000Z","durationLabel":"15min"}'
)

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