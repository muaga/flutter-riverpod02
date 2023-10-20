import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 1. "사과" -> 창고에 들어갈 데이터
String data = "사과";

/// 2. FruitStore는 창고, String은 창고 데이터 타입
final fruitProvider = StateNotifierProvider<FruitStore, String>((ref) {
  /// 3. 창고에 "사과"를 전달하고, 그 객체를 adminProvider 즉, 창고 관리자가 관리한다.
  return FruitStore(data);
});

/// 4. 창고
class FruitStore extends StateNotifier<String> {
  /// 5. super.state : 전달 받은 "사과"를 데이터의 상태값으로 등록하는 코드
  FruitStore(super.state);

  /// 6. 창고 관리자가 데이터를 변경하려고 한다.
  void changeData() {
    state = "딸기";
    // state = 상태 함수
  }
}
