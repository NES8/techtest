# techtest

## Objective

Create an iOS application that communicates with the Public Marvel API

### Requirements
- See a list of items from Marvel API
- Search or filter contents of this list
- See the full details of any item from this list
- NO SwiftUI

### Project traits
- Swift 5.6
- Xcode 13.3.1
- Uses 3rd party libraries (CocoaPods)

### Includes
- ✅ List done in iOS 13 style
- ⏳ List done in iOS 14 style
- ✅ Item detail
- ✅ Unit test
- ✅ Integration test
- ⏳ UI test
- ⏳ Snapshot test
- ✅ Universal app
- ⏳ Use of Size Classes
- ⏳ Animations
- ⏳ Custom ViewController transitions
- ✅ Documentation

### Run
- Before run project, please install pods using [Cocoapods](https://cocoapods.org/)
- If Xcode can't found a framework, please build (⌘B) it selecting the scheme

# The project

## Architecture

- Adaption of VIPER

### List view

- List is a UICollectionViewController without architecture helpers
- Uses UICollectionViewDiffableDataSource available from iOS 13
- Universal: Similar to TableView on small devices and CollectionView on big screens

### List presenter

- Class without architecture helpers
- It works with a weak reference to view protocol
- Dependence injection: Uses @Inject property wrapper that isn't build safe, so we need test all!

### Detail view
- Simple UI design using Size Classes
- Helped by super classes that manage interaction between view and presenter. For example, presenter can show a loading view or an error message, without extra implementation in DetailViewController.

### Use Case
- Uses Combine framework
- Receives a search query from presenter and manage API calls
- API is also injected using @Inject
 
### Mappers
There is different type of mappers
- Init: A view model can be initialized with a domain model
- Class: Mapper. Tested.
- Self extension: Used to get a domain class from API model

### Localization
- Uses SwiftGen pod
- Available in Spanish and English
- API content isn't translated

## Modularization

- TechTest: Main framework with views and presenters
- Core: Framework with business rules and data API
- TestFoundation: Helpers for tests
- Pods: Cocoapods framework

## Tests

- There are tests on TechTest and Core frameworks. You can run all using ⌘U from the main project
- Tests use XCTestCase.
- Integration test for list and detail, mocking API.
- Unit test for use cases.

## Pods

### View
- [SDWebImage](https://github.com/SDWebImage/SDWebImage): Used to load images from URLs
- [SwiftGen](https://github.com/SwiftGen/SwiftGen): Used to avoid misspeling with images names and translations

### API
- [Alamofire](https://github.com/Alamofire/Alamofire): Used to perform network requests

### Tests
- [Nimble](https://github.com/Quick/Nimble): Used to improve tests readability
- [Shock](https://github.com/justeat/Shock): Used to mock the network request
- [SwiftyMocky](https://github.com/MakeAWishFoundation/SwiftyMocky): Used to create mocks from protocols
