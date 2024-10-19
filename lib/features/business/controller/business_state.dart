abstract class BusinessState {}

class BusinessInitial extends BusinessState {}

class BusinessLoadingState extends BusinessState {}

class BusinessSuccessState extends BusinessState {}

class BusinessErrorState extends BusinessState {  
  final String error;

  BusinessErrorState({required this.error});
}