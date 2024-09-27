import 'dart:developer';
import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardItem extends StatefulWidget {
  const ProductCardItem(
      {super.key,
      required this.imageBrand,
      required this.index,
      required this.rating,
      this.price,
      this.desc,
      required this.name,
      required this.image});
  final List<String> imageBrand;
  final int index;
  final List rating;
  final List? price;
  final List? desc;
  final List<String> name;
  final List<String> image;
  @override
  State<ProductCardItem> createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: 250.w,
        child: Card(
          elevation: 3,
          color: AppColors.whiteColor,
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      width: double.infinity,
                      height: 40.h,
                      imageUrl: widget.imageBrand.isNotEmpty &&
                              widget.index < widget.imageBrand.length
                          ? widget.imageBrand[widget.index]
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
                    Text(
                      widget.name[widget.index],
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    CachedNetworkImage(
                      width: double.infinity,
                      height: 25.h,
                      imageUrl: widget.imageBrand.isNotEmpty &&
                              widget.index < widget.imageBrand.length
                          ? widget.imageBrand[widget.index]
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
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: widget.rating.isNotEmpty &&
                                  widget.index < widget.rating.length
                              ? widget.rating[widget.index].toDouble()
                              : 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemCount: 5,
                          itemSize: 15,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              "assets/images/star.png",
                              color: Colors.amber,
                            );
                          },
                          onRatingUpdate: (newRating) {
                            log("Rating updated: $newRating");
                          },
                        ),
                        Text(
                          '(${widget.rating.isNotEmpty && widget.index < widget.rating.length ? widget.rating[widget.index] : '0'})',
                        ),
                      ],
                    ),
                    Text(
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      widget.desc?.isNotEmpty == true &&
                              widget.index < widget.desc!.length
                          ? widget.desc![widget.index]
                          : 'Default description text',
                      style: TextStyle(color: AppColors.greyColor),
                    ),
                    Text(
                      widget.price?.isNotEmpty == true &&
                              widget.index < widget.price!.length
                          ? "${widget.price![widget.index]} ر.س"
                          : '2,750.00 ر.س',
                      style: TextStyle(color: AppColors.orangeColor),
                    ),
                    Row(
                      children: [
                        Expanded(
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
                                  Text(
                                    'أضف للعربة',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Icon(Icons.shopping_cart, color: Colors.blue),
                                ],
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(ImagesConstants.favorite),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
