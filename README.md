# iterate

[![Pub Package](https://img.shields.io/pub/v/event.svg?style=flat-square)](https://pub.dev/packages/iterate)

Small helper iteration methods inspired by Ruby.

---

This package includes 3 extension methods on Integers:

- **times**
```dart
    3.times(() => print("hello"));
```
- **upto**
```dart
    2.upto(5, (i) => print(i));
```
- **downto**
```dart
    38.downto(35, (i) => print(i));
```

Use as an Iterable to chain methods

```dart
1.upto(10)
    .where((n) => n % 2 == 0)
    .forEach(print);
```

Each of these is an extension method on an integer which can (optionally) take a function as argument. If a function is provided, then it is executed for each value of the method. 

If a function is not provided as an argument, then an Iterable is returned. This allows for methods to be chained with existing methods like 'where', 'map' and 'forEach'.

Each method returns an Iterable<int>. If a function is supplied then Iterable.empty is returned. If not supplied, then an Iterable representing the method values is returned.

This will make more sense after looking at the following examples:-

### Examples

> Note: see also the iterate_example.dart file in the example folder

#### times

```dart
3.times( () => print("hello") );

hello
hello
hello
```

#### upto

```dart
2.upto(5, (i) => print(i) );

2
3
4
5
```

#### downto

```dart
38.downto(35, (i) => print(i));

38
37
36
35
```

#### Example Iterables

If a function is not provided as an argument, then each method returns an iterable that can be chained:

```dart
3.times()
    .map((n) => n + 100)
    .forEach((n) => print(n));

100
200
300
```


```dart
// outputs even numbers between 1 and 10

1.upto(10)
    .where((n) => n % 2 == 0)
    .forEach(print);

2
4
6
8
```

```dart
// Each method returns an Iterable<int>. If a function is supplied
// then Iterable.empty is returned. If not supplied, then an Iterable
// representing the method values is returned.

// function provided
var e = 5.times(() => print("test"));
assert(e.runtimeType.toString() == "EmptyIterable<int>");

// no function
var f = 3.times();
assert(f is Iterable<int>);
assert(f.isNotEmpty);
assert(f.toList() == [0, 1, 2]);

```

## Usage

Add the iterage package to your pubspec.yaml file.

```
$ dart pub add iterate
```

Import the iterate package in your code file.

```dart
import 'package:iterate/iterate.dart';
```

## What's New

See the [Changelog][changelog] for details on changes in each version.

## Requesting Features and Reporting Bugs

Please add feature requests and report bugs at the [issue tracker][tracker].

## Dependencies

None.

This Dart package has no non-development dependencies on other packages.

[eventsubscriber]: https://pub.dev/packages/iterate
[tracker]: https://github.com/aryehof/dart-iterate/issues
[changelog]: https://pub.dev/packages/iterate/changelog

## Copyright

Copyright 2025 Aryeh Hoffman. All rights reserved.

Use of this source code is governed by an Apache-2.0 license that can be found in the LICENSE file.

