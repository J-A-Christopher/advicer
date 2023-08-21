import 'package:advisor/1_domain/enttities/advice_entity.dart';

abstract class AdviceRepo {
  Future<AdviceEntity> getAdviceFromDataSource();
}
