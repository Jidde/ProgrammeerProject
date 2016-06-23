#Progress

#Week 1

In the first week I focussed mainly on the design and the implemeting of the database (SQlite) functionality. Also the map and CoreLocation was implemented so that the core functionality of the app was working and the data could be gathered.

#Week 2

In the second week there needed to be made some improvements to SQLite and the background app refresh. This took longer than initially planned. The background app refresh had some difficulties namely: it getting to work even when the app is killed (using startUpdatingSignificationLocationChanges) en getting to push the data to the database. Some time was spent improving the layout of the app and also to start implementing the methods which calculate the statistics and I started making the graphview.

#Week 3

This week I started creating a function which calculates the statistics of one day. After some thinking I reckoned that the statistics of one day weren't really that interesting for a user, so i deleted that and started working on calculating the statistics for a week. I finished the Graphview and the method for calculating the statistics for 1 week. I had a lot of trouble with calculating with the dates using NSDate, so that took up a lot of time. At the end of the week I got everything working (although a bit buggy). I also decided skip the Account settings tab. This was because the settings didn't make sense for a user and because the speed registered in the database was not accurate enough.

#Week 4

The last week was used to improve speed, implement 3D touch, improve the date accuracy (instead of the last 24h, calculation per day). Also the graph was set up for statistics per month. The app still has performance issues meaning that it takes a lot of time calculating the statistics if there is a lot of data. I spent a lot of time thinking about how to improve it. I could have calculated the statistics in the background and push the two arrays to NSUserDefaults but I didn't think this was such an elegant solution and I struggled mayorly with GCD(grand central dispatch) to use background threads and the kind. I also tried to implement an Activity Indicator, but couldn't get it to work properly. Also some time was spent improving the interface by adding some icons, changing colours etc. 


