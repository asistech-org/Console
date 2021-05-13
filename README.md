Console
=
One more way to get a number data from the standard input stream.

### Example 1:
```swift
let console = Console()

let a = console.readInt()

print(a, console.report.message, console.report.error, "\n")

let b = console.readDouble()

print(b, console.report.message, console.report.error, "\n")

let c = console.readDouble()

print(c, console.report.message, console.report.error, "\n")
```
#### Console:
```swift
10
Optional(10) The input data is correct. NoError 

1.2
Optional(1.2) The input data is correct. NoError 

qwe
nil The input data is not correct. IncorrectData
```

### Example 2:

```swift
let console = Console()

var a = console.nextInt()
var b = console.nextInt()
var c = console.nextInt()

print(a, b, c)
print(console.report.message, console.report.error, "\n")
```
#### Console:
```swift
10 12 45
Optional(10) Optional(12) Optional(45)
The input data is correct. NoError
```

### Example 3:
```swift
let console = Console()

var a = console.nextInt()
var b = console.nextInt()
var c = console.nextInt()

print(a, b, c)
print(console.report.message, console.report.error, "\n")

a = console.nextInt()
b = console.nextInt()

print(a, b)
print(console.report.message, console.report.error, "\n")

c = console.nextInt()

print(c)
print(console.report.message, console.report.error, "\n")
```
#### Console:
```swift
2 7 3 5 9 8 1 4
Optional(2) Optional(7) Optional(3)
The input data is correct. NoError 

Optional(5) Optional(9)
The input data is correct. NoError 

Optional(8)
The input data is correct. NoError 
```

### Example 4:
```swift
let console = Console()

var a = console.nextInt()
var b = console.nextInt()

print(a, b)
print(console.report.message, console.report.error, "\n")

console.deleteInputSequence()

a = console.nextInt()
b = console.nextInt()

print(a, b)
print(console.report.message, console.report.error, "\n")
```
#### Console:
```swift
2 5 3 7 9
Optional(2) Optional(5)
The input data is correct. NoError 

7 4 3 1 8
Optional(7) Optional(4)
The input data is correct. NoError
```

### Example 5:
```swift
let console = Console()

var a = console.readDoubleArray()

print(a)
print(console.report.message, console.report.error, "\n")
```
#### Console:
```swift
2.5 3 qwe 4.8
[Optional(2.5), Optional(3.0), nil, Optional(4.8)]
The input data is not correct. IncorrectData 
```

### Example 6:
```swift
let console = Console()

guard var a = console.readInt() else {
    throw console.report.error
}

print(a)
```
#### Console:
```swift
10
10
```
#### Console:
```swift
qwe
Fatal error: Error raised at top level: Console.Console.Report.IncorrectData: file Swift/ErrorType.swift, line 200
2020-09-05 08:35:41.957398 Console[6063:133538] Fatal error: Error raised at top level: Console.Console.Report.IncorrectData: file Swift/ErrorType.swift, line 200
```

### Example 7:
```swift
let console = Console()

if let a = console.readInt() {
    print(a + 1)
} else {
    print(console.report.message)
}
```
#### Console:
```swift
11
12
```
#### Console:
```swift
qwe
The input data is not correct.
```
#### Console:
```swift

The input data is empty.
```
