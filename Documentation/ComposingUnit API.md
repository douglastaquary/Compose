# Creating an Unit
Learn how to create a ComposingUnit ad the benefits of using it

### What is a ComposingUnit?
It's a simple protocol that puts together all info needed to display your data. You can make it a `Struct` to deliver immutable and predictable data render, or you can use a `Class` and make some dynamic behavior. Or you can **mix** them together.

#### So, to display some data, a ComposingUnit needs to answer 3 questions:

1. What's the **identifier** of this unit (so we can track and dynamically animate inserts and deletes)
2. What is the [dimension unit](what-is-a-dimensionunit.html) that represents it's **height** and it's **width**
3. What is the **reuse identifier** that will be used to retrieve some UICollectionViewCell/UITableViewCell that will represent this unit.

#### and it also needs to know how to do these tasks:

* How to configure the view that represents this unit. (Once a view has been dequeued, the unit must know how to configure it)
* How to register a UICollectionViewCell (if this unit can be added to an UICollectionView)
* How to register a UITableViewCell (if this unit can be added to an UITableView)

So let's create a simple unit that will display an empty view with a given color:

```swift
struct EmptyViewUnit {
	let identifier: String
	let backgroundColor: UIColor
	let heightUnit: DimensionUnit
	
	func configure(view: UIView) {
		view.backgroundColor = backgroundColor
	}
	
	func reuseIdentifier()-> String {
		return UICollectionViewCell.identifier()
	}
	
	func register(in collectionView: UICollectionView) {
		UICollectionViewCell.register(in: collectionView)
	}
	
}

let separator = EmptyViewUnit(identifier:"separator", backgroundColor: .red, height: 120)
```
As you can see, it's really simple to define your own unit. 

And because `reuseIdentifier` and `register(in:)` are methods, you could choose different views to display the same data.


#### When you get some units together it is time to [putting them together and building your UI](building-ui.html)
