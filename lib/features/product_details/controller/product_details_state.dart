abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class CheckBoxOneState extends ProductDetailsState {}

class CheckBoxTwoState extends ProductDetailsState {}

class CheckBoxThreeState extends ProductDetailsState {}

class ProductMoreThanBuyState extends ProductDetailsState {}

class ChangeRadioButtonState extends ProductDetailsState {}

class ToggleCheckBoxState extends ProductDetailsState {}

class ProductsBrandsForProductCategoryLoadingState
    extends ProductDetailsState {}

class ProductsBrandsSuccessForProductCategoryState
    extends ProductDetailsState {}

class ProductsBrandsForProductCategoryErrorState extends ProductDetailsState {
  final String error;

  ProductsBrandsForProductCategoryErrorState({required this.error});
}

class FilterProductLoadingState extends ProductDetailsState {}

class FilterProductSuccessState extends ProductDetailsState {}

class FilterProductErrorState extends ProductDetailsState {
  final String error;

  FilterProductErrorState({required this.error});
}
