import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mytextfield.dart';
import 'dart:math';
String IntToBinary(int num){
  List<int> s=[];
  int quotient=num;
  String res='';
  while(quotient !=0){
    int rem=quotient%2;
    quotient=(quotient/2).toInt();
    s.add(rem);
  }
  for(int i=s.length-1;i>=0;i--){
    res+=s[i].toString();
  }
  return res;
}



class Binary extends StatefulWidget {
  const Binary({super.key});

  @override
  State<Binary> createState() => _BinaryState();
}

class _BinaryState extends State<Binary> {
  int  number=0;
  void getNumber(String s){
    setState(() {
      if(s.trim()==''){
        number=0;
      }else{
        number=int.parse(s);
      }
    });
  }
  String out='';
  void setOutPut(){
    setState(() {
      out='The number in Binary ${IntToBinary(number)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text('Enter in filed the number you need to change',style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20,),
            SizedBox(width: 300,height: 60,
              child: InTextField(f:getNumber),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed:setOutPut,
                child: Text('Calculate')
            ),
            const SizedBox(height: 40,),
            Text(out,style: TextStyle(fontSize: 18)),
            SizedBox(height: 25,),
            Image.asset('assets/b.jpg')
            
          ],
        ),
      ),
    );
  }
}
