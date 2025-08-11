# FB19542167

## Issue
`View.sectionAction(content:)` does not appear when used inside of `Form`

### Sample Project
This project shows a `TabView` with `Form` and `List`. Both have `sectionAction` implemented

### Required conditions
- `sectionAction(content:)` implemented inside of `Form`
- iOS or visionOS, not an issue on macOS

### Workaround
- Use `List`

## Environment
- Tesed on iOS 18.5, iOS 26 beta 5(simulator), iPadOS 26 beta 5, visionOS 26 beta 5(simulator).
- macOS 26.0 Beta (25A5316i)

## Link
https://developer.apple.com/documentation/swiftui/view/sectionactions(content:)
