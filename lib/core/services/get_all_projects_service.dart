import 'dart:developer';

import 'package:abf_ather/core/api/api_constants.dart';
import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/features/projects/model/projects_response_model.dart';
import 'package:abf_ather/helper/dio_helper.dart';

class GetAllProjectsService {
  static Future<ProjectsResponseModel> getProjects() async {
    log("allProjects request path: ${ApiConstants.allProjects}");
    var response = await DioHelper.getData(
      path: ApiConstants.allProjects,
    );
    log('Token In allProjects: ${userModel?.data?.token}');
    log("Response: ${response?.data}");

    if (response!.statusCode == 200) {
      return ProjectsResponseModel.fromJson(response.data);
    }
    throw Exception(response.data['message'].toString());
  }
}
