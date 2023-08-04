# LoopyCarouselView
A carousel example is written in SwiftUI, allowing to creation a loopy view when the Bool parameter is supplied.

# WHY: 
## So why do we need this:
 TabView does not allow to create a circular/loopy carousel. When we apply DragGesture on TabView, the OnEnded method does not listen.
 In order to do this, we can use HStack wrapped by ZStack and listen to drag gestures. 

### Youtube link:
https://youtube.com/shorts/rTUDlbRVVQc?feature=share

### Screenshot:
![Screenshot](https://github.com/Gagan5278/LoopyCarouselView/assets/2304583/a178fb86-5543-4747-9d2a-427fd9b475d8)

### How to use

Drag and drop ImageCarouselView.swift file in your app. 

In your ContentView

```
                GeometryReader{ geometry in
                    ImageCarouselView(imageCount: 3,  activeIndex: $activeIndex, shouldLoop: true) {
                     Image("First Image")
                     Image("Second Image")
                     Image("Third Image")
                }
            }
            .frame(height: 200, alignment: .center)
```

In case you want to disable the loop, pass **_shouldLoop_** as **_false_**.

**activeIndex** can be used to show the custom page control current index.

### NOTE: Please download the code for more.
