import 'package:flutter/material.dart';

class DropDownCurrencies extends StatelessWidget {
  List<String> currencies;
  String? hintText;
  String? value;
  Function onChanged;

  DropDownCurrencies(
      {required this.currencies, required this.value,required this.hintText, required this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Center(
        child: DropdownButton(
          style: const TextStyle(fontSize: 25, color: Colors.black),
          value: value,
          items: currencies.map<DropdownMenuItem<String>>((String? item) =>
              DropdownMenuItem<String>(child: Text(item!), value: item,))
              .toList(),
          onChanged: (String? value) {
            onChanged(value);
          },
          hint: Text(hintText! , style: const TextStyle(fontSize: 25),),
          icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        ),
      ),
    );
  }
}
