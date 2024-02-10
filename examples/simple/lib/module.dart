import 'dart:async';
import 'package:managed/managed.dart';
import 'src/dep/simple_dep.dart';
import 'src/root.dart';
import 'dart:core';
import 'src/other/types.dart';
import 'src/dep/temp.dart';

// **************************************************************************
// ManagedGenerator
// **************************************************************************

class ManageRoot = Manage<Root> with RootProvider;

class RootParams extends Params {
  RootParams();

  @override
  Type get targetType => Root;

  @override
  void inject(
    ZoneValues values,
    Map<Type, Manage> dependencies,
  ) {}
}

mixin RootProvider on Manage<Root> {
  static final _provider = ManageRoot(
    _managed,
    scope: ScopeType.unique,
    dependsOn: [
      SimpleDependencyProvider.provider,
      SimpleDependencyProvider.provider,
    ],
  );

  static Manage<Root> get provider {
    assert(SimpleDependencyProvider.params != null, "");
    assert(SimpleDependencyProvider.params != null, "");
    return _provider;
  }

  static Root _managed() {
    final zone = Zone.current;
    return Root(
      Manage.resolve(),
      simpleDependency: Manage.resolve(),
    );
  }

  @override
  Root call([covariant RootParams? params]) {
    final ZoneValues values = {};
    final deps = {for (final dep in dependencies) dep.managedType: dep};
    params?.inject(values, deps);
    values.addEntries(deps.entries.map((e) => MapEntry(e.key, e.value())));
    return runZoned(() {
      return callForGenerated();
    }, zoneValues: values);
  }
}

// **************************************************************************
// ManagedGenerator
// **************************************************************************

class ManageEmpty = Manage<Empty> with EmptyProvider;

class EmptyParams extends Params {
  EmptyParams({required this.text});

  final String text;

  @override
  Type get targetType => Empty;

