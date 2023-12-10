import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Color(0xff313866),
        padding: EdgeInsets.only(right: 10,left: 5,top: 5),
        child: Column(
          children:[
            Container(
              height: 300,
              child: Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      child: Icon(Icons.person),
                    ),
                    Text("Login",style: TextStyle(fontSize: 20,color:Colors.white),)
                  ],
                ),
              ),
              ),
            Container(
              decoration: BoxDecoration(color: Color(0xfffe7be5),borderRadius: BorderRadius.only(topLeft: Radius.circular(70),topRight:Radius.circular(80) )),
              padding: EdgeInsets.symmetric(vertical: 50,horizontal: 20),
              alignment: Alignment.center,
              height: 335,
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: [
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Email",
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Password",
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(),
                        hintStyle: TextStyle(color:Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    IconButton(onPressed:() {}, icon: Icon(Icons.arrow_circle_right_outlined,size: 40,))
                ]),
              ),
          ],
        ),
      ),
    );
  }
}
