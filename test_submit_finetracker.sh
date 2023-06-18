#!/bin/bash

# x=('{"id":1,"synced":false,"comment":"Dev","issue":"ADLT-1633","dateStarted":"2022-10-31T17:15:00.000Z","freeTime":false,"timeSpentSeconds":900,"durationLabel":"15min"}')
x=(
    # '{"id":8,"synced":false,"comment":"lol","issue":"ADLT-1","dateStarted":"2023-03-30T08:00:00.000Z","freeTime":false,"timeSpentSeconds":900,"durationLabel":"15min"}'
    '{"id":0,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":6060,"dateStarted":"2023-05-01T11:43:00.000Z","durationLabel":"15min"}'
    '{"id":1,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1500,"dateStarted":"2023-05-01T13:34:00.000Z","durationLabel":"15min"}'
    '{"id":2,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":7200,"dateStarted":"2023-05-01T14:05:00.000Z","durationLabel":"15min"}'
    '{"id":3,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3660,"dateStarted":"2023-05-01T19:51:00.000Z","durationLabel":"15min"}'
    '{"id":4,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1260,"dateStarted":"2023-05-01T20:52:00.000Z","durationLabel":"15min"}'
    '{"id":5,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3000,"dateStarted":"2023-05-02T06:43:00.000Z","durationLabel":"15min"}'
    '{"id":6,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2023-05-02T07:33:00.000Z","durationLabel":"15min"}'
    '{"id":7,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-02T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":8,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2820,"dateStarted":"2023-05-02T12:37:00.000Z","durationLabel":"15min"}'
    '{"id":9,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":4980,"dateStarted":"2023-05-02T15:50:00.000Z","durationLabel":"15min"}'
    '{"id":10,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":4200,"dateStarted":"2023-05-02T17:13:00.000Z","durationLabel":"15min"}'
    '{"id":11,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1680,"dateStarted":"2023-05-03T08:33:00.000Z","durationLabel":"15min"}'
    '{"id":12,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-03T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":13,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2280,"dateStarted":"2023-05-03T11:28:00.000Z","durationLabel":"15min"}'
    '{"id":14,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":5040,"dateStarted":"2023-05-03T12:06:00.000Z","durationLabel":"15min"}'
    '{"id":15,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":2700,"dateStarted":"2023-05-03T13:30:00.000Z","durationLabel":"15min"}'
    '{"id":16,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3540,"dateStarted":"2023-05-03T14:26:00.000Z","durationLabel":"15min"}'
    '{"id":17,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2160,"dateStarted":"2023-05-03T15:25:00.000Z","durationLabel":"15min"}'
    '{"id":18,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-04T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":19,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2023-05-04T10:15:00.000Z","durationLabel":"15min"}'
    '{"id":20,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3660,"dateStarted":"2023-05-04T10:32:00.000Z","durationLabel":"15min"}'
    '{"id":21,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2023-05-04T11:33:00.000Z","durationLabel":"15min"}'
    '{"id":22,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2023-05-04T12:09:00.000Z","durationLabel":"15min"}'
    '{"id":23,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3240,"dateStarted":"2023-05-04T12:27:00.000Z","durationLabel":"15min"}'
    '{"id":24,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3180,"dateStarted":"2023-05-04T14:26:00.000Z","durationLabel":"15min"}'
    '{"id":25,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2023-05-04T15:19:00.000Z","durationLabel":"15min"}'
    '{"id":26,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":4320,"dateStarted":"2023-05-04T15:35:00.000Z","durationLabel":"15min"}'
    '{"id":27,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2700,"dateStarted":"2023-05-04T22:02:00.000Z","durationLabel":"15min"}'
    '{"id":28,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-05T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":29,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2023-05-05T12:06:00.000Z","durationLabel":"15min"}'
    '{"id":30,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":1260,"dateStarted":"2023-05-05T14:10:00.000Z","durationLabel":"15min"}'
    '{"id":31,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2023-05-05T14:35:00.000Z","durationLabel":"15min"}'
    '{"id":32,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2580,"dateStarted":"2023-05-05T15:24:00.000Z","durationLabel":"15min"}'
    '{"id":33,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":5340,"dateStarted":"2023-05-05T16:07:00.000Z","durationLabel":"15min"}'
    '{"id":34,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-05-05T17:37:00.000Z","durationLabel":"15min"}'
    '{"id":35,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":10560,"dateStarted":"2023-05-05T17:52:00.000Z","durationLabel":"15min"}'
    '{"id":36,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-08T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":37,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1380,"dateStarted":"2023-05-08T09:51:00.000Z","durationLabel":"15min"}'
    '{"id":38,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2023-05-08T10:16:00.000Z","durationLabel":"15min"}'
    '{"id":39,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1740,"dateStarted":"2023-05-08T11:26:00.000Z","durationLabel":"15min"}'
    '{"id":40,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2023-05-08T12:05:00.000Z","durationLabel":"15min"}'
    '{"id":41,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":8160,"dateStarted":"2023-05-08T12:51:00.000Z","durationLabel":"15min"}'
    '{"id":42,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2023-05-08T15:07:00.000Z","durationLabel":"15min"}'
    '{"id":43,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3060,"dateStarted":"2023-05-08T15:23:00.000Z","durationLabel":"15min"}'
    '{"id":44,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":1680,"dateStarted":"2023-05-09T08:17:00.000Z","durationLabel":"15min"}'
    '{"id":45,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-09T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":46,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-05-09T14:10:00.000Z","durationLabel":"15min"}'
    '{"id":47,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-05-09T14:46:00.000Z","durationLabel":"15min"}'
    '{"id":48,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":2160,"dateStarted":"2023-05-09T15:10:00.000Z","durationLabel":"15min"}'
    '{"id":49,"synced":false,"comment":"calendar","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-09T15:15:00.000Z","durationLabel":"15min"}'
    '{"id":50,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":58260,"dateStarted":"2023-05-09T16:04:00.000Z","durationLabel":"15min"}'
    '{"id":51,"synced":false,"comment":"Review","issue":"ADLT-2118","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2023-05-10T08:15:00.000Z","durationLabel":"15min"}'
    '{"id":52,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2023-05-10T08:23:00.000Z","durationLabel":"15min"}'
    '{"id":53,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-10T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":54,"synced":false,"comment":"Review","issue":"ADLT-2116","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2023-05-10T11:23:00.000Z","durationLabel":"15min"}'
    '{"id":55,"synced":false,"comment":"Review","issue":"ADLT-2116","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2023-05-10T12:08:00.000Z","durationLabel":"15min"}'
    '{"id":56,"synced":false,"comment":"Review","issue":"ADLT-2116","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2023-05-10T12:40:00.000Z","durationLabel":"15min"}'
    '{"id":57,"synced":false,"comment":"Dev","issue":"ADLT-1038","freeTime":false,"timeSpentSeconds":1500,"dateStarted":"2023-05-10T13:06:00.000Z","durationLabel":"15min"}'
    '{"id":58,"synced":false,"comment":"Review","issue":"ADLT-2116","freeTime":false,"timeSpentSeconds":2520,"dateStarted":"2023-05-10T13:40:00.000Z","durationLabel":"15min"}'
    '{"id":59,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2023-05-10T14:22:00.000Z","durationLabel":"15min"}'
    '{"id":60,"synced":false,"comment":"Review","issue":"ADLT-2118","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2023-05-10T14:40:00.000Z","durationLabel":"15min"}'
    '{"id":61,"synced":false,"comment":"Dev","issue":"ADLT-2116","freeTime":false,"timeSpentSeconds":2580,"dateStarted":"2023-05-10T15:12:00.000Z","durationLabel":"15min"}'
    '{"id":62,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-05-11T08:44:00.000Z","durationLabel":"15min"}'
    '{"id":63,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-11T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":64,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2580,"dateStarted":"2023-05-11T10:33:00.000Z","durationLabel":"15min"}'
    '{"id":65,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2023-05-11T11:32:00.000Z","durationLabel":"15min"}'
    '{"id":66,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-11T12:00:00.000Z","durationLabel":"15min"}'
    '{"id":67,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2460,"dateStarted":"2023-05-11T12:31:00.000Z","durationLabel":"15min"}'
    '{"id":68,"synced":false,"comment":"Review","issue":"ADLT-2116","freeTime":false,"timeSpentSeconds":4620,"dateStarted":"2023-05-11T15:43:00.000Z","durationLabel":"15min"}'
    '{"id":69,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":4260,"dateStarted":"2023-05-11T17:04:00.000Z","durationLabel":"15min"}'
    '{"id":70,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-05-12T07:54:00.000Z","durationLabel":"15min"}'
    '{"id":71,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2160,"dateStarted":"2023-05-12T08:09:00.000Z","durationLabel":"15min"}'
    '{"id":72,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-12T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":73,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":6720,"dateStarted":"2023-05-12T10:19:00.000Z","durationLabel":"15min"}'
    '{"id":74,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1200,"dateStarted":"2023-05-12T12:39:00.000Z","durationLabel":"15min"}'
    '{"id":75,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":6720,"dateStarted":"2023-05-12T13:28:00.000Z","durationLabel":"15min"}'
    '{"id":76,"synced":false,"comment":"Review","issue":"ADLT-2116","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-12T15:20:00.000Z","durationLabel":"15min"}'
    '{"id":77,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3720,"dateStarted":"2023-05-12T15:50:00.000Z","durationLabel":"15min"}'
    '{"id":78,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-15T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":79,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1980,"dateStarted":"2023-05-15T10:20:00.000Z","durationLabel":"15min"}'
    '{"id":80,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3600,"dateStarted":"2023-05-15T11:24:00.000Z","durationLabel":"15min"}'
    '{"id":81,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2160,"dateStarted":"2023-05-15T12:24:00.000Z","durationLabel":"15min"}'
    '{"id":82,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2023-05-15T13:07:00.000Z","durationLabel":"15min"}'
    '{"id":83,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2023-05-15T14:10:00.000Z","durationLabel":"15min"}'
    '{"id":84,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3720,"dateStarted":"2023-05-15T14:53:00.000Z","durationLabel":"15min"}'
    '{"id":85,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":4680,"dateStarted":"2023-05-15T15:55:00.000Z","durationLabel":"15min"}'
    '{"id":86,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2023-05-16T08:19:00.000Z","durationLabel":"15min"}'
    '{"id":87,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2023-05-16T08:43:00.000Z","durationLabel":"15min"}'
    '{"id":88,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-16T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":89,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2023-05-16T09:13:00.000Z","durationLabel":"15min"}'
    '{"id":90,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3420,"dateStarted":"2023-05-16T10:16:00.000Z","durationLabel":"15min"}'
    '{"id":91,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1500,"dateStarted":"2023-05-16T11:25:00.000Z","durationLabel":"15min"}'
    '{"id":92,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2023-05-16T11:50:00.000Z","durationLabel":"15min"}'
    '{"id":93,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2023-05-16T12:22:00.000Z","durationLabel":"15min"}'
    '{"id":94,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2040,"dateStarted":"2023-05-16T14:20:00.000Z","durationLabel":"15min"}'
    '{"id":95,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1260,"dateStarted":"2023-05-16T17:07:00.000Z","durationLabel":"15min"}'
    '{"id":96,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2023-05-16T17:31:00.000Z","durationLabel":"15min"}'
    '{"id":97,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1320,"dateStarted":"2023-05-16T18:35:00.000Z","durationLabel":"15min"}'
    '{"id":98,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2023-05-16T18:57:00.000Z","durationLabel":"15min"}'
    '{"id":99,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3660,"dateStarted":"2023-05-16T19:44:00.000Z","durationLabel":"15min"}'
    '{"id":100,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1020,"dateStarted":"2023-05-16T20:46:00.000Z","durationLabel":"15min"}'
    '{"id":101,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":11760,"dateStarted":"2023-05-16T21:03:00.000Z","durationLabel":"15min"}'
    '{"id":102,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":4140,"dateStarted":"2023-05-17T00:19:00.000Z","durationLabel":"15min"}'
    '{"id":103,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1500,"dateStarted":"2023-05-17T07:47:00.000Z","durationLabel":"15min"}'
    '{"id":104,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1980,"dateStarted":"2023-05-17T08:22:00.000Z","durationLabel":"15min"}'
    '{"id":105,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-17T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":106,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1680,"dateStarted":"2023-05-17T10:20:00.000Z","durationLabel":"15min"}'
    '{"id":107,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3780,"dateStarted":"2023-05-17T10:54:00.000Z","durationLabel":"15min"}'
    '{"id":108,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2023-05-17T11:57:00.000Z","durationLabel":"15min"}'
    '{"id":109,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1920,"dateStarted":"2023-05-17T12:29:00.000Z","durationLabel":"15min"}'
    '{"id":110,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":2700,"dateStarted":"2023-05-17T13:30:00.000Z","durationLabel":"15min"}'
    '{"id":111,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1320,"dateStarted":"2023-05-17T15:15:00.000Z","durationLabel":"15min"}'
    '{"id":112,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1260,"dateStarted":"2023-05-17T15:37:00.000Z","durationLabel":"15min"}'
    '{"id":113,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3360,"dateStarted":"2023-05-17T15:58:00.000Z","durationLabel":"15min"}'
    '{"id":114,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-18T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":115,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1380,"dateStarted":"2023-05-18T10:56:00.000Z","durationLabel":"15min"}'
    '{"id":116,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2023-05-18T12:04:00.000Z","durationLabel":"15min"}'
    '{"id":117,"synced":false,"comment":"Review","issue":"ADLT-2116","freeTime":false,"timeSpentSeconds":1620,"dateStarted":"2023-05-18T15:44:00.000Z","durationLabel":"15min"}'
    '{"id":118,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2023-05-18T16:42:00.000Z","durationLabel":"15min"}'
    '{"id":119,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3300,"dateStarted":"2023-05-18T18:15:00.000Z","durationLabel":"15min"}'
    '{"id":120,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2160,"dateStarted":"2023-05-18T19:10:00.000Z","durationLabel":"15min"}'
    '{"id":121,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":9720,"dateStarted":"2023-05-18T19:46:00.000Z","durationLabel":"15min"}'
    '{"id":122,"synced":false,"comment":"Review","issue":"ADLT-2116","freeTime":false,"timeSpentSeconds":1380,"dateStarted":"2023-05-18T22:28:00.000Z","durationLabel":"15min"}'
    '{"id":123,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3960,"dateStarted":"2023-05-18T22:59:00.000Z","durationLabel":"15min"}'
    '{"id":124,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-19T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":125,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2820,"dateStarted":"2023-05-19T10:14:00.000Z","durationLabel":"15min"}'
    '{"id":126,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2220,"dateStarted":"2023-05-19T11:01:00.000Z","durationLabel":"15min"}'
    '{"id":127,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2023-05-19T11:43:00.000Z","durationLabel":"15min"}'
    '{"id":128,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2023-05-19T12:31:00.000Z","durationLabel":"15min"}'
    '{"id":129,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":4740,"dateStarted":"2023-05-19T13:47:00.000Z","durationLabel":"15min"}'
    '{"id":130,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1320,"dateStarted":"2023-05-19T15:06:00.000Z","durationLabel":"15min"}'
    '{"id":131,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-05-20T11:08:00.000Z","durationLabel":"15min"}'
    '{"id":132,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":3180,"dateStarted":"2023-05-20T11:23:00.000Z","durationLabel":"15min"}'
    '{"id":133,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2023-05-20T12:16:00.000Z","durationLabel":"15min"}'
    '{"id":134,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":2340,"dateStarted":"2023-05-20T13:17:00.000Z","durationLabel":"15min"}'
    '{"id":135,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-22T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":136,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-23T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":137,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-24T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":138,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-25T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":139,"synced":false,"comment":"calendar","issue":"ADLT-1","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-25T12:00:00.000Z","durationLabel":"15min"}'
    '{"id":140,"synced":false,"comment":"Review","issue":"ADLT-2121","freeTime":false,"timeSpentSeconds":2100,"dateStarted":"2023-05-25T12:45:00.000Z","durationLabel":"15min"}'
    '{"id":141,"synced":false,"comment":"Dev","issue":"ADLT-2062","freeTime":false,"timeSpentSeconds":3000,"dateStarted":"2023-05-25T13:32:00.000Z","durationLabel":"15min"}'
    '{"id":142,"synced":false,"comment":"Dev","issue":"ADLT-2062","freeTime":false,"timeSpentSeconds":1080,"dateStarted":"2023-05-25T14:24:00.000Z","durationLabel":"15min"}'
    '{"id":143,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":8160,"dateStarted":"2023-05-25T14:54:00.000Z","durationLabel":"15min"}'
    '{"id":144,"synced":false,"comment":"Review","issue":"ADLT-2121","freeTime":false,"timeSpentSeconds":2820,"dateStarted":"2023-05-25T17:17:00.000Z","durationLabel":"15min"}'
    '{"id":145,"synced":false,"comment":"Dev","issue":"ADLT-1506","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-05-25T18:04:00.000Z","durationLabel":"15min"}'
    '{"id":146,"synced":false,"comment":"Dev","issue":"ADLT-2139","freeTime":false,"timeSpentSeconds":1440,"dateStarted":"2023-05-25T18:19:00.000Z","durationLabel":"15min"}'
    '{"id":147,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":45600,"dateStarted":"2023-05-25T18:43:00.000Z","durationLabel":"15min"}'
    '{"id":148,"synced":false,"comment":"Dev","issue":"ADLT-2062","freeTime":false,"timeSpentSeconds":1380,"dateStarted":"2023-05-26T07:23:00.000Z","durationLabel":"15min"}'
    '{"id":149,"synced":false,"comment":"Dev","issue":"ADLT-2152","freeTime":false,"timeSpentSeconds":2160,"dateStarted":"2023-05-26T08:19:00.000Z","durationLabel":"15min"}'
    '{"id":150,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-26T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":151,"synced":false,"comment":"Review","issue":"ADLT-2062","freeTime":false,"timeSpentSeconds":1740,"dateStarted":"2023-05-26T11:07:00.000Z","durationLabel":"15min"}'
    '{"id":152,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1260,"dateStarted":"2023-05-26T11:36:00.000Z","durationLabel":"15min"}'
    '{"id":153,"synced":false,"comment":"Review","issue":"ADLT-2062","freeTime":false,"timeSpentSeconds":1380,"dateStarted":"2023-05-26T11:57:00.000Z","durationLabel":"15min"}'
    '{"id":154,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":5820,"dateStarted":"2023-05-26T12:20:00.000Z","durationLabel":"15min"}'
    '{"id":155,"synced":false,"comment":"Review","issue":"ADLT-2062","freeTime":false,"timeSpentSeconds":2100,"dateStarted":"2023-05-26T13:57:00.000Z","durationLabel":"15min"}'
    '{"id":156,"synced":false,"comment":"Dev","issue":"ADLT-2152","freeTime":false,"timeSpentSeconds":1140,"dateStarted":"2023-05-26T14:32:00.000Z","durationLabel":"15min"}'
    '{"id":157,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-29T09:00:00.000Z","durationLabel":"15min"}'
    '{"id":158,"synced":false,"comment":"Dev","issue":"ADLT-2154","freeTime":false,"timeSpentSeconds":1320,"dateStarted":"2023-05-29T11:10:00.000Z","durationLabel":"15min"}'
    '{"id":159,"synced":false,"comment":"Dev","issue":"ADLT-2154","freeTime":false,"timeSpentSeconds":960,"dateStarted":"2023-05-29T11:32:00.000Z","durationLabel":"15min"}'
    '{"id":160,"synced":false,"comment":"Dev","issue":"ADLT-2154","freeTime":false,"timeSpentSeconds":1320,"dateStarted":"2023-05-29T11:54:00.000Z","durationLabel":"15min"}'
    '{"id":161,"synced":false,"comment":"Dev","issue":"ADLT-2152","freeTime":false,"timeSpentSeconds":900,"dateStarted":"2023-05-29T14:04:00.000Z","durationLabel":"15min"}'
    '{"id":162,"synced":false,"comment":"Dev","issue":"ADLT-2152","freeTime":false,"timeSpentSeconds":4620,"dateStarted":"2023-05-29T14:27:00.000Z","durationLabel":"15min"}'
    '{"id":163,"synced":false,"comment":"Dev","issue":"ADLT-2154","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-29T15:44:00.000Z","durationLabel":"15min"}'
    '{"id":164,"synced":false,"comment":"Dev","issue":"ADLT-2073","freeTime":false,"timeSpentSeconds":1560,"dateStarted":"2023-05-29T16:14:00.000Z","durationLabel":"15min"}'
    '{"id":165,"synced":false,"comment":"calendar","issue":"ADLT-1081","freeTime":false,"timeSpentSeconds":1800,"dateStarted":"2023-05-30T09:00:00.000Z","durationLabel":"15min"}'    
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