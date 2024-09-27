import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  //list of items on sale
  final List _shopItems = [
    ['Avacado','4.50','lib/assets/images/avacado.png',Colors.green],
    ['Banana','2.50','lib/assets/images/banana.png',Colors.yellow],
    ['Carrot','2.14','lib/assets/images/carrot.png',Colors.orange],
    ['Onion','1.67','lib/assets/images/onion.png',Colors.pink],
    ['Egg','0.42','lib/assets/images/egg.png',Colors.grey],
    ['Grapes','2.58','lib/assets/images/grapes.png',Colors.purple],
  ];

  final List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index){
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotalPrice(){
    double totalPrice = 0;
    for(int i=0; i<_cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}