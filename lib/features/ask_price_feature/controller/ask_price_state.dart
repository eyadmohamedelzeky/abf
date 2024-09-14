abstract class AskPriceState {}

class AskPriceInitial extends AskPriceState {}

class AskPriceLoading extends AskPriceState {}

class AskPriceSuccess extends AskPriceState {}

class AskPriceError extends AskPriceState {
  final String error;

  AskPriceError({required this.error});
}

class AskPriceDropDownChange extends AskPriceState {}

class AskPriceRequestLoading extends AskPriceState {}

class AskPriceRequestSuccess extends AskPriceState {}

class AskPriceRequestError extends AskPriceState {
  final String error;
  AskPriceRequestError({required this.error});
}
