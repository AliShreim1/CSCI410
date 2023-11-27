import 'package:flutter/material.dart';

class InTextField extends StatelessWidget {
  final Function(String s) f;

  const InTextField({super.key,required this.f(String s)});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 18.0,),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),hintText: 'Enter a number',
      ),
      keyboardType: TextInputType.number,
      onChanged: (String text){
        f(text);
      },
    );
  }
}