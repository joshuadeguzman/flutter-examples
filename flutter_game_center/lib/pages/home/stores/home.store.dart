import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

class HomeStore extends _HomeStore with _$HomeStore {}

abstract class _HomeStore with Store {
  @observable
  int dotaCount = 0;

  @observable
  int fortniteCount = 0;

  @observable
  int codCount = 0;

  @computed
  int get totalCount => dotaCount + fortniteCount + codCount;

  @observable
  double totalAmount = 0;
  @observable
  double totalItems = 0;

  @observable
  bool isTestMode = false;
  @computed
  double get testModeOpacity => isTestMode ? 0.25 : 1;

  @action
  void addItem(String item, int price) {
    totalAmount += price;
    totalItems++;

    if (item.toLowerCase().contains("dota")) {
      dotaCount++;
    } else if (item.toLowerCase().contains("fortnite")) {
      fortniteCount++;
    } else {
      codCount++;
    }
  }

  @action
  void removeItem(String item, int price) {
    if (totalAmount > 0 && totalItems > 0) {
      totalAmount -= price;
      totalItems--;

      if (item.toLowerCase().contains("dota")) {
        dotaCount--;
      } else if (item.toLowerCase().contains("fortnite")) {
        fortniteCount--;
      } else {
        codCount--;
      }
    }
  }

  @action
  void reset() {
    dotaCount = 0;
    fortniteCount = 0;
    codCount = 0;
    totalItems = 0;
    totalAmount = 0;
  }

  @action
  void setIsTestMode(bool isTest) {
    isTestMode = isTest;
  }
}
