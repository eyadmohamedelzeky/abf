import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/features/home/controller/home_controller.dart';
import 'package:abf_ather/features/home/controller/home_state.dart';
import 'package:abf_ather/features/product_details/view/product_category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewBody extends StatelessWidget {
  const GridViewBody({
    super.key,
    // required this.id,
  });
  // final int id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
      builder: (context, state) {
        final homeController = HomeController.get(context);
        return SizedBox(
          height: MediaQuery.of(context).size.height * 1.5,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: const EdgeInsets.all(8.0),
            children: (homeController.homeResponse.data != null)
                ? List.generate(
                    homeController.homeResponse.data!.categories!.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductCategory(
                                  name: homeController.homeResponse.data!
                                      .categories?[index].name,
                                  catoreyId: homeController.homeResponse.data!
                                      .categories?[index].id),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: hexToColor(homeController
                                .homeResponse.data!.categories![index].color!),
                          ),
                          margin: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: homeController.homeResponse.data!
                                      .categories![index].image!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          colorFilter: const ColorFilter.mode(
                                              Colors.red, BlendMode.colorBurn)),
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(
                                    child: Image(
                                      image: AssetImage(ImagesConstants.abf),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Image(
                                    image: AssetImage(ImagesConstants.abf),
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  homeController.homeResponse.data!
                                      .categories![index].name!,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : [],
          ),
        );
      },
    );
  }
}
