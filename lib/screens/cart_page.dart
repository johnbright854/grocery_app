import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: TextStyle(color:Colors.white,
            fontSize: 25, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: Consumer<CartModel>(builder: (context, value, child){
        if(value.cartItems.length == 0){
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/images/empty_cart.png',height: 200,),
                  Text('Your cart is empty!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ],
              ),

          );
        }


    return Column(
    children: [
      SizedBox(height: 20,),
    Expanded(child: ListView.builder(
      itemCount: value.cartItems.length,
      itemBuilder: (context, index){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: ListTile(
          leading: Image.asset(value.cartItems[index][2], height: 48,),
        title: Text(value.cartItems[index][0]),
          subtitle: Text('\$'+value.cartItems[index][1]),
          trailing: IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              Provider.of<CartModel>(context, listen: false).removeItemFromCart(index);
            },
          ),
        ),
      ),
    );
    },),
    ),
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8)
        ),
          padding: EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Total Price', style: TextStyle(color: Colors.white),),
                  Text(value.calculateTotalPrice(), style: TextStyle(color: Colors.white),)
                ],
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.white), borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(8),
                child: Text(
                  'Pay Now',
                  style: TextStyle(color: Colors.white),
                ),
              )

            ],
          ),
        ),
      )
    ],
    );

    }

    )
    );
  }
}
