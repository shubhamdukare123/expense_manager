
import 'package:expensemanager/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class AboutUs extends StatefulWidget{
  const AboutUs({super.key});

  @override
  State<StatefulWidget> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  @override
  Widget build (BuildContext context){
    return  Scaffold(
      drawer: MYDrawer(context),
      body:  Center( 
        child: Column(
            children: [
          Text(""),
          const SizedBox(
            height: 20,
          ),
           GifView.network(
          'https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExbG0yOXVmNTAzMGxheWo2NXNrZ21lZzFyZnhubDA5OXYxMHN3emRsZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/fwbZnTftCXVocKzfxR/giphy.gif',
          height: 200,
          width: 200,
                ),
            ]
        )
        // child: Text("We are Comming Soon..!\nHold your Breath",
        // style: TextStyle( 
        //   fontSize: 20,
        //   fontWeight: FontWeight.w600
        // ),
        // ),
      ),
      
    );
  }
}