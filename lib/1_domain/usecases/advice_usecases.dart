import 'package:advisor/1_domain/enttities/advice_entity.dart';

class AdviceUseCases {
  Future<AdviceEntity> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {
      //debugPrint('got an advice');
    });
    return AdviceEntity(advice: 'advice to test', id: 1);
  }
}
