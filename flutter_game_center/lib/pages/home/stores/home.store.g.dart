// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  Computed<int>? _$totalCountComputed;

  @override
  int get totalCount => (_$totalCountComputed ??=
          Computed<int>(() => super.totalCount, name: '_HomeStore.totalCount'))
      .value;
  Computed<double>? _$testModeOpacityComputed;

  @override
  double get testModeOpacity => (_$testModeOpacityComputed ??= Computed<double>(
          () => super.testModeOpacity,
          name: '_HomeStore.testModeOpacity'))
      .value;

  late final _$dotaCountAtom =
      Atom(name: '_HomeStore.dotaCount', context: context);

  @override
  int get dotaCount {
    _$dotaCountAtom.reportRead();
    return super.dotaCount;
  }

  @override
  set dotaCount(int value) {
    _$dotaCountAtom.reportWrite(value, super.dotaCount, () {
      super.dotaCount = value;
    });
  }

  late final _$fortniteCountAtom =
      Atom(name: '_HomeStore.fortniteCount', context: context);

  @override
  int get fortniteCount {
    _$fortniteCountAtom.reportRead();
    return super.fortniteCount;
  }

  @override
  set fortniteCount(int value) {
    _$fortniteCountAtom.reportWrite(value, super.fortniteCount, () {
      super.fortniteCount = value;
    });
  }

  late final _$codCountAtom =
      Atom(name: '_HomeStore.codCount', context: context);

  @override
  int get codCount {
    _$codCountAtom.reportRead();
    return super.codCount;
  }

  @override
  set codCount(int value) {
    _$codCountAtom.reportWrite(value, super.codCount, () {
      super.codCount = value;
    });
  }

  late final _$totalAmountAtom =
      Atom(name: '_HomeStore.totalAmount', context: context);

  @override
  double get totalAmount {
    _$totalAmountAtom.reportRead();
    return super.totalAmount;
  }

  @override
  set totalAmount(double value) {
    _$totalAmountAtom.reportWrite(value, super.totalAmount, () {
      super.totalAmount = value;
    });
  }

  late final _$totalItemsAtom =
      Atom(name: '_HomeStore.totalItems', context: context);

  @override
  double get totalItems {
    _$totalItemsAtom.reportRead();
    return super.totalItems;
  }

  @override
  set totalItems(double value) {
    _$totalItemsAtom.reportWrite(value, super.totalItems, () {
      super.totalItems = value;
    });
  }

  late final _$isTestModeAtom =
      Atom(name: '_HomeStore.isTestMode', context: context);

  @override
  bool get isTestMode {
    _$isTestModeAtom.reportRead();
    return super.isTestMode;
  }

  @override
  set isTestMode(bool value) {
    _$isTestModeAtom.reportWrite(value, super.isTestMode, () {
      super.isTestMode = value;
    });
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void addItem(String item, int price) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.addItem');
    try {
      return super.addItem(item, price);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(String item, int price) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.removeItem');
    try {
      return super.removeItem(item, price);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.reset');
    try {
      return super.reset();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsTestMode(bool isTest) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setIsTestMode');
    try {
      return super.setIsTestMode(isTest);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dotaCount: ${dotaCount},
fortniteCount: ${fortniteCount},
codCount: ${codCount},
totalAmount: ${totalAmount},
totalItems: ${totalItems},
isTestMode: ${isTestMode},
totalCount: ${totalCount},
testModeOpacity: ${testModeOpacity}
    ''';
  }
}
