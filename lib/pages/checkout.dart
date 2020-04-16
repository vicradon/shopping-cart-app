import 'package:flutter/material.dart';
import 'package:shopping_cart_app/bloc/cart_items_bloc.dart';

class Checkout extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context, snapshot) {
          print(snapshot);
          return StreamBuilder(
            stream: bloc.getStream,
            initialData: bloc.allItems,
            builder: (context, snapshot) {
              return snapshot.data['cart items'].length > 0
                  ? Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data["cart items"].length,
                            itemBuilder: (BuildContext context, i) {
                              final cartList = snapshot.data["cart items"];
                              return ListTile(
                                title: Text(cartList[i]['name']),
                                subtitle: Text("\$${cartList[i]['price']}"),
                                trailing: IconButton(
                                  icon: Icon(Icons.remove_shopping_cart),
                                  onPressed: () {
                                    bloc.removeFromCart(cartList[i]);
                                  },
                                ),
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Text("Checkout"),
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(height: 40)
                      ],
                    )
                  : Center(child: Text("You haven't taken any item yet"));
            },
          );
        },
      ),
    );
  }
}
