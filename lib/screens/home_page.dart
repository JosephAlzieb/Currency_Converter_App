import 'package:currency_converter_app/widgets/drop_down_currencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> currencies = ["USD", "EUR"];
  String? _from ;
  String? _to ;

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
            fontSize: 30,
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
                labelStyle: TextStyle(fontSize: 25),
                hintText: "enter the amount you want to convert here",
                hintStyle: TextStyle(fontSize: 25),
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropDownCurrencies(
                  currencies: currencies,
                  value: _from,
                  hintText: "From",
                  onChanged: (from) {
                    setState(() {
                      _from = from;
                    });
                  },
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    String? tmp = _from;
                    setState(() {
                      _from=_to;
                      _to=tmp;
                    });
                  },
                  child: const Icon(
                    Icons.swap_horiz_outlined,
                    color: Colors.black,
                  ),
                ),
                DropDownCurrencies(
                  currencies: currencies,
                  value: _to,
                  hintText: "To",
                  onChanged: (to) {
                    setState(() {
                      _to = to;
                    });
                  },
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.white,
              child: const Text(
                "Result",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
