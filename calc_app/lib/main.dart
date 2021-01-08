import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  home:Calc() ,
  theme: ThemeData(
    primaryColor: Colors.deepPurpleAccent,
    primarySwatch: Colors.teal,
  ),
  debugShowCheckedModeBanner: false,
));

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String output="0";
  String _output="0";
  double num1=0;
  double num2=0;
  String operand="";
  buttonPressed(String buttonText){
    print(buttonText);
    if(buttonText=="CLEAR"){
      String _output="0";
      double num1=0;
      double num2=0;
      String operand="";
    }
    else if(buttonText=="/"||buttonText=="-"||buttonText=="x"||buttonText=="+"){
      num1=double.parse(output);
      operand=buttonText;
      _output="0";
    }
    else if(buttonText=="."){
      if(_output.contains(".")){
        print("Invalid");
      }
      else{
        _output+=buttonText;
      }
    }
    else if(buttonText=="="){
      num2=double.parse(output);

      if(operand=="+"){
        _output=(num1+num2).toString();
      }
      if(operand=="-"){
        _output=(num1-num2).toString();
      }
      if(operand=="/"){
        _output=(num1/num2).toString();
      }
      if(operand=="x"){
        _output=(num1*num2).toString();
      }

      num1=0;
      num2=0;
      operand="";
    }
    else{
     _output+=buttonText;
    }
    setState(() {
      output=double.parse(_output).toStringAsFixed(3);
    });
  }

  Widget _buildButton(String display){
    return new Expanded(
      child: new MaterialButton(
        padding: EdgeInsets.all(20),
        child: Text("$display",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),
        onPressed:()=>buttonPressed(display),
        color: Colors.deepPurpleAccent,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Calculator",
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: new EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: new Text(
                output,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            new Expanded(
              child: Divider(
                height: 10,
              ),
            ),
            new Column(
              children:<Widget>[
                new Row(
                  children:<Widget>[
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/")
                  ],
                ),

                new Row(
                  children:<Widget>[
                    _buildButton("6"),
                    _buildButton("5"),
                    _buildButton("4"),
                    _buildButton("x"),
                  ],
                ),

                new Row(
                  children:<Widget>[
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-"),
                  ],
                ),

                new Row(
                  children:<Widget>[
                    _buildButton("."),
                    _buildButton("0"),
                    _buildButton("tp"),
                    _buildButton("+")
                  ],
                ),
                new Row(
                  children:<Widget>[
                    _buildButton("CLEAR"),
                    _buildButton("=")
                  ],
                ),



              ],
            ),
          ],
        ),
      ),
    );
  }
}
