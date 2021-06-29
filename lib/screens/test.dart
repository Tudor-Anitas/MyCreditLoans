import 'package:flutter/material.dart';

class Test extends StatefulWidget {

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          MaterialButton(onPressed: ()=> print('sotm'),minWidth: 100, height: 50,color: Colors.blue,),
          MaterialButton(onPressed: ()=> print('sotm'),minWidth: 100, height: 50,color: Colors.amber,),
        ],
      ),
    );
  }
}
