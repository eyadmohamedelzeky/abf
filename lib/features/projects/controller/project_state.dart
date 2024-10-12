abstract class ProjectState {}

class ProjectInitial extends ProjectState {}

class ProjectLoadingState extends ProjectState {}

class ProjectSuccessState extends ProjectState {}

class ProjectErrorState extends ProjectState {
  final String error;

  ProjectErrorState({required this.error});
}
