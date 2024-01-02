abstract class HomeStates {}

class InitialHomeState extends HomeStates {}

class GetDepartmentsLoadingState extends HomeStates {}

class GetDepartmentsSuccsessState extends HomeStates {}

class GetDepartmentsErrorState extends HomeStates {}

class GetCategoriesOfDepartmentsLoadingState extends HomeStates {}

class IsLoadingMoreState extends HomeStates {}

class GetCategoriesOfDepartmentsSuccsessState extends HomeStates {}

class GetCategoriesOfDepartmentsErrorState extends HomeStates {}

class GetSpecificCategoryLoadingState extends HomeStates {}

class GetSpecificCategorySuccsessState extends HomeStates {}

class GetSpecificCategoryErrorState extends HomeStates {}

class GetMostViewsLoadingState extends HomeStates {}

class GetMostviewSuccsessState extends HomeStates {}

class GetMostViewErrorState extends HomeStates {}

class GetAllCategoryLoadingState extends HomeStates {}

class GetAllCategorySuccsessState extends HomeStates {}

class GetAllCategoryErrorState extends HomeStates {}

class GetBestSellingLoadingState extends HomeStates {}

class GetBestSellingSuccsessState extends HomeStates {}

class GetBestSellingErrorState extends HomeStates {}

class GetSpecificProductLoadingState extends HomeStates {}

class GetSpecificProductSuccsessState extends HomeStates {}

class GetSpecificProductErrorState extends HomeStates {}

class GetAllProductLoadingState extends HomeStates {}

class GetAllProductSuccsessState extends HomeStates {}

class GetAllProductErrorState extends HomeStates {}

class FilterProductLoadingState extends HomeStates {}

class FilterProductSuccessState extends HomeStates {}

class FilterProductErrorState extends HomeStates {}

class GetCategoriesOfDepartmentsLoadingPaginationState extends HomeStates {}

class GetCategoriesOfDepartmentsSuccessState extends HomeStates {}

class GetCategoriesOfDepartmentsLoadMoreSuccessState extends HomeStates {}

class GetCategoriesOfDepartmentsPaginationFailedState extends HomeStates {
  final String msg;

  GetCategoriesOfDepartmentsPaginationFailedState(this.msg);
}
