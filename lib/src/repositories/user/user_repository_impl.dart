
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository{

  UserRepositoryImpl({required this.restClient});   

  final RestClient restClient;

  @override
  Future<Either<AuthExceptions, String>> login(String email, String password) async{
    try{
      final Response(data:{'access_token':access_token}) = 
      await restClient.unAuth.post('/auth',data: {'email':email,'password' : password,'admin':true});
      return Right(access_token);
    } on DioException catch(e,s){
      log('Erro ao realizar login',error: e, stackTrace:s);
      return switch(e){
        DioException(response: Response(statusCode:HttpStatus.forbidden)?)=>Left(AuthUnauthorizedExcpetion()),
        _ => Left(AuthError(message: 'Erro ao realizar login'))
      };
    }
  }

}