import 'package:mobx/mobx.dart';
import 'package:mobxexample3/app/models/item_model.dart';
import 'package:rxdart/rxdart.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  //The commented section can be added by overwriting the code below.

  final listItems = BehaviorSubject<List<ItemModel>>.seeded([
    ItemModel(title: "Item 1", check: true),
    ItemModel(title: "Item 2", check: false),
    ItemModel(title: "Item 3", check: false),
  ]);
  final filter = BehaviorSubject<String>.seeded("");

  ObservableStream<List<ItemModel>> output;

  _HomeControllerBase() {
    output = Rx.combineLatest2<List<ItemModel>, String, List<ItemModel>>(
        listItems.stream, filter.stream, (list, filter) {
      if (filter.isEmpty) {
        return list;
      } else {
        return list
            .where((item) =>
                item.title.toLowerCase().contains(filter.toLowerCase()))
            .toList();
      }
    }).asObservable(initalValue: []);
  }

  @computed
  int get totalChecked =>
      output.value.where((item) => item.check == true).length;

  setFilter(String value) => filter.add(value);

  @action
  addItem(ItemModel model) {
    // var list = listItems.value;
    // list.add(model);
    // listItems.add(listItems.value);
    // The above do the same thing as the code below.
    listItems.add(List<ItemModel>.from(listItems.value..add(model)));
  }

  @action
  removeItem(ItemModel model) {
    var list = List<ItemModel>.from(listItems.value);
    list.removeWhere((item) => item.title == model.title);
    listItems.add(list);
  }
}

//  @observable
//   ObservableList<ItemModel> listItems = [
//     ItemModel(title: "Item 1", check: true),
//     ItemModel(title: "Item 2", check: false),
//     ItemModel(title: "Item 3", check: false),
//   ].asObservable();

//   @computed
//   int get totalChecked => listItems.where((item) => item.check == true).length;

//   @computed
//   List<ItemModel> get listFiltered {
//     if(filter.isEmpty) {
//       return listItems;
//     } else {
//       return listItems.where((item) => item.title.toLowerCase().contains(filter.toLowerCase())).toList();
//     }
//   }

//   @observable
//   String filter = "";

//   @action
//   setFilter(String value) => filter = value;

//   @action
//   addItem(ItemModel model) {
//     listItems.add(model);
//   }

//   @action
//   removeItem(ItemModel model) {
//     listItems.removeWhere((item) => item.title == model.title);
//   }
