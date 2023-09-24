import 'package:advisor/1_domain/enttities/advice_entity.dart';
import 'package:advisor/1_domain/failures/failures.dart';
import 'package:advisor/1_domain/usecases/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_state.dart';

const generalFailureMessage = 'Something gone wrong! . Try again';
const serverFailureMessage = 'Oops API Error. Try again Later';

const cacheFailureMessage = 'Something went wrong.Cache failed. Try again';

class AdvicerCubit extends Cubit<AdvicerCubtState> {
  AdvicerCubit({required this.adviceuseCases}) : super(AdvicerInitial());
  final AdviceUseCases adviceuseCases;

  void adviceRequestedEvent() async {
    emit(AdviceStateLoading());
    debugPrint('fake get advice triggered');
    final failureOrAdvice = await adviceuseCases.getAdvice();
    failureOrAdvice.fold(
        (failure) =>
            emit(AdviceStateError(message: _mapFailureToMessage(failure))),
        (advice) => emit(AdviceStateLoaded(advice: advice.advice)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
