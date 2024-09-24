import 'dart:developer';

import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.index,
    required this.name,
    required this.image,
    required this.imageBrand,
    required this.rating,
    this.price,
    this.desc,
  });

  final int index;
  final List<String> name;
  final List<String> image;
  final List<String> imageBrand;
  final List rating;
  final List? price;
  final List? desc;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(.2)),
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the image, with a fallback for invalid or empty URLs
            Expanded(
              child: CachedNetworkImage(
                width: double.infinity,
                height: 40.h,
                imageUrl: image.isNotEmpty && index < image.length
                    ? image[index]
                    : '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.colorBurn,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: Text('Loading...')),
                errorWidget: (context, url, error) => Image(
                  image: AssetImage(ImagesConstants.abf),
                  width: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: CustomText(
                fontSize: 18.sp,
                text: name.isNotEmpty && index < name.length
                    ? name[index]
                    : 'No Name Available',
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: CachedNetworkImage(
                width: double.infinity,
                height: 40.h,
                imageUrl: imageBrand.isNotEmpty && index < imageBrand.length
                    ? imageBrand[index]
                    : '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.colorBurn,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: Text('Loading...')),
                errorWidget: (context, url, error) => Image(
                  image: AssetImage(ImagesConstants.abf),
                  width: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: rating.isNotEmpty && index < rating.length
                        ? rating[index].toDouble()
                        : 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (newRating) {
                      log("Rating updated: $newRating");
                    },
                  ),
                  CustomText(
                    text:
                        '(${rating.isNotEmpty && index < rating.length ? rating[index] : '0'})',
                  ),
                ],
              ),
            ),
            Flexible(
              child: CustomText(
                text: desc?.isNotEmpty == true && index < desc!.length
                    ? desc![index]
                    : 'Default description text',
                color: AppColors.greyColor,
              ),
            ),
            Expanded(
              child: CustomText(
                text: price?.isNotEmpty == true && index < price!.length
                    ? "${price![index]} ر.س"
                    : '2,750.00 ر.س',
                color: AppColors.orangeColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    // Let the button expand based on available space
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('أضف للعربة',
                                style: TextStyle(color: Colors.blue)),
                            Icon(Icons.shopping_cart, color: Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
