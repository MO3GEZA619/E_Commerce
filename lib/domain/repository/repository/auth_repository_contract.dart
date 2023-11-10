import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/domain/entity/auth_result_entity.dart';
import 'package:ecommerceapp/domain/failures.dart';

abstract class AuthRepositoryContract {
  Future<Either<Faliures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone);

  Future<Either<Faliures, AuthResultEntity>> login(
      String email, String password);
}
