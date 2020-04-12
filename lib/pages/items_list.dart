import 'package:shopping_cart_app/bloc/cart_items_bloc.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/checkout'),
          )
        ],
      ),
      body: ItemsListWidget(),
    );
  }
}

class ItemsListWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = CartItemsBloc();
    return StreamBuilder(
      stream: bloc.getStream,
      initialData: bloc.allItems,
      builder: (context, snapshot) {
        return ListView(
          children: <Widget>[
            ListTile(
              title: Text("App dev kit"),
              subtitle: Text("\$20"),
              trailing: Icon(Icons.add_shopping_cart),
              onTap: () {
                print(snapshot.data);
              },
            )
          ],
        );
      },
    );
  }
}
