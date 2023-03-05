import 'package:flutter/material.dart';
import 'package:flutter_mvvm_tech/app/app.dart';
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  void updateState(){
     MyApp.instance.appState = 10;
  }

  void getUpdateState(){
    print(MyApp.instance.appState);
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
