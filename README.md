# Compose
[![Build Status](https://travis-ci.org/vivareal/Compose.svg)](https://travis-ci.org/vivareal/Compose)
[![codecov.io](http://codecov.io/github/vivareal/Compose/coverage.svg)](http://codecov.io/github/vivareal/Compose)
[![Version](https://img.shields.io/cocoapods/v/Compose.svg?style=flat)](http://cocoapods.org/pods/Compose)
[![Pod Platform](https://img.shields.io/cocoapods/p/Compose.svg)](http://cocoapods.org/pods/Compose)
[![Pod License](https://img.shields.io/cocoapods/l/Compose.svg)](https://github.com/vivareal/Compose/blob/master/LICENSE)

Compose is a data driven library that will help compose your complex and dynamic Views.

## Motivation
We built Compose so we could easy manage and A/B test our complex views.

That instead of dealing with many dataSources and delegates methods, we could focus on delivering shine and new components. Instead of switching `indexPaths` we could change each component position as we wished.

## ComposingUnit
The protocol [ComposingUnit](https://vivareal.github.io/Compose/Protocols/ComposingUnit.html) is at the center of this library. Any class or struct can conform to it, and it has few properties and methods that needs to be implemented. It should store all data that will be presented by this unit. 

A unit also is responsible for selecting which UIView will render it's data, and once an UIView is dequeued from a container, it is also the unit job to bind that data to the view.

## ComposingContainer
A ComposingContainer is an UIView that knows how do display an array of `ComposingUnit`s. We provide two containers in the framework: `ComposingCollectionView` and `ComposingTableView`. Both have **automatic** detection of inserts/updates/deletes of ComposingUnits they are displaying.

## Example

So, for you to get an example, after creating some units we could easly **compose** our view like this:

```swift
units.add {
	let topSeparator = LoginUnits.SpacerUnit(id: "top", height: 14)
    let header = LoginUnits.HeaderUnit()
    return [topSeparator, header]
}
units.add {
	let username = LoginUnits.UsernameUnit(current: viewState.username, callback: updateUsername(newUsername:))
    let password = LoginUnits.PasswordUnit(current: viewState.password, callback: updatePassword(newPassword:))
    return [username, password]
}
let continueButton = LoginUnits.ContinueButtonUnit(enabled: viewState.validData, callback: doTryLogin)
units.append(continueButton)

collectionView.state = units
``` 
Here, we can clearly see (and change if we want) the order each unit will be added to the array. Also, if any unit needed some business logic to check if it should be added to the array, we could easily do something like this:

```swift
units.add(manyIfLet: state.description) { text in
	let header = DetailViewUnits.HeaderDescriptionUnit(header: "Description")
	let description = DetailViewUnits.DescriptionUnit(text: text, expanded: state.descriptionExpanded)
	return [header, description]
}
```
So, if `state.description` is not nil, then we should display an header and description units. There are many operators for conditional checks, conditional closures, if/let unwrappers and more.

If you got interested, there are many working examples inside the **Example project**.
##### Running the Example project
To run the example project, clone the repo, and open the xcode Project from the Example directory.

## Installation

Compose is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Compose"
```

## Documentation
You can find all documentation about Compose here: [Documentation](https://vivareal.github.io/Compose/index.html)

## Author

Bruno Bilescky, [brunogb@gmail.com](mailto:brunogb@gmail.com)

## License

Compose is available under the MIT license. See the LICENSE file for more info.
