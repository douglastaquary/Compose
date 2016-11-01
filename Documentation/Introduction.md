# Introduction
What it is, why should you use it and reasons behind making it

## What it is not about?
Well, **Compose** is not a view layout framework. It was not designed to replace any layout engine out there, and you are not supposed to create every component of your app with it. 

**You will keep being free to create your `UIView`s as you just have been doing.**

## What is it for?
So if it is not a layout engine, what is it then?
Well, **Compose** is built to help you put together all these `UIView`s (that you will create using any layout strategy that you want) which compose your app.

## Why did we create it?
Many app screens have more to display than the size of our devices screens, so it is very common to implement these screen on top of a `UICollectionView`/`UITableView` structure.
It can be a list of any thing (todos, song, real state, etc.) or it can be a Detail Screen with more information that fit the screen.

But the dataSource/delegate/cell mechanism can easily (and often) lead to a very hard code to maintain and work with. So we thought

> **"Hey there should be a better way to handle all of this  without screwing up with our codebase"**.

And then Compose was born. What does it do? It tries to encapsulate all data need to render an UI(Table/Collection)ViewCell, so your days of switching the indexPath can be long gone. **All you have to do is creating some encapsulated units and add them to our collectionView.**

### [Learn more about the ComposingUnit API](composingunit-api.html)
