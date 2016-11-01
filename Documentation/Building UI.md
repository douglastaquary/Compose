# Composing your UI with ComposingUnits
Learn how to bring together many units to build your UI

### Deciding which units we are going to display
It is really common to see some code like this:

``` swift
func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if data.hasName {
    	if data.hasOtherValue {
    		return 4
    	}
    	return 3
    }
    else {
    	if otherData.validInfo {
    		return 2
    	}
    	return 1
    }
}
```
There is nothing wrong here, but it is really easy to miss some logic and instead of returning 4 items (like in the first if) we ended returning just 3.

To solve this kind of issue we added some methods to [Array](Array.html) that make really easy to see in which condition all items are going to be displayed:

```swift
var items: [ComposingUnit] = []
items.add {
	let headerUnit = HeaderUnit(text:"This is my header")
	return [headerUnit]
}
items.add(manyIf: data.hasOtherValue) {
	let EmptyViewUnit = EmptyViewUnit(height: 10)
	let selectorUnit = ChooseAgeUnit(minAge: 10, maxAge: 100, callback:self.ageChanged(newAge:))
	return [EmptyViewUnit, selectorUnit]
}
items.add(if: otherData.validInfo) {
	let otherUnit = SomeDataUnit(data1:"Some text", height: 240)
	return otherUnit
}

myContainer.state = items
```
###### And that is it. You have all the conditions for each unit to be visible.

If you later need to update the condition for your otherUnit to be visible, you don't mess up with the rest of the units, and adding a new item is also a breeze:

```swift
var items: [ComposingUnit] = []
items.add {
	let headerUnit = HeaderUnit(text:"This is my header")
	return [headerUnit]
}
```
adding new data:

```swift
items.add(ifLet: data.someOptinalArray) { sizes in
	let sizeSelectorUnit = SizeSelectorUnit(avaliableSizes:sizes)
	return [sizeSelectorUnit]
}
```
```swift
items.add(manyIf: data.hasOtherValue) {
	let EmptyViewUnit = EmptyViewUnit(height: 10)
	let selectorUnit = ChooseAgeUnit(minAge: 10, maxAge: 100, callback:self.ageChanged(newAge:))
	return [EmptyViewUnit, selectorUnit]
}
```
change how we add this field:

```swift
items.add(if: otherData.validInfo && data.hasWeirdContext) {
	let otherUnit = SomeDataUnit(data1:"Some text", height: 240)
	return otherUnit
}
```
```swift
myContainer.state = items
```
