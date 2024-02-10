import 'package:managed/annotations.dart';

@ManagedType(scope: ScopeType.singleton)
class SimpleDependency {
  const SimpleDependency({
    required this.count,
  });

  final int count;
}
