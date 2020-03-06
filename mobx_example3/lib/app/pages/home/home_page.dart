import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxexample3/app/models/item_model.dart';

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
                      color: Colors.grey[300],
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    FlatButton(
                      color: Colors.yellow[400],
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
        backgroundColor: Colors.grey[800],
        title: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
          child: TextField(
            autofocus: false,
            style: TextStyle(color: Colors.black),
            onChanged: controller.setFilter,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search...',
            ),
          ),
        ),
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
          if(controller.output.data == null){
            return Center(
              child: CircularProgressIndicator(),
            );
          } 
          return ListView.builder(
              itemCount: controller.output.data.length,
              itemBuilder: (_, index) {
                var item = controller.output.data[index];
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
          color: Colors.grey[850],
        ),
        onPressed: () {
          _dialog();
        },
      ),
    );
  }
}
