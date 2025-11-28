import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavigationBarProvider = NotifierProvider(
  BottomNavigationBarNotifier.new,
);

class BottomNavigationBarNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setBottomIndex(int index) {
    state = index;
  }
}
