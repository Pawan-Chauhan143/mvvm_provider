import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.green,
      fontSize: 30,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void flushBarErrorMessage(String message,BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.all(15),
          message: message,
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeInExpo,
          //flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          icon: const Icon(Icons.error,size: 28,color: Colors.white,),
          duration: const Duration(seconds: 3),
        )..show(context));
  }


  static snackBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
          content: Text(message))
    );
  }


  static void fieldFocusChange(BuildContext context,FocusNode currentFocusNode,FocusNode nextFocusNode){
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }
}
