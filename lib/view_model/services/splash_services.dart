import 'package:flutter/cupertino.dart';
import 'package:mvvmprojectss/utils/routes/routes_name.dart';
import 'package:mvvmprojectss/view_model/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices{
  Future<UserModel> getUserData()=>UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async{
    getUserData().then((value)async{
      if(value.token=='null'||value.token==''){
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }else{
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }

    }).onError((error, stackTrace) {

      print(error.toString());
    });
  }



}