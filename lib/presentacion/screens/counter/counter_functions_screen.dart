import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {

  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int clickCounter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text('Contador de Clicks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: (){
              setState(() {
                clickCounter=0;
              });

            })
        ],
        //leading: IconButton(
          //icon: const Icon(Icons.refresh_rounded),
          //onPressed: (){

          //},
        
        //),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', style: const TextStyle(fontSize:160, fontWeight: FontWeight.w100)),
              if (clickCounter ==1)
                const Text('Click', style: TextStyle(fontSize:25))
              else
                const Text('Clicks', style: TextStyle(fontSize:25))             
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
          
            CustomButton(
              icon: Icons.plus_one,
              color: Colors.blueAccent,
              onPressed: (){
                setState(() {
                  clickCounter +=1;
                });
              },), 
          

            const SizedBox(width: 90),

            CustomButton(
              icon: Icons.refresh_rounded,
              color: Colors.red,
              onPressed: (){
                setState((){
                  clickCounter=0;
                });
              },), 

            const SizedBox(width: 90),

            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              color: Colors.blueAccent,
              onPressed: (){
                setState(() {
                  if (clickCounter==0) return;
                  clickCounter -=1;
                });
            },),        
          ]
        )  
      );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;

  const CustomButton({
    super.key, 
    required this.icon,
    this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const StadiumBorder(), // hace el boton circular
        onPressed: onPressed,
        backgroundColor: color,
        child: Icon(icon) );
        
  }
}