// Copyright 2025 Aryeh Hoffman. All rights reserved.
// Use of this source code is governed by an Apache-2.0 license that can be
// found in the LICENSE file.

extension IntExtensions on int {
  /// Calls the given `function` the number of times of the `receiver` value (>= 0).
  ///
  /// If no `function` is given, an `Iterable` is returned that supports chaining.
  ///
  /// Example
  ///  ```dart
  /// 2.times(() => print('hello'));  // outputs hello hello
  ///
  ///   -or-
  ///
  /// 2.times().forEach(print);   // use existing Iterable method
  ///                             // outputs 0 1
  /// ```
  Iterable<int> times([void Function()? f]) {
    if (this < 0) {
      throw RangeError("times expects to be applied to a number greater than or equal to 0");
    }
    if (f != null) {
      for (var i = 0; i < this; i++) {
        f();
      }
      return Iterable.empty();
    }
    return Iterable<int>.generate(this, (i) => i);
  }

  /// Calls the given `function` with each integer value, from the `receiver` value
  /// **up to** the provided `limit`.
  ///
  /// If no `function` is given, an `Iterable` is returned that supports chaining.
  ///
  /// Example:
  /// ```dart
  /// 4.upto(6, (i) => print(i));  // outputs 4 5 6
  ///
  ///   -or-
  ///
  /// 4.upto(6).forEach(print);   // use existing Iterable method
  /// ```
  Iterable<int> upto(int limit, [void Function(int)? f]) {
    if (limit < this) {
      throw RangeError("The ending number must be greater than the starting number");
    }
    if (f != null) {
      for (var i = this; i < limit + 1; i++) {
        f(i);
      }
      return Iterable.empty();
    }
    return Iterable<int>.generate(limit - this + 1, (i) => i + this);
  }

  /// Calls the given `function` with each integer value, from the `receiver` value
  /// **down to** the provided limit.
  ///
  /// If no `function` is given, an `Iterable` is returned that supports chaining.
  ///
  /// Example:
  /// ```dart
  /// 9.downto(5, (i) => print(i)); // outputs 9,8,7,6,5
  ///
  ///   -or-
  ///
  /// 9.downto(5).contains(7);    // returns true
  ///                             // uses existing Iterable method
  /// ```
  Iterable<int> downto(int limit, [void Function(int)? f]) {
    if (limit > this) {
      throw RangeError("The starting number must be greater than the ending number");
    }
    if (f != null) {
      for (var i = this; i >= limit; i--) {
        f(i);
      }
      return Iterable.empty();
    }
    return Iterable<int>.generate(this - limit + 1, (i) => this - i);
  }
}
