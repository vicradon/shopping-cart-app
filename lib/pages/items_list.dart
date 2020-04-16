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
    return StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data["shop items"].length > 0 ? ListView.builder(
          itemCount: snapshot.data["shop items"].length,
          itemBuilder: (BuildContext context, i) {
            final shopList = snapshot.data["shop items"];
            return ListTile(
              title: Text(shopList[i]['name']),
              subtitle: Text("\$${shopList[i]['price']}"),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  bloc.addToCart(shopList[i]);
                },
              ),
              onTap: () {
              },
            );
          },
        ): Center(child:Text("All items in shop have been taken"));
      },
    );
  }
}
