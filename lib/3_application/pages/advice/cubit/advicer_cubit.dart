import 'package:advisor/1_domain/enttities/advice_entity.dart';
import 'package:advisor/1_domain/usecases/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubtState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUseCases adviceuseCases = AdviceUseCases();

  void adviceRequestedEvent() async {
    emit(AdviceStateLoading());
    debugPrint('fake get advice triggered');
    final AdviceEntity advice = await adviceuseCases.getAdvice();

    emit(AdviceStateLoaded(advice: advice.advice));
    //emit(const AdviceStateError(message: 'oops something went wrong'));
  }
}
