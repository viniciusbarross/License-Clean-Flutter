import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:license/modules/login/external/api_license/base_api.dart';
import 'package:license/modules/login/infra/datasources/auth_datasource_jwt.dart';

class AuthJwt implements AuthDataSourceJwt {
  @override
  Future<String> login(String user, String password) async {
    var dio = Dio();
    final response = await dio.post(base_apilogin,
        data: {"UserName": "$user", "Password": "$password"});

    return response.data;
  }
}
