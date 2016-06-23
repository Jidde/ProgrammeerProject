#TrackYourTravels

This application tracks your travels. It registers whether or not you are on the go using the startMonitoringSignificantLocationChanges method. It then calculates how much time you spent traveling and draws a custom graph.

![Track_your_travels](/TrackYourTravels/Track_your_travels.png)

#Model
The technical design of the application is as follows: working through the MVC model, the model contains an 

- SQLite class which contains the functionality of the database and can be accessed through a singleton. The SQLite or DatbaseManager class contains four methods: connecting to the database, creating a table, writing and reading from the database. 
- The LocationItem class is used for creating a locationObject which is used for reading to the database. 
- The Statistics class contains the functions which calculate the statistics of the traveling behaviour. The class contain 3 methods. The first calculates the time between two dates. In calculations in periods of 24h, therefore the current date is set to the end of today: 23:59:59, so the calculation uses whole days/dates. The next method calculates the time in minutes between two timestamps. Both these methods are used in the last method, which takes an Int (the number of days used for the calculation) and returns an array with the time traveled per day. This method loops over the data in the database, takes the timestamps and calculates the time between the timestamps for a number of days. If the time between two timestamps is bigger than 30 minutes, it will be registered as 'not traveling' and the time will not be added to the array.

#View
- The View contains the Main.Storyboard which contains most of the layout. 
- The GraphView class contains a custom view which renders the graphView. The graph is drawn using Core Graphics and using the data from the Statistics class.

#Controller
- The Controller contains the App Delegate which handles the 3D touch on the Homescreen. 
- The FirstViewcontrollers handles the map in the map tab of the tabBarController, the location updates and the pushes of the location updates to the database.
- The SecondViewController handles the graphView and the sets some labels to their values.

#Challenges
The biggest flaw in the application is that it takes a long time to calculate the statistics if there is a lot of data in the database. I skipped the Account settings tab, because of lack of accuracy in recording the speed of the user and because it was actually a bit superfluous. It did only degrade the user experience. I tried to improve the performance of the app by checking out NSUserDefaults and GCD (Grand central dispatch), but no luck unfortunately. The app could be improved by doing the calculations at different time, or in the background and by changing the way the graph is drawn: first draw the background etc and load the view and then draw the actual line.







