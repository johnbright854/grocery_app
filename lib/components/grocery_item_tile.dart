import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;


  GroceryItemTile({super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset(imagePath, height: 85,),
              Text(itemName),
              MaterialButton(onPressed: onPressed,

                color: color[600],
              child: Text('\$$itemPrice',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
