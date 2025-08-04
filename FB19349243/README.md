# FB19349243

## Issue
`TabSection("Title")` interprets "Title" as `StringProtocol` rathar than `LocalizedStringKey`, when using `TabView(selection:, content:)`

### Sample Project
This project includes an app fulfillng the conditions below.
It includes localization files for testing, current workarounds, and Preview for easy comparisons. 

### Required conditions
- `TabView` is using `SidebarAdaptableTabViewStyle`
- `TabView` with selection
- `TabSection` is declared as `TabSection(_ title: S, ...)`

### Potential Cause
`TabSection` is declared in the following order, which is different from `Label`, `Text`, and `Section` where the initalizer with `LocalizedStringKey` is declared before the one with `StringProtocol`.
```swift
public init<S>(_ title: S, @TabContentBuilder<SelectionValue> content: () -> Content) where Header == Text, Footer == EmptyView, S : StringProtocol
public init(_ titleKey: LocalizedStringKey, @TabContentBuilder<SelectionValue> content: () -> Content) where Header == Text, Footer == EmptyView
public init(_ titleResource: LocalizedStringResource, @TabContentBuilder<SelectionValue> content: () -> Content) where Header == Text, Footer == EmptyView
```

### Workaround
1. Use `LocalizedStringKey` or `LocalizedStringResource` when declaring `TabSection(_ title:)`
2. Use `TabSection(content:, header:)` instead of `TabSection(_ title:)`
3. Don't use `TabView(selection:, content:)` 

## Environment
- iPad, Mac
- iPadOS 18.5(tested in simulator), iPadOS 26.0(dev beta 4)
- macOS 26.0 Beta (25A5316i)


