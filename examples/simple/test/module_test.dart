import 'package:flutter_test/flutter_test.dart';
import 'package:simple/module.dart';

void main() {
  test('should work', () {
    EmptyProvider.params = EmptyParams(text: "hello");
    MiddleProvider.params = MiddleParams();
    final provider = CombinedProvider.provider;
    final instance = CombinedProvider.provider(
      CombinedParams(
        some: SomeParams(
          number: 0,
          flag: true,
        ),
      ),
    );

    print(instance.some);
    print(instance.some.hashCode);
    print(instance.middle);
    print(instance.middle.hashCode);
    print(instance.middle.empty);
    print(instance.middle.empty.hashCode);
    print(instance.middle.empty.text);
    print(instance.empty);
    print(instance.empty.hashCode);
    print(instance.empty.text);
  });
}
