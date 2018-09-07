import 'package:flutter/material.dart';
class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => new RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('新用户注册'),
      ),
    );
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}