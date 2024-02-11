# FB13607219

## Issue
In the environment detailed below, when going to another app then back, the button in the navigation bar disappears for the detail part of NavigationSplitView. 

### How to reproduce:
1. Create a NavigationSplitView. 
2. In sidebar, add List(selection:)
3. In detail, add a button to open other apps or a SwiftUI.Link.
4. Add a item to the navigation bar.
5. Run the app, then click the button in the detail to open another app/browser.
6. Return to the app, and the navigation item disappears. 

This issue can also be recreated using NavigationLink(destination:,label:).


### Environment:
- This issue only happens on iPad, with Stage Manager turned off.
- In the simulator, I have tested iOS 17.0.1, 17.2, 17.4 versions of iPad Air, and have been able to create this in all versions
- Xcode Version 15.2 (15C500b) was used to compile this


