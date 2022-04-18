import 'package:flutter/material.dart';

class DropDownCurrencies extends StatefulWidget {
  const DropDownCurrencies({Key? key}) : super(key: key);

  @override
  State<DropDownCurrencies> createState() => _DropDownCurrenciesState();
}

class _DropDownCurrenciesState extends State<DropDownCurrencies> {
  List<String> currenxies = ["USD", "EUR"];
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: DropdownButton(
        value: _value,
        items: currenxies.map<DropdownMenuItem<String>>((String? item) => DropdownMenuItem<String>(child: Text(item!),value: item,)).toList(),
        onChanged: (String? value) {
          setState(() {
            _value = value;
          });
        },
        hint: const Text("from"),
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
      ),
    );
  }
}
