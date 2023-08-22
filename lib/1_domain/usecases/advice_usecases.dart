import 'package:advisor/0_data/repositories/advice_repo_implementations.dart';
import 'package:advisor/1_domain/enttities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final adviceRepo = AdviceRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();
  }
}
