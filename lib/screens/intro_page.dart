import 'package:flutter/material.dart';
import 'package:grocery_app/screens/homepage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 30, right: 30, left: 30),
              child: Image.asset('lib/assets/images/grocery.png'),
            ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 50),
          child: Center(child: Text('We deliver groceries at your doorstep', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),textAlign: TextAlign.center,))
          ),
          const SizedBox(height: 50,),
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Homepage()));
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Text('Get Started', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
              ),
            )
          )
        ],
      ),
    );
  }
}
