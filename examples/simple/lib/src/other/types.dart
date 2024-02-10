import 'package:managed/annotations.dart';

@ManagedType(scope: ScopeType.singleton)
class Empty {
  Empty(this.text);

  final String text;

  @override
  String toString() {
    return 'Empty{text: $text}';
  }
}

@ManagedType(scope: ScopeType.cached)
class Middle {
  Middle(this.empty);

  final Empty empty;

  @override
  String toString() {
    return 'Middle{empty: $empty}';
  }
}

@ManagedType(scope: ScopeType.unique)
class Some {
  Some({
    required this.number,
    required this.flag,
    required this.middle,
    required this.empty,
  });

  final int number;
  final bool flag;
  final Middle middle;
  final Empty empty;

  @override
  String toString() {
    return 'Some{number: $number, flag: $flag, middle: $middle}';
  }
}

@ManagedType(scope: ScopeType.unique)
class Combined {
  final Empty empty;
  final Middle middle;
  final Some some;

  const Combined({
    required this.empty,
    required this.middle,
    required this.some,
  });
}
