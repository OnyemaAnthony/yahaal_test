import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
 class Utilities{
   static void push(BuildContext context,Widget screen){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen));
  }

   static void pushReplacement(BuildContext context,Widget screen){
     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen));
   }


   static void pop(BuildContext context){
     Navigator.of(context).pop();
   }
  static showToast(String msg){
    Fluttertoast.showToast(
        msg:msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }
 static Widget showLoader(){
     return const Center(child: CircularProgressIndicator(),);
  }

  static Widget showError(String message){
     return Center(child: Text(message),);
  }
}
