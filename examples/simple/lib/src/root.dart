import 'package:managed/annotations.dart';
import 'package:simple/src/dep/simple_dep.dart';

@ManagedType(scope: ScopeType.unique)
class Root with Addition {
  final SimpleDependency simpleDependency;
  final SimpleDependency posSimpleDependency;

  const Root(
    this.posSimpleDependency, {
    required this.simpleDependency,
  });
}

mixin Addition {}
