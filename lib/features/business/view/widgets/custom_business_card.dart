import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/features/business/model/business_respone_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBusinessCard extends StatelessWidget {
  const CustomBusinessCard({super.key, required this.businessResponseModel});
  final BusinessResponseModel businessResponseModel;

  @override
  Widget build(BuildContext context) {
    // Check if data is null
    final duct = businessResponseModel.data?.duct;
    final repair = businessResponseModel.data?.repair;

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.blueColor),
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.r)),
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (duct != null) ...[
              Text(
                "Duct Type: ${duct.type ?? ''}",
                style: TextStyle(fontSize: 16, color: AppColors.orangeColor),
              ),
              const SizedBox(height: 8),
              Text(
                "Duct Description: ${duct.description ?? ''}",
                style: TextStyle(fontSize: 16, color: AppColors.orangeColor),
              ),
            ],
            if (repair != null) ...[
              const SizedBox(height: 16), // Add spacing before repair section
              Text(
                "Repair Type: ${repair.type ?? ''}",
                style: TextStyle(fontSize: 16, color: AppColors.blueColor),
              ),
              const SizedBox(height: 8),
              Text(
                "Repair Description: ${repair.description ?? ''}",
                style: TextStyle(fontSize: 16, color: AppColors.blueColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
