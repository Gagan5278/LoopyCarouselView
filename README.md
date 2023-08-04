# LoopyCarouselView
A carousel example is written in SwiftUI, allowing to creation a loopy view when the Bool parameter is supplied.

# WHY: 
## So why do we need this:
 TabView does not allow to create a circular/loopy carousel. When we apply DragGesture on TabView, the OnEnded method does not listen.
 In order to do this, we can use HStack wrapped by ZStack and listen to drag gestures. 

### Youtube link:
https://youtube.com/shorts/rTUDlbRVVQc?feature=share

Screenshot:
