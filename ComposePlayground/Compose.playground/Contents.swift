//: Please build the scheme 'ComposePlayground' first
import PlaygroundSupport
import Compose

//PlaygroundPage.current.needsIndefiniteExecution = true
let sampleCollection = ComposedUnitCollectionView(frame: CGRect(x:0, y:0, width: 375, height: 100))
//PlaygroundPage.current.liveView = sampleCollection
sampleCollection.backgroundColor = .white

let test = ViewUnit<UILabel>(traits: [.height(100), .backgroundColor(.yellow), .insets(UIEdgeInsets(16))]) { label in
    label.textColor = .white
    label.textAlignment = .center
    label.text = "This is a sample"
    label.backgroundColor = .blue
}

sampleCollection.updateWith { () -> [ComposingUnit] in
    return [test, test]
}





