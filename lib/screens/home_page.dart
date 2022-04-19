import 'package:currency_converter_app/services/api_client.dart';
import 'package:currency_converter_app/widgets/drop_down_currencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiClient _apiClient = ApiClient();
  late List<String> currencies;
  String? _from ;
  String? _to ;
  String? result;
  late double rate;


  @override
  void initState() {
    (() async {
      List<String> list = await getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }

  Future<List<String>> getCurrencies() async{
    return _apiClient.getCurrencies();
  }

  TextStyle textStyle(int fontSize){
    return const TextStyle(fontSize: 25);
  }


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
              style: textStyle(25),
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
              onFieldSubmitted: (value) async{
                 rate = await _apiClient.getRate(_from!, _to!);
                setState(() {
                  result = (rate * double.parse(value)).toStringAsFixed(3);
                });
              },
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
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Result",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    result == null ?"":result.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
