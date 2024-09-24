import 'dart:developer';
import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/CutsomTextHeader.dart';
import 'package:abf_ather/core/widgets/custom_button.dart';
import 'package:abf_ather/core/widgets/custom_button_with_icon.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/ask_price_feature/view/ask_price_screen.dart';
import 'package:abf_ather/features/home/controller/home_controller.dart';
import 'package:abf_ather/features/home/controller/home_state.dart';
import 'package:abf_ather/features/product_details/controller/product_details_controller.dart';
import 'package:abf_ather/features/product_details/controller/product_details_state.dart';
import 'package:abf_ather/features/product_details/model/filter_request_model.dart';
import 'package:abf_ather/features/product_details/view/widgets/product_card_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key, this.catoreyId, this.name});
  final int? catoreyId;
  final String? name;
  static const String id = "ProductCategory";
  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  void initState() {
    HomeController.get(context).getProductByCategory(id: widget.catoreyId ?? 0);
    log('id: ${widget.catoreyId}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) {
            
          },
          builder: (context, state) {
            final controller = HomeController.get(context);
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      CustomAppBarForProductCardItem(
                          controller: controller, widget: widget),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 3 / 4,
                          children: List.generate(
                            controller.productByCategoryResponse.data?.data
                                    ?.length ??
                                0,
                            (index) {
                              final categories = controller
                                  .productByCategoryResponse.data?.data;
                              if (categories != null && categories.isNotEmpty) {
                                return Flexible(
                                  child: ProductCardItem(
                                    index: index,
                                    name: categories
                                        .map((e) => e.name ?? '')
                                        .toList(),
                                    image: categories
                                        .map((e) => e.images?.first ?? '')
                                        .toList(),
                                    imageBrand: const [], // Assuming there's a brand image field
                                    rating: categories
                                        .map((e) => e.totalRate ?? 0)
                                        .toList(),
                                    desc: categories
                                        .map((e) => e.description ?? '')
                                        .toList(),
                                    price: categories
                                        .map((e) => e.price ?? 0)
                                        .toList(),

                                    // categories.map((e) => e.rating ?? 0
                                    // ).toList(),
                                  ),
                                );
                              }
                              return const Center(
                                  child: Text('No Categories Available'));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomButtonWithIcon(
                    onPressed: () {
                      Navigator.pushNamed(context, AskPriceScreen.id);
                    },
                    text: 'طلب عرض سعر',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomAppBarForProductCardItem extends StatelessWidget {
  const CustomAppBarForProductCardItem({
    super.key,
    required this.controller,
    required this.widget,
  });

  final HomeController controller;
  final ProductCategory widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            showBottomSheet(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      topLeft: Radius.circular(10.r))),
              showDragHandle: true,
              enableDrag: true,
              context: context,
              builder: (context) {
                return BlocConsumer<ProductDetailsController,
                    ProductDetailsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final productDetailsController =
                        ProductDetailsController.get(context);
                    return DraggableScrollableSheet(
                      expand: false,
                      snap: true,
                      builder: (BuildContext context,
                              ScrollController scrollController) =>
                          SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomTextHeader(
                                  text: 'فلترة النتائج ',
                                  fontSize: 20.sp,
                                ),
                                Image(
                                  image: AssetImage(ImagesConstants.filter),
                                  height: 20.h,
                                  width: 20.w,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            ...List.generate(
                              controller.productBrandsResponse.data!.length,
                              (index) {
                                return Column(
                                  children: [
                                    CustomGridViewForCheckBox(
                                      checkBoxValues: List<bool>.filled(
                                        controller
                                            .productBrandsResponse.data!.length,
                                        false,
                                      ),
                                      logos: controller
                                          .productBrandsResponse.data!
                                          .map((e) => e.image!)
                                          .toList(),
                                    ),
                                    Divider(
                                      color: AppColors.greyColor,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 180.w,
                                      height: 100.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          CustomText(
                                            text: ' حسب المبيعات',
                                            color: AppColors.greyColor,
                                          ),
                                          CheckboxListTile.adaptive(
                                            activeColor: AppColors.orangeColor,
                                            checkColor: AppColors.whiteColor,
                                            contentPadding: EdgeInsets.zero,
                                            value: productDetailsController
                                                .productMoreThanBuy,
                                            onChanged: (value) {
                                              productDetailsController
                                                  .toggleProductMoreThanBuy(
                                                      value!);
                                            },
                                            title: const CustomText(
                                              text: 'المنتجات الأكثر مبيعا',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: AppColors.greyColor,
                                    ),
                                    CustomText(
                                      text: ' حسب السعر',
                                      color: AppColors.greyColor,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile.adaptive(
                                              value: 1,
                                              groupValue:
                                                  productDetailsController
                                                      .selectedValueForPrice,
                                              onChanged: (value) {
                                                productDetailsController
                                                    .handleRadioValueChangeForPrice(
                                                        value!);
                                              },
                                              title: CustomText(
                                                text:
                                                    'من الأقل إلى الأعلى سعرا',
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile.adaptive(
                                              value: 2,
                                              groupValue:
                                                  productDetailsController
                                                      .selectedValueForPrice,
                                              onChanged: (value) {
                                                productDetailsController
                                                    .handleRadioValueChangeForPrice(
                                                        value!);
                                              },
                                              title: CustomText(
                                                text:
                                                    'من الأعلى إلى الأقل سعرا',
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: AppColors.greyColor,
                                    ),
                                    CustomText(
                                      text: ' حسب التقييم',
                                      color: AppColors.greyColor,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: RadioListTile.adaptive(
                                              value: 1,
                                              groupValue:
                                                  productDetailsController
                                                      .selectedValueForRating,
                                              onChanged: (value) {
                                                productDetailsController
                                                    .handleRadioValueChangeForRating(
                                                        value!);
                                              },
                                              title: CustomText(
                                                text:
                                                    'من الأقل إلى الأعلى تقييما',
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RadioListTile.adaptive(
                                              activeColor: AppColors.blueColor,
                                              value: 2,
                                              groupValue:
                                                  productDetailsController
                                                      .selectedValueForRating,
                                              onChanged: (value) {
                                                productDetailsController
                                                    .handleRadioValueChangeForRating(
                                                        value!);
                                              },
                                              title: CustomText(
                                                text:
                                                    'من الأعلى إلى الأقل تقييما',
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    state is FilterProductLoadingState
                                        ? const CircularProgressIndicator()
                                        : CustomButton(
                                            onPressed: () async {
                                              List<int> selectedBrandIds = [];
                                              for (int i = 0;
                                                  i <
                                                      productDetailsController
                                                          .logoChecked.length;
                                                  i++) {
                                                if (productDetailsController
                                                    .logoChecked[i]) {
                                                  selectedBrandIds.add(
                                                      controller
                                                          .productBrandsResponse
                                                          .data!
                                                          .map((e) => e.id)
                                                          .toList()[i]!);
                                                }
                                              }
                                              await productDetailsController
                                                  .filterProducts(
                                                request: FilterRequestModel(
                                                    categoryId: controller
                                                        .homeResponse
                                                        .data!
                                                        .categories!
                                                        .map((e) => e.id!)
                                                        .first,
                                                    brandsId: selectedBrandIds,
                                                    bestseller:
                                                        productDetailsController
                                                                .productMoreThanBuy
                                                            ? 1
                                                            : 0,
                                                    price: productDetailsController
                                                        .selectedValueForPrice,
                                                    rate: productDetailsController
                                                        .selectedValueForRating),
                                              );
                                            },
                                            text: 'فلترة',
                                          ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
            showBottomSheet(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r))),
              //showDragHandle: true,
              enableDrag: true,
              context: context,
              builder: (context) {
                return BlocConsumer<ProductDetailsController,
                    ProductDetailsState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final productDetailsController =
                        ProductDetailsController.get(context);
                    final productBrands =
                        controller.productBrandsResponse.data!;
                    final checkBoxValues =
                        List<bool>.filled(productBrands.length, false);
                    final logos = productBrands.map((e) => e.image!).toList();

                    return Padding(
                      padding: const EdgeInsets.all(32),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomTextHeader(
                                  text: 'فلترة النتائج ',
                                  fontSize: 20.sp,
                                ),
                                Image(
                                  image: AssetImage(ImagesConstants.filter),
                                  height: 20.h,
                                  width: 20.w,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            CustomGridViewForCheckBox(
                              checkBoxValues: checkBoxValues,
                              logos: logos,
                            ),
                            Divider(
                              color: AppColors.greyColor,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(
                                  text: ' حسب المبيعات',
                                  color: AppColors.greyColor,
                                ),
                                CheckboxListTile.adaptive(
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                  contentPadding: EdgeInsets.zero,
                                  side: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  dense: true,
                                  checkboxShape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  activeColor: AppColors.orangeColor,
                                  checkColor: AppColors.whiteColor,
                                  value: productDetailsController
                                      .productMoreThanBuy,
                                  onChanged: (value) {
                                    productDetailsController
                                        .toggleProductMoreThanBuy(value!);
                                  },
                                  title: const CustomText(
                                    text: 'المنتجات الأكثر مبيعا',
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColors.greyColor,
                            ),
                            CustomText(
                              text: ' حسب السعر',
                              color: AppColors.greyColor,
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile.adaptive(
                                      contentPadding: EdgeInsets.zero,
                                      activeColor: AppColors.buttonColor,
                                      selectedTileColor: AppColors.buttonColor,
                                      value: 1,
                                      groupValue: productDetailsController
                                          .selectedValueForPrice,
                                      onChanged: (value) {
                                        productDetailsController
                                            .handleRadioValueChangeForPrice(
                                                value!);
                                      },
                                      title: CustomText(
                                        text: 'من الأقل إلى الأعلى سعرا',
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile.adaptive(
                                      contentPadding: EdgeInsets.zero,
                                      activeColor: AppColors.buttonColor,
                                      selectedTileColor: AppColors.buttonColor,
                                      value: 2,
                                      groupValue: productDetailsController
                                          .selectedValueForPrice,
                                      onChanged: (value) {
                                        productDetailsController
                                            .handleRadioValueChangeForPrice(
                                                value!);
                                      },
                                      title: CustomText(
                                        text: 'من الأعلى إلى الأقل سعرا',
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: AppColors.greyColor,
                            ),
                            CustomText(
                              text: ' حسب التقييم',
                              color: AppColors.greyColor,
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile.adaptive(
                                      contentPadding: EdgeInsets.zero,
                                      activeColor: AppColors.buttonColor,
                                      selectedTileColor: AppColors.buttonColor,
                                      value: 1,
                                      groupValue: productDetailsController
                                          .selectedValueForRating,
                                      onChanged: (value) {
                                        productDetailsController
                                            .handleRadioValueChangeForRating(
                                                value!);
                                      },
                                      title: CustomText(
                                        text: 'من الأقل إلى الأعلى تقييما',
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile.adaptive(
                                      contentPadding: EdgeInsets.zero,
                                      activeColor: AppColors.buttonColor,
                                      selectedTileColor: AppColors.buttonColor,
                                      value: 2,
                                      groupValue: productDetailsController
                                          .selectedValueForRating,
                                      onChanged: (value) {
                                        productDetailsController
                                            .handleRadioValueChangeForRating(
                                                value!);
                                      },
                                      title: CustomText(
                                        text: 'من الأعلى إلى الأقل تقييما',
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            CustomButton(
                              onPressed: () {},
                              text: 'فلترة',
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          child: Row(
            children: [
              CustomText(
                text: 'فلترة النتائج ',
                color: AppColors.greyColor,
              ),
              Image(
                image: AssetImage(ImagesConstants.filter),
                height: 20.h,
                width: 20.w,
                color: Colors.black,
              ),
            ],
          ),
        ),
        CustomTextHeader(fontSize: 20.sp, text: widget.name ?? ''),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_forward,
            color: AppColors.blueColor,
          ),
        ),
      ],
    );
  }
}

class CustomGridViewForCheckBox extends StatefulWidget {
  const CustomGridViewForCheckBox(
      {super.key, required this.logos, required this.checkBoxValues});
  final List<String> logos;
  final List<bool> checkBoxValues;

  @override
  State<CustomGridViewForCheckBox> createState() =>
      _CustomGridViewForCheckBoxState();
}

class _CustomGridViewForCheckBoxState extends State<CustomGridViewForCheckBox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0, // Reduced spacing between columns
            mainAxisSpacing: 0, // Reduced spacing between rows
          ),
          itemCount: widget.checkBoxValues.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              side: const BorderSide(color: Colors.grey),
              visualDensity: VisualDensity.standard,
              activeColor: AppColors.orangeColor,
              checkColor: AppColors.whiteColor,
              dense: false,
              contentPadding: EdgeInsets.zero,
              checkboxShape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              value: widget.checkBoxValues[index],
              onChanged: (value) {
                setState(() {
                  widget.checkBoxValues[index] = value!;
                });
              },
              title: CachedNetworkImage(
                imageUrl: widget.logos[index],
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                          Colors.red, BlendMode.colorBurn),
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: Text('Loading...'),
                ),
                errorWidget: (context, url, error) => Image(
                  image: AssetImage(
                    ImagesConstants.gree,
                  ),
                  width: 200.w,
                  height: 80.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
            );
          },
        ),
      ),
    );
  }
}
