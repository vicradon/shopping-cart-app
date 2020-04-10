class CartItemsProvider {
  List<Map> shopItems = [];
  List<Map> cartItems = [];

  void addToCart(item) {
    shopItems.remove(item);
    cartItems.add(item);
  }

  void removeFromCart(item) {
    cartItems.remove(item);
    shopItems.add(item);
  }
}
