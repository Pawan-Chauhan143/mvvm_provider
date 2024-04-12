import 'package:mvvmprojectss/data/newtwork/base_api_services.dart';
import 'package:mvvmprojectss/data/newtwork/network_api_services.dart';
import 'package:mvvmprojectss/utils/app_url.dart';

class AuthRepository{

  BaseApiService _baseApiService=NetworkApiService();

  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response=await _baseApiService.getPostApiResponse(AppUrl.loginApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async{
    try{
      dynamic response=await _baseApiService.getPostApiResponse(AppUrl.signUpApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}