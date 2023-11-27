import 'package:flutter/material.dart';
import 'solid.dart';
import'binary.dart';
import 'liq.dart';
import 'speedcalculator.dart';
List<String> name=['solids','Liquids','Binary','speed'];
List<Widget> pages=[Solid(),Liquids(),Binary(),SpeedCalculator()];
List<String> image=['assets/solids.jpg','assets/liquids.png','assets/bin.png','assets/speedImage.jpg'];
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Page',
      debugShowCheckedModeBanner: false,
      home: Main()
    );
  }
}
class Main extends StatelessWidget {
   Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        centerTitle: true,
      ),
      body: ShowType()
    );
  }
}
class ShowType extends StatelessWidget {
  const ShowType({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: name.length,
        itemBuilder: (context,index){
          return Column(
            children: [
              const SizedBox(height: 30,),
              Text(name[index],style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Image.asset(image[index],width: 300,height: 300,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>pages[index])
                );
              }, child: Text('Go'))
            ],
          );
        }
    );
  }
}
