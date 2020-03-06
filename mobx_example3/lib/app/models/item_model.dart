import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {

  //Construtor do ItemModel, com parâmetros opcionais.
  //ItemModel contructor, uses optional paremeters.
  _ItemModelBase({this.title, this.check = false});
  
  //Obeservables variables, used in Widgets for operations.
  @observable
  String title;
  @observable
  bool check;

  @action
  setTitle(String value) => title = value;
  @action
  setCheck(bool value) => check = value;

}