  @override
  void inject(
    ZoneValues values,
    Map<Type, Manage> dependencies,
  ) {
    values[#text] = text;
  }
}

mixin EmptyProvider on Manage<Empty> {
  static final _provider = ManageEmpty(
    _managed,
    scope: ScopeType.singleton,
    dependsOn: [],
  );

  static EmptyParams? params;

  static Manage<Empty> get provider {
    return _provider;
  }

  static Empty _managed() {
    final zone = Zone.current;
    return Empty(zone[#text]);
  }

  @override
  Empty call([covariant EmptyParams? params]) {
    final ZoneValues values = {};
    final deps = {for (final dep in dependencies) dep.managedType: dep};
    EmptyProvider.params!.inject(values, deps);
    values.addEntries(deps.entries.map((e) => MapEntry(e.key, e.value())));
    return runZoned(() {
      return callForGenerated();
    }, zoneValues: values);
  }
}

class ManageMiddle = Manage<Middle> with MiddleProvider;

class MiddleParams extends Params {
  MiddleParams();

  @override
  Type get targetType => Middle;

  @override
  void inject(
    ZoneValues values,
    Map<Type, Manage> dependencies,
  ) {}
}

mixin MiddleProvider on Manage<Middle> {
  static final _provider = ManageMiddle(
    _managed,
    scope: ScopeType.cached,
    dependsOn: [EmptyProvider.provider],
  );

  static MiddleParams? params;

  static Manage<Middle> get provider {
    assert(EmptyProvider.params != null, "");
    return _provider;
  }

  static Middle _managed() {
    final zone = Zone.current;
    return Middle(Manage.resolve());
  }

  @override
  Middle call([covariant MiddleParams? params]) {
    final ZoneValues values = {};
    final deps = {for (final dep in dependencies) dep.managedType: dep};
    MiddleProvider.params!.inject(values, deps);
    values.addEntries(deps.entries.map((e) => MapEntry(e.key, e.value())));
    return runZoned(() {
      return callForGenerated();
    }, zoneValues: values);
  }
}

class ManageSome = Manage<Some> with SomeProvider;

class SomeParams extends Params {
  SomeParams({
    required this.number,
    required this.flag,
  });

  final int number;

  final bool flag;

  @override
  Type get targetType => Some;

  @override
  void inject(
    ZoneValues values,
    Map<Type, Manage> dependencies,
  ) {
    values[#number] = number;
    values[#flag] = flag;
  }
}

mixin SomeProvider on Manage<Some> {
  static final _provider = ManageSome(
    _managed,
    scope: ScopeType.unique,
    dependsOn: [
      MiddleProvider.provider,
      EmptyProvider.provider,
    ],
  );

  static Manage<Some> get provider {
    assert(MiddleProvider.params != null, "");
    assert(EmptyProvider.params != null, "");
    return _provider;
  }

  static Some _managed() {
    final zone = Zone.current;
    return Some(
      number: zone[#number],
      flag: zone[#flag],
      middle: Manage.resolve(),
      empty: Manage.resolve(),
    );
  }

  @override
  Some call([covariant SomeParams? params]) {
    final ZoneValues values = {};
    final deps = {for (final dep in dependencies) dep.managedType: dep};
    params?.inject(values, deps);
    values.addEntries(deps.entries.map((e) => MapEntry(e.key, e.value())));
    return runZoned(() {
      return callForGenerated();
    }, zoneValues: values);
  }
}

class ManageCombined = Manage<Combined> with CombinedProvider;

class CombinedParams extends Params {
  CombinedParams({required this.some});

  final SomeParams some;

  @override
  Type get targetType => Combined;

  @override
  void inject(
    ZoneValues values,
    Map<Type, Manage> dependencies,
  ) {
    values[some.targetType] = dependencies.remove(some.targetType)?.call(some);
  }
}

mixin CombinedProvider on Manage<Combined> {
  static final _provider = ManageCombined(
    _managed,
    scope: ScopeType.unique,
    dependsOn: [
      EmptyProvider.provider,
      MiddleProvider.provider,
      SomeProvider.provider,
    ],
  );

  static Manage<Combined> get provider {
    assert(EmptyProvider.params != null, "");
    assert(MiddleProvider.params != null, "");
    return _provider;
  }

  static Combined _managed() {
    final zone = Zone.current;
    return Combined(
      empty: Manage.resolve(),
      middle: Manage.resolve(),
      some: Manage.resolve(),
    );
  }

  @override
  Combined call([covariant CombinedParams? params]) {
    final ZoneValues values = {};
    final deps = {for (final dep in dependencies) dep.managedType: dep};
    params?.inject(values, deps);
    values.addEntries(deps.entries.map((e) => MapEntry(e.key, e.value())));
    return runZoned(() {
      return callForGenerated();
    }, zoneValues: values);
  }
}

// **************************************************************************
// ManagedGenerator
// **************************************************************************

class ManageTemp = Manage<Temp> with TempProvider;

class TempParams extends Params {
  TempParams();

  @override
  Type get targetType => Temp;

  @override
  void inject(
    ZoneValues values,
    Map<Type, Manage> dependencies,
  ) {}
}

mixin TempProvider on Manage<Temp> {
  static final _provider = ManageTemp(
    _managed,
    scope: ScopeType.unique,
    dependsOn: [],
  );

  static Manage<Temp> get provider {
    return _provider;
  }

  static Temp _managed() {
    final zone = Zone.current;
    return Temp();
  }

  @override
  Temp call([covariant TempParams? params]) {
    final ZoneValues values = {};
    final deps = {for (final dep in dependencies) dep.managedType: dep};
    params?.inject(values, deps);
    values.addEntries(deps.entries.map((e) => MapEntry(e.key, e.value())));
    return runZoned(() {
      return callForGenerated();
    }, zoneValues: values);
  }
}

// **************************************************************************
// ManagedGenerator
// **************************************************************************

class ManageSimpleDependency = Manage<SimpleDependency>
    with SimpleDependencyProvider;

class SimpleDependencyParams extends Params {
  SimpleDependencyParams({required this.count});

  final int count;

  @override
  Type get targetType => SimpleDependency;

  @override
  void inject(
    ZoneValues values,
    Map<Type, Manage> dependencies,
  ) {
    values[#count] = count;
  }
}

mixin SimpleDependencyProvider on Manage<SimpleDependency> {
  static final _provider = ManageSimpleDependency(
    _managed,
    scope: ScopeType.singleton,
    dependsOn: [],
  );

  static SimpleDependencyParams? params;

  static Manage<SimpleDependency> get provider {
    return _provider;
  }

  static SimpleDependency _managed() {
    final zone = Zone.current;
    return SimpleDependency(count: zone[#count]);
  }

  @override
  SimpleDependency call([covariant SimpleDependencyParams? params]) {
    final ZoneValues values = {};
    final deps = {for (final dep in dependencies) dep.managedType: dep};
    SimpleDependencyProvider.params!.inject(values, deps);
    values.addEntries(deps.entries.map((e) => MapEntry(e.key, e.value())));
    return runZoned(() {
      return callForGenerated();
    }, zoneValues: values);
  }
}
