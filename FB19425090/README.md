# FB19425090

## Issue
Xcode rewrites `.xccurrentversion` and selects wrong Core Data model based on alphabetical order

### Sample Project
This project has a Core Data model with two versions, Newest and Oldest. Every time you set the current model version, or edit `.xccurrentversion` directly to Newest, when the project is closed and open again it will always select the alphabetically latter version.

### Required conditions
- Project uses "folder" rather than "group"
- Core Data with multiple versions, with the latest's title being earlier in alphabetical order 

### Workaround
- Use "Group"

## Environment
- Xcode 16, 26 (All versions)
- macOS 15, 26 (All versions)
