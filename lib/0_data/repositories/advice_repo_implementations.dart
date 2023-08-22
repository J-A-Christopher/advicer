import 'package:advisor/0_data/datasources/advice_remote_datasource.dart';
import 'package:advisor/1_domain/enttities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:advisor/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  final RemoteAdviceDataSource adviceRemoteDataSource =
      RemoteAdviceDataSourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    final result = await adviceRemoteDataSource.getRandomAdviceFromApi();
    return right(result);
  }
}
