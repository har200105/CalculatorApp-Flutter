import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int firstnum;
  int secondnum;
  String output="";
  String result;
  String operation="";
  void calculate(String v){
    if(v=="C"){
      output="";
      firstnum=0;
      secondnum=0;
      result="";
      operation="";
    }else if(v == "+" || v == "-" || v == "x" || v == "/"){
      firstnum=int.parse(output);
      result="";
      operation=v;
    } 
    else if(v == "="){
      secondnum=int.parse(output);
      if(operation=="+"){
        result = (firstnum+secondnum).toString();
      }
      if(operation=="x"){
        result = (firstnum*secondnum).toString();
      }
      if(operation=="-"){
        result = (firstnum-secondnum).toString();
      }
      if(operation=="/"){
        result = (firstnum/secondnum).toString();
    }
      }else{
        result = int.parse(output+v).toString();
      }

      setState(() {
        output=result;
      });
      
  }

  Widget custombutton(value){
    return Expanded(
      child: OutlineButton(
      padding:EdgeInsets.all(20.0),
        onPressed: ()=>calculate(value),
        child: Text("$value",style: TextStyle(
          fontSize:20.0,
        ),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title:Text(
          "Calculator",
        ),
      ),
      body: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Expanded(
              child:Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$output",
                  style: TextStyle(
                    fontSize:25.0,
                    fontWeight:FontWeight.w700,
                  ),
                ),
              )
            ),
            Row(
              children:[
              custombutton("9"),
              custombutton("8"),
              custombutton("7"),
              custombutton("+")
              ]
            ),
            Row(
              children:[
              custombutton("6"),
              custombutton("5"),
              custombutton("4"),
              custombutton("-")
              ]
            ),
            Row(
              children:[
              custombutton("3"),
              custombutton("2"),
              custombutton("1"),
              custombutton("x")
              ]
            ),
            Row(
              children:[
              custombutton("C"),
              custombutton("0"),
              custombutton("="),
              custombutton("/")
              ]
            ),
          ]
        )
      ),
    );
  }
}
