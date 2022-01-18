import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';


// class firstscreen extends StatefulWidget {
//   const firstscreen({ Key? key }) : super(key: key);

//   @override
//   _firstscreenState createState() => _firstscreenState();
// }

// class _firstscreenState extends State<firstscreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//         Row(
//           children: [
//           MaterialButton(
//           onPressed: (){
//             Navigator.pop(context);
//           },
//           child: Text("home page",)
//           )
//           ],
//         ),

//       ],),
      
//     );
//   }
// }
void main(){
runApp(MyApp());
}
 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'APP',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({ Key? key }) : super(key: key);

  @override
 _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Widget portrait(){
    return Center(
      child: Text("portrait"),
    );
  }
  Widget landscape(){
    return Center(
      child: Text("landscape"),
    );
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation==Orientation.portrait) {
            return portrait();
          } else {
            return landscape();
          }
            
          
        },
      ),
        
      );
  }  
}