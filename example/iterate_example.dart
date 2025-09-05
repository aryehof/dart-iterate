// Copyright 2025 Aryeh Hoffman. All rights reserved.
// Use of this source code is governed by an Apache-2.0 license that can be
// found in the LICENSE file.

import 'package:iterate/iterate.dart';

void main() {
  // three methods are provided that act on integers...
  // times, upto, and downto

  3.times(() => print("hello"));

  2.upto(7, (i) => print(i));

  38.downto(35, (i) => print(i));

  // Not providing a function means that an Iterator is returned that
  // supports method chaining. Use Dart methods like map, where, reduce
  // and forEach.

  1.upto(10).where((n) => n % 2 == 0).forEach((n) => print(n));
  // outputs even numbers between 1 and 10

  5.times().map((n) => n + 100).forEach(print);
  // outputs 100, 200, 300, 400, 500

  // Each method returns an Iterable<int>. If a function is supplied
  // then Iterable.empty is returned.
  var e = 3.times(() => print("returns an empty iterable"));
  assert(e.runtimeType.toString() == "EmptyIterable<int>");

  // If a function is not supplied, then an Iterable
  // representing the method values is returned.
  Iterable<int> f = 3.times();
  assert(f.isNotEmpty);
  assert(f.toList().toString() == "[0, 1, 2]");
}
