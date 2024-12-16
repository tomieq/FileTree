# FileTree is simple library to dump content of directory

```swift
let output = FileTree().tree
let output = FileTree("/Users/tomieq/tmp/to_delete/filetree").tree
let output = FileTree().tree { url, isDir in
    url.absoluteString
}
print(output)
```
