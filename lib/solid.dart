import 'package:flutter/material.dart';
import 'dart:math';
import 'mytextfield.dart';
List<String> inunit=['microgram','milligram','g','kg','T'];
class Solid extends StatefulWidget {
  Solid({super.key});
  @override
  State<Solid> createState() => _SolidState();
}

class _SolidState extends State<Solid> {
  int from=0;
  int to=0;
  double num=0;
  double output=0 ;
  String text='';
  void setFrom(String s){
    setState(() {
      int num=inunit.indexOf(s);
      from=num;
    });
  }
  void setTo(String s){
    setState(() {
      int num=inunit.indexOf(s);
      to=num;
    });
  }
  void updateNum(String s){
    setState(() {
      if(s.trim()==''){
        num=-1;
      }else {
        num = double.parse(s);
      }
    });
  }

  void setOutput(){
    setState(() {
      int r=from-to;
      output=num*pow(10,3*r);
      text='the number after changing is $output';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solids'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text('select the unit of mass that you will enter ',style: TextStyle(fontSize: 18),),
            const SizedBox(height: 20,),
            UnitDropMenu(set: setFrom),
            const SizedBox(height: 20,),
            const Text('select the unit to you want to chage to: ',style: TextStyle(fontSize: 18),),
            const SizedBox(height: 20,),
            UnitDropMenu(set: setTo),
            const SizedBox(height: 20,),
            SizedBox(width: 300,height: 60,
                child:InTextField(f: updateNum),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: setOutput, child: Text('Calculate',style: TextStyle(fontSize: 15),)),
            const SizedBox(height: 20,),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class UnitDropMenu extends StatelessWidget {
  final Function(String) set;
  const UnitDropMenu({super.key,required this.set});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(dropdownMenuEntries:inunit.map<DropdownMenuEntry<String>>((String s){
      return DropdownMenuEntry(value: s,label:s.toString());
    }
    ).toList(),
      initialSelection: inunit.first,
      width: 100,
      onSelected:(String? s){
        set(s as String);
      } ,
    );
  }
}



