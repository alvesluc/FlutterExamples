// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<int> _$totalCheckedComputed;

  @override
  int get totalChecked =>
      (_$totalCheckedComputed ??= Computed<int>(() => super.totalChecked))
          .value;

  final _$listItemsAtom = Atom(name: '_HomeControllerBase.listItems');

  @override
  ObservableList<ItemModel> get listItems {
    _$listItemsAtom.context.enforceReadPolicy(_$listItemsAtom);
    _$listItemsAtom.reportObserved();
    return super.listItems;
  }

  @override
  set listItems(ObservableList<ItemModel> value) {
    _$listItemsAtom.context.conditionallyRunInAction(() {
      super.listItems = value;
      _$listItemsAtom.reportChanged();
    }, _$listItemsAtom, name: '${_$listItemsAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic addItem(ItemModel model) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.addItem(model);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(ItemModel model) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.removeItem(model);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'listItems: ${listItems.toString()},totalChecked: ${totalChecked.toString()}';
    return '{$string}';
  }
}
