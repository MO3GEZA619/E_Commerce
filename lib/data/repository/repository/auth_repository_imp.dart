import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/domain/entity/auth_result_entity.dart';
import 'package:ecommerceapp/domain/failures.dart';
import 'package:ecommerceapp/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:ecommerceapp/domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImp implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Faliures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Faliures, AuthResultEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
