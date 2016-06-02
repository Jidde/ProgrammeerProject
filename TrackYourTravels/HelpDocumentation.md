# HelpDocumentation

MapKit:
https://www.raywenderlich.com/87008/overlay-views-mapkit-swift-tutorial

CoreGraphics:
https://www.raywenderlich.com/90690/modern-core-graphics-with-swift-part-1
https://www.raywenderlich.com/90693/modern-core-graphics-with-swift-part-2
https://www.raywenderlich.com/90695/modern-core-graphics-with-swift-part-3

Background App Refresh:
https://www.raywenderlich.com/92428/background-modes-ios-swift-tutorial

State Restoration:
https://www.raywenderlich.com/1914/nscoding-tutorial-for-ios-how-to-save-your-app-data

SQLite:
https://github.com/stephencelis/SQLite.swift

(http):
https://www.raywenderlich.com/110458/nsurlsession-tutorial-getting-started

CLLocation:
https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/LocationAwarenessPG/CoreLocation/CoreLocation.html

significant-change location service:

If your iOS app must keep monitoring location even while it’s in the background, use the standard location service and specify the location value of the UIBackgroundModes key to continue running in the background and receiving location updates. (In this situation, you should also make sure the location manager’s pausesLocationUpdatesAutomatically property is set to YES to help conserve power.) Examples of apps that might need this type of location updating are fitness or turn-by-turn navigation apps.
If GPS-level accuracy isn’t critical for your app and you don’t need continuous tracking, you can use the significant-change location service. It’s crucial that you use the significant-change location service correctly, because it wakes the system and your app at least every 15 minutes, even if no location changes have occurred, and it runs continuously until you stop it.
