part of 'advicer_cubit.dart';

abstract class AdvicerCubtState extends Equatable {
  const AdvicerCubtState();

  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerCubtState {}

class AdviceStateLoading extends AdvicerCubtState {}

class AdviceStateLoaded extends AdvicerCubtState {
  final String advice;
  const AdviceStateLoaded({required this.advice});
  @override
  List<Object?> get props => [advice];
}

class AdviceStateError extends AdvicerCubtState {
  final String message;
  const AdviceStateError({required this.message});
  @override
  List<Object?> get props => [message];
}
