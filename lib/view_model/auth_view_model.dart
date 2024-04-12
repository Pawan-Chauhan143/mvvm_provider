import 'package:flutter/cupertino.dart';
import 'package:mvvmprojectss/repository/auth_repository.dart';
import 'package:mvvmprojectss/utils/routes/routes_name.dart';
import 'package:mvvmprojectss/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool _signUpLoading=false;


  bool get loading => _loading;
  bool get signUpLoading=>_signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  setSignUpLoading(bool value){
    _signUpLoading=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }

  Future<void> signUpApi(dynamic data,BuildContext context) async{
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('Register Successfully', context);
    }).onError((error, stackTrace){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}