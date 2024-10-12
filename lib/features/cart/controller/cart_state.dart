abstract class CardState {}

class CardInitialState extends CardState {}

class CardLoadingState extends CardState {}

class CardSuccessState extends CardState {}

class CardErrorState extends CardState {
  final String error;
  CardErrorState({required this.error});
}
