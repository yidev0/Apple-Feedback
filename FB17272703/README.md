# FB17272703

## Issue
`Form` with `DisclosureGroup` showing a `LazyVGrid` with 43 or more items with spacing 4 and adaptive grid item causes app to crash on iPhone

### Required conditions for the crash.
1. a `List`/`Form` is created with a cell of the List/Form is a `DisclosureGroup`
2. The `DisclosureGroup` must have a LazyVGrid with `[GridItem]` set to `GridItem(.adaptive(minimum: 40, maximum: 80)`, spacing: 4). The spacing can be changed to 6. There needs to be 43 and above items in the grid.
3. `listRowInsets` modifier must be attached to `LazyVGrid`, and set to a non default value. The values that have crashed are `.init(top: 8, leading: 0, bottom: 8, trailing: 8)` and `.listRowInsets(.init(top: 6, leading: 0, bottom: 6, trailing: 8))`.

### Cause of the crash
UpdateCoalescingCollectionView is stuck in a recursive layout loop. This can happen when self-sizing views do not return consistent sizes, or the collection view's frame/bounds/contentOffset is being constantly adjusted.

## Environment
- Xcode 16.3 (16E140)
- iOS 18.4 (22E240)
- iPhone 14 Pro


