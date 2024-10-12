import 'dart:developer';

import 'package:abf_ather/core/services/get_all_projects_service.dart';
import 'package:abf_ather/features/projects/controller/project_state.dart';
import 'package:abf_ather/features/projects/model/projects_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectController extends Cubit<ProjectState> {
  ProjectController() : super(ProjectInitial());
  static ProjectController get(context) => BlocProvider.of(context);
  ProjectsResponseModel? projectsResponseModel;

  Future<void> getAllProjects() async {
    emit(ProjectLoadingState());
    await GetAllProjectsService.getProjects().then((value) {
      projectsResponseModel = value;
      log('projectsResponseModel: ${projectsResponseModel!.toJson()}');
      emit(ProjectSuccessState());
    }).catchError((error) {
      emit(ProjectErrorState(error: error.toString()));
    });
  }
}
