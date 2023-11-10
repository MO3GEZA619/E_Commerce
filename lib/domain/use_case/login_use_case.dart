import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/domain/failures.dart';
import 'package:ecommerceapp/domain/repository/repository/auth_repository_contract.dart';
import '../entity/auth_result_entity.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<Either<Faliures, AuthResultEntity>> invoke(
      String email, String password) {
    return repositoryContract.login(email, password);
  }
}
