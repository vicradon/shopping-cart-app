import 'dart:async';

import 'package:coursefidence/bloc/base.dart';
import 'package:coursefidence/bloc/cart_items_provider.dart';

class CartItemsBloc implements Bloc {
  final streamCartController = StreamController(); // create a StreamController
  final CartItemsProvider provider = CartItemsProvider(); // create an instance of our CounterProvider

  Stream get getCount => streamCartController.stream; // create a getter for our stream

  void updateCart(item) {
    provider.addToCart(item); // call the method to increase our count in the provider
    streamCartController.sink.add(provider.shopItems); // add the count to our sink
  }

  void dispose() {
    streamCartController.close(); // close our StreamController
  }
}
