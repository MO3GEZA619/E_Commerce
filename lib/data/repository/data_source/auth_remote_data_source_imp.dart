import 'package:dartz/dartz.dart';
import 'package:ecommerceapp/data/model/api/api_manager.dart';
import 'package:ecommerceapp/domain/entity/auth_result_entity.dart';
import 'package:ecommerceapp/domain/failures.dart';
import '../../../domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImp({required this.apiManager});

  @override
  Future<Either<Faliures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(Faliures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }

  @override
  Future<Either<Faliures, AuthResultEntity>> login(
      String email, String password) async{
    var either =
        await apiManager.login(email, password);
    return either.fold((l) {
      return Left(Faliures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}
