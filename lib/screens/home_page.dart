import 'package:currency_converter_app/widgets/drop_down_currencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212936),
      appBar: AppBar(
        backgroundColor: const Color(0xFF212936),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                // icon: Icon(
                //   Icons.money,
                //   color: Colors.white,
                // ),
                labelText: "Amount",
                hintText: "enter the amount you want to convert here",
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropDownCurrencies(),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                  child: Icon(Icons.swap_horiz_outlined, color: Colors.black,),
                ),
                DropDownCurrencies(),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.white,
              child: Text("Result", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}
