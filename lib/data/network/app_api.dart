import 'package:flutter_mvvm_tech/app/constant.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../responses/response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl:Constant.baseUrl)
abstract class AppServiceClient{
   factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

   @POST("/customer/login")
   Future<AuthenticationResponse> login();
}