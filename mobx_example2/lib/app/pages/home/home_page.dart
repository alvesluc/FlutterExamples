import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxexample2/app/models/item_model.dart';

import 'components/item_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _dialog() {
    var model = ItemModel();

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Add item'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  onChanged: model.setTitle,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Item',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      color: Colors.red[100],
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    FlatButton(
                      color: Colors.green[100],
                      onPressed: () {
                        controller.addItem(model);
                        Navigator.pop(context);
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter MobX Example'),
        actions: <Widget>[
          IconButton(
            icon: Observer(
              builder: (_) {
                return Text("${controller.totalChecked}");
              },
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return ListView.builder(
              itemCount: controller.listItems.length,
              itemBuilder: (_, index) {
                var item = controller.listItems[index];
                return ItemWidget(
                  item: item,
                  removeClicked: () {
                    controller.removeItem(item);
                  },
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[600],
        child: Icon(
          Icons.add,
          color: Colors.purple[600],
        ),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
