import 'package:flutter/material.dart';

void main() {
  runApp(MyCalclouter());
}
class MyCalclouter extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home:MyApp(),
    );
  }
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyClac();
}

class _MyClac extends State<MyApp> {
  String text='0';
  double num1=0;
  double num2=0;
  String result='0';
  String finalResult='0';
  String op='';
  String preOp='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f8ff),
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(text,style: TextStyle(color:Color(0xff49108b),fontSize: 60,),maxLines: 1,textAlign: TextAlign.right,),
                  ),
                  
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  button("C",Color(0xff49108b)),
                  button("+/-",Color(0xff49108b)),
                  button("%",Color(0xff49108b)),
                  button("/",Color(0xffe26ee5)),
              ],
              ),
            Container(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  button("7",Color(0xff49108b)),
                  button("8",Color(0xff49108b)),
                  button("9",Color(0xff49108b)),
                  button("*",Color(0xffe26ee5)),
              ],
              ),
          Container(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  button("4",Color(0xff49108b)),
                  button("5",Color(0xff49108b)),
                  button("6",Color(0xff49108b)),
                  button("-",Color(0xffe26ee5)),
              ],
              ),
          Container(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  button("1",Color(0xff49108b)),
                  button("2",Color(0xff49108b)),
                  button("3",Color(0xff49108b)),
                  button("+",Color(0xffe26ee5)),
              ],
              ),
          Container(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  button("0",Color(0xff49108b),2),
                  button(".",Color(0xff49108b)),
                  button("=",Color(0xffe26ee5)),
              ],
              ),
          ],
        )
      ),
    );
  }
Widget button(String btntxt,Color color,[int ext=1])
  {
    Expanded container;
    if(ext==1)
    {
      container= Expanded(
      flex: ext,
      child: Container(
          padding: EdgeInsets.only(bottom: 0),
            child: MaterialButton(
            onPressed:(){
            doOp(btntxt);
            },
            child: Text(btntxt,style:TextStyle(fontSize: 30,color:Color(0xfff3f8ff))),
            color:color,
            padding: EdgeInsets.all(20),
            shape:CircleBorder(),
            ),
      ),
    );
    }
    else
    {
    container= Expanded(
      flex: ext,
      child: Container(
          padding: EdgeInsets.only(bottom: 0),
            child: MaterialButton(
            onPressed:(){
            doOp(btntxt);
            },
            child: Text(btntxt,style:TextStyle(fontSize: 30,color:Color(0xfff3f8ff))),
            color:color,
            padding: EdgeInsets.all(20),
            shape:StadiumBorder(),
            ),
      ),
    );
    }
    return container;
  }
  void doOp(String txtbtn)
  {
    if(txtbtn=='C'){
      text='0';
      num1=0;
      num2=0;
      result='';
      finalResult='0';
      op='';
      preOp='';
    }
    else if(op=='='&&txtbtn=='=')
    {
      switch (preOp) {
        case '+':
          finalResult=add();
          break;
        case '-':
          finalResult=min();
          break;
        case '*':
          finalResult=mul();
          break;
        case '/':
          finalResult=div();
          break;
      }
    }
    else if(txtbtn=='+'||txtbtn=='-'||txtbtn=='*'||txtbtn=='/'||txtbtn=='='){
      if(num1==0){
        num1=double.parse(result);
      }
      else{
        num2=double.parse(result);
      }
      switch (op) {
        case '+':
          finalResult=add();
          break;
        case '-':
          finalResult=min();
          break;
        case '*':
          finalResult=mul();
          break;
        case '/':
          finalResult=div();
          break;
      }
      preOp=op;
      op=txtbtn;
      result="0";
    }
    else if (txtbtn == "%") {
    double percentage = double.parse(result) / 100;
    result = percentage.toString();
    finalResult = result;
}
    else if (txtbtn=='.')
    {
      if(!result.contains('.'))
        result+=".";
      finalResult=result;
    }
    else if(txtbtn=="+/-")
    {
      result.startsWith('-')?result=result.substring(1):result="-"+result;
      finalResult=result;
    }
    else{
      if(result=='0')
        result=txtbtn;
      else
      result=result+txtbtn;
      finalResult=result;
    }
    setState(() {
      text=finalResult;
    });
  }
String add() {
  double resultValue = num1 + num2;
  result = resultValue.toString();
  num1 = resultValue;
  num2 = 0;
  return result;
}
  String min(){
    result=(num1-num2).toString();
    num1=double.parse(result);
    return result;
  }
  String mul(){
    result=(num1*num2).toString();
    num1=double.parse(result);
    return result;
  }
  String div(){
    if(num2==0)
      result='0';
    else
    {
      result=(num1/num2).toString();
      num1=double.parse(result);
    }
    return result;
  }
}