import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_02/fruit_store.dart';

void main() {
  /// 7. Riverpod을 사용하기 위해 ProviderScopoe로 MyApp을 설정한다.
  runApp(ProviderScope(
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FruitPage(),
    );
  }
}

/// 8. 위젯을 ConsumerWidget으로 만들어 Provider을 구독한다.
class FruitPage extends ConsumerWidget {
  const FruitPage({super.key});

  @override

  /// 9. ConsumerWidget 클래스의 build 메소드는 WidgetRef를 참조할 수 있다.
  /*
    ref를 통해 Provider가 관리하는 상태(데이터)에 접근할 수 있다.
    ref.watch()는 상태 값이 변경되는 것을 계속 수신할 때 사용한다.
    StateNotifierProvider는 상태 변경이 가능하기 때문에 watch()로 수신한다.
  */
  Widget build(BuildContext context, WidgetRef ref) {
    /// 10. fruitProvider를 구독하여, FruitStore의 data를 가져 온다.
    String data = ref.watch(fruitProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("data : $data", style: TextStyle(fontSize: 30)),
            ElevatedButton(
                onPressed: () {
                  /// 11. ★ ref.read()메소드로 FruitStore에 접근하여 변경값을 알릴 준비 한다.
                  FruitStore fruitStore = ref.read(fruitProvider.notifier);

                  /// 12. FruitStore의 상태값을 변경한다. (사과 => 딸기)
                  fruitStore.changeData();
                },
                child: Text("딸기로 상태 변경"))
          ],
        ),
      ),
    );
  }
}
