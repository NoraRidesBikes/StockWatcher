## Requirements

* iPhone simulator 16 Pro
* iOS 17.6 
* Xcode 16.1
* MacOS 14.6.1 (23G93)

## Running the project

* Clone the repo using `git clone https://github.com/NoraRidesBikes/StockWatcher.git` (or using the client of your choice)
* Open the StockWatcher.xcodeproj file
* Choose the StockWatcher target from the Run menu
* Run the project using the iPhone 16 Pro simulator

## Assumptions

* Stable network connection

## Demo 

1. Authentication with error
2. Successful Authentication
3. Sign Out
3. Create Watchlist
4. Create Watchlist with error
5. Delete Watchlist
6. Create multiple Watchlists
7. View Watchlist entries
8. Search symbols
9. Cancel search
10. Add symbol to watchlist
11. Delete symbol from watchlist
12. Symbol detail view

## Third party dependencies
* KeychainSwift is included via SPM to facilitate the storage of tokens exchanged with the API

## Optimizations and Improvements

* Network error handling
* Enhanced API error handling
* Enhanced use of remember me token
* Build out a robust API implemention
* Use of dependency injection and mocked data for testing purposes 
* Add unit tests
* Add UI tests
* Consolidate Codable structures for API requests
* Improved Group organization
* Identify extension candidates
* Improved UI to indicate API requests are in progress 
* Enhanced local storage implementation (SwiftData)
* Adding SwiftLint to the build process
* Improved Preview functionality

## Known issues
* There is a constraints warning in the console referencing UIRemoteKeyboardPlaceholderView. This appears to be a known issue when using the keyboard in the simulator. Futher investigation is needed to silence this warning. 
