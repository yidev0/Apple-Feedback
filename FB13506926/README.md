# FB13506926: When adding onDrag on a item in a List, clicking on the text does not select the sidebar

## Issue
When using SwiftUI.List with .onDrag causes the item to become not selectable when clicking on the text.

## Steps to reproduce
Steps to reproduce:
1. Create a List
2. Add an item to the List
3. Add .onDrop with a returning NSitemProvider
Run the app on Mac, at this point the issue should appear.
4. Remove .onDrop from the code. This will fix the issue

## Platform
| Platform | Issue |
| --- | --- |
| macOS | TRUE |
| iPadOS | FALSE | 

## Video
<img src="Mac.mov" height=400>


