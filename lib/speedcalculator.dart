import 'package:flutter/material.dart';
import 'mytextfield.dart';
class SpeedCalculator extends StatefulWidget {
  const SpeedCalculator({super.key});

  @override
  State<SpeedCalculator> createState() => _SpeedCalculatorState();
}

class _SpeedCalculatorState extends State<SpeedCalculator> {
  int distance=0;
  int time=0;
  double speed=0;
  String outinms='';
  String kmh='';
  String mileh='';
  bool k=false;
  bool m =false;
  void updateM(bool s){
    setState(() {
      m=s;
      if(m==false){
        mileh='';
      }
    });
  }
  void updateK(bool s){
    setState(() {
      k=s;
      if(k==false){
        kmh='';
      }
    });
  }
  void updateDistance(String s){
    setState(() {
      distance=int.parse(s);
    });
  }
  void updateTime(String s){
    setState(() {
      time=int.parse(s);
    });
  }

  void calculateSpeed(){
    setState(() {
      speed=distance/time;
      outinms='The Speed in m/s is $speed';
    });
  }
  void updateKhm(String s){
    setState(() {
      kmh=s;
    });
  }
  void updateMile(String s){
    setState(() {
      mileh=s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speed Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text('Enter the distance in meter',style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20,),
            SizedBox(height: 60,width: 300,
              child: InTextField(f: updateDistance),
            ),
            const SizedBox(height: 20,),
            const Text('Enter the Time in S',style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20,),
            SizedBox(height: 60,width: 300,
              child: InTextField(f: updateTime),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: calculateSpeed, child: Text('Calculate')),
            const SizedBox(height: 20,),
            const Text('Select the units you want to get the speed with',style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20,),
            Box(speed: speed,kmh: kmh,mileh: mileh,k: k,m: m,updateKhm:updateKhm,updateMile:updateMile,updateK:updateK,updatem:updateM),
            const SizedBox(height: 20,),
            Text(outinms,style: TextStyle(fontSize: 15)),
            const SizedBox(height: 20,),
            Text(kmh,style: TextStyle(fontSize: 15)),
            const SizedBox(height: 20,),
            Text(mileh,style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  double speed;
  String kmh;
  String mileh;
  bool k;
  bool m;
  final Function(String a)updateKhm;
  final Function(String a)updateMile;
  final Function(bool)updateK;
  final Function(bool)updatem;
  Box({super.key,required this.speed,required this.kmh,required this.mileh,required this.k,required this.m,required this.updateKhm,required this.updateMile,required this.updateK,required this.updatem});
  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('km/h',style: TextStyle(fontSize: 18)),
        Checkbox(value: widget.k,
            onChanged: (bool? val){
              setState(() {
                double x=this.widget.speed*3.6;
                String s='Speed in KM/H is $x';
                widget.updateKhm(s);
                widget.updateK(val as bool);
              });
            }),
        const Text('mile/h',style: TextStyle(fontSize: 18),),
        Checkbox(value: widget.m,
            onChanged: (bool? val){
              setState(() {
                double x=this.widget.speed*2.23694;
                String s='Speed in mile/h is $x';
                widget.updateMile(s);
                widget.updatem(val as bool);
              });
            })
      ],
    );
  }
}
