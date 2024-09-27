import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartPage()

          ));
        },
        backgroundColor: Colors.black,
        label: Icon(Icons.shopping_bag, color: Colors.white,),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Lets order fresh items for you', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),),
            const SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider(),
            ),
            const SizedBox(height: 24,),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child){
                  return GridView.builder(
                      itemCount: value.shopItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1/1.2,
                      ),
                      itemBuilder: (context, index){
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: (){
                        Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                      },

                    );
                  });
                },
              ),
            )

          ],
        ),
      )
    );
  }
}
