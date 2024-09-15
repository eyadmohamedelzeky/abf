abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState({required this.error});
}

class HomeSilderLoadingState extends HomeState {}

class HomeSilderSuccessState extends HomeState {}

class HomeSilderErrorState extends HomeState {
  final String error;

  HomeSilderErrorState({required this.error});
}

class ProductsBrandsLoadingState extends HomeState {}

class ProductsBrandsSuccessState extends HomeState {}

class ProductsBrandsErrorState extends HomeState {
  final String error;

  ProductsBrandsErrorState({required this.error});
}

class ProductDetailsLoadingState extends HomeState {}

class ProductDetailsSuccessState extends HomeState {}

class ProductDetailsErrorState extends HomeState {
  final String error;

  ProductDetailsErrorState({required this.error});
}

class ProductByCategoryLoadingState extends HomeState {}

class ProductByCategorySuccessState extends HomeState {}

class ProductByCategoryErrorState extends HomeState {
  final String error;

  ProductByCategoryErrorState({required this.error});
}

class HomeLoadedState extends HomeState {}

class GetAllSoicalLoadingState extends HomeState {}

class GetAllSoicalSuccessState extends HomeState {}

class GetAllSoicalErrorState extends HomeState {
  final String error;

  GetAllSoicalErrorState({required this.error});
}
