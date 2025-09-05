// Copyright 2025 Aryeh Hoffman. All rights reserved.
// Use of this source code is governed by an Apache-2.0 license that can be
// found in the LICENSE file.

import 'package:iterate/iterate.dart';
import 'package:test/test.dart';

void main() {
  group('times', () {
    test('executes method correct number of times', () {
      var count = 0;
      3.times(() => count++);
      expect(count, equals(3));
    });

    test('executes function zero times for zero', () {
      var count = 0;
      0.times(() => count++);
      expect(count, equals(0));
    });

    test('throws RangeError for negative numbers', () {
      expect(() => (-1).times(() {}), throwsA(isA<RangeError>()));
      expect(() => (-5).times(() {}), throwsA(isA<RangeError>()));
    });

    test('returns empty iterable when function provided', () {
      var result = 3.times(() {});
      expect(result, isEmpty);
      expect(result.runtimeType.toString(), equals('EmptyIterable<int>'));
    });

    test('returns correct iterable when no function provided', () {
      var result = 3.times();
      expect(result, isA<Iterable<int>>());
      expect(result.toList(), equals([0, 1, 2]));
    });

    test('returns empty iterable for zero times', () {
      var result = 0.times();
      expect(result, isEmpty);
    });

    test('can be chained with other iterable methods', () {
      var result = 5.times().where((n) => n % 2 == 0).map((n) => n * 10).toList();
      expect(result, equals([0, 20, 40]));
    });

    test('large numbers work correctly', () {
      var count = 0;
      1000.times(() => count++);
      expect(count, equals(1000));

      var largeResult = 1000.times().length;
      expect(largeResult, equals(1000));
    });
  });

  group('upto', () {
    test('executes function for each value in range', () {
      var values = <int>[];
      2.upto(5, (i) => values.add(i));
      expect(values, equals([2, 3, 4, 5]));
    });

    test('executes function once for same start and end', () {
      var values = <int>[];
      5.upto(5, (i) => values.add(i));
      expect(values, equals([5]));
    });

    test('throws RangeError when limit is less than start', () {
      expect(() => 5.upto(3, (i) {}), throwsA(isA<RangeError>()));
      expect(() => 10.upto(0, (i) {}), throwsA(isA<RangeError>()));
    });

    test('returns empty iterable when function provided', () {
      var result = 2.upto(5, (i) {});
      expect(result, isEmpty);
      expect(result.runtimeType.toString(), equals('EmptyIterable<int>'));
    });

    test('returns correct iterable when no function provided', () {
      var result = 2.upto(5);
      expect(result, isA<Iterable<int>>());
      expect(result.toList(), equals([2, 3, 4, 5]));
    });

    test('returns single element iterable for same start and end', () {
      var result = 5.upto(5);
      expect(result.toList(), equals([5]));
    });

    test('can be chained with other iterable methods', () {
      var result = 1.upto(10).where((n) => n % 2 == 0).map((n) => n * 2).toList();
      expect(result, equals([4, 8, 12, 16, 20]));
    });

    test('works with negative numbers', () {
      var result = (-3).upto(-1);
      expect(result.toList(), equals([-3, -2, -1]));
    });

    test('works with large ranges', () {
      var result = 0.upto(1000);
      expect(result.length, equals(1001));
      expect(result.first, equals(0));
      expect(result.last, equals(1000));
    });
  });

  group('downto', () {
    test('executes function for each value in range', () {
      var values = <int>[];
      5.downto(2, (i) => values.add(i));
      expect(values, equals([5, 4, 3, 2]));
    });

    test('executes function once for same start and end', () {
      var values = <int>[];
      5.downto(5, (i) => values.add(i));
      expect(values, equals([5]));
    });

    test('throws RangeError when limit is greater than start', () {
      expect(() => 3.downto(5, (i) {}), throwsA(isA<RangeError>()));
      expect(() => 0.downto(10, (i) {}), throwsA(isA<RangeError>()));
    });

    test('returns empty iterable when function provided', () {
      var result = 5.downto(2, (i) {});
      expect(result, isEmpty);
      expect(result.runtimeType.toString(), equals('EmptyIterable<int>'));
    });

    test('returns correct iterable when no function provided', () {
      var result = 5.downto(2);
      expect(result, isA<Iterable<int>>());
      expect(result.toList(), equals([5, 4, 3, 2]));
    });

    test('returns single element iterable for same start and end', () {
      var result = 5.downto(5);
      expect(result.toList(), equals([5]));
    });

    test('can be chained with other iterable methods', () {
      var result = 10.downto(1).where((n) => n % 3 == 0).map((n) => n * 2).toList();
      expect(result, equals([18, 12, 6]));
    });

    test('works with negative numbers', () {
      var result = (-1).downto(-5);
      expect(result.toList(), equals([-1, -2, -3, -4, -5]));
    });

    test('works with large ranges', () {
      var result = 1000.downto(0);
      expect(result.length, equals(1001));
      expect(result.first, equals(1000));
      expect(result.last, equals(0));
    });
  });

  group('edge cases and integration', () {
    test('all methods work with zero', () {
      expect(0.times().toList(), equals([]));
      expect(0.upto(0).toList(), equals([0]));
      expect(0.downto(0).toList(), equals([0]));
    });

    test('methods can be combined', () {
      var result = <int>[];
      3.times(() {
        2.upto(4, (i) => result.add(i));
      });
      expect(result, equals([2, 3, 4, 2, 3, 4, 2, 3, 4]));
    });

    test('iterables support standard iterable operations', () {
      var timesResult = 3.times();
      expect(timesResult.contains(1), isTrue);
      expect(timesResult.contains(3), isFalse);

      var uptoResult = 2.upto(5);
      expect(uptoResult.any((n) => n > 4), isTrue);
      expect(uptoResult.every((n) => n >= 2), isTrue);

      var downtoResult = 5.downto(2);
      expect(downtoResult.reduce((a, b) => a + b), equals(14));
    });
  });
}
