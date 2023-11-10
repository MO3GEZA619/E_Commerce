import 'package:ecommerceapp/data/model/api/api_manager.dart';
import 'package:ecommerceapp/data/repository/data_source/auth_remote_data_source_imp.dart';
import 'package:ecommerceapp/data/repository/repository/auth_repository_imp.dart';
import 'package:ecommerceapp/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:ecommerceapp/domain/repository/repository/auth_repository_contract.dart';
import 'package:ecommerceapp/domain/use_case/login_use_case.dart';
import 'package:ecommerceapp/domain/use_case/register_use_case.dart';

RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase(){
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract  injectAuthRepositoryContract(){
  return AuthRepositoryImp(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImp(apiManager: ApiManager.getinstance());
}