import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/features/projects/controller/project_controller.dart';
import 'package:abf_ather/features/projects/controller/project_state.dart';
import 'package:abf_ather/features/projects/model/projects_response_model.dart';
import 'package:abf_ather/features/projects/view/widgets/custom_card_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  void initState() {
    ProjectController.get(context).getAllProjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectController, ProjectState>(
      listener: (context, state) {},
      builder: (context, state) {
        final card = ProjectController.get(context);
        return Scaffold(
          body: SafeArea(
            child: state is ProjectLoadingState
                ? spinkit
                : ListView.builder(
                    itemCount: card.projectsResponseModel?.data?.length,
                    itemBuilder: (context, index) {
                      return CustomCardProject(
                        cardProductsResponse: card.projectsResponseModel != null
                            ? card.projectsResponseModel!
                            : ProjectsResponseModel(),
                        index: index,
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
