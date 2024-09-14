import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CustomListView extends StatelessWidget {
  final List<String> itemImages; // List of item images
  final List<String?>? logos; // List of logos
  final List<String> itemTitles; // List of item titles
  final List<String> itemDescriptions; // List of item descriptions
  final List<String> itemPrices; // List of item prices
  final int itemCount;
  const CustomListView({
    super.key,
    required this.itemImages,
    this.logos,
    required this.itemCount,
    required this.itemTitles,
    required this.itemDescriptions,
    required this.itemPrices,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0.h, // Set the height as needed
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        separatorBuilder: (context, index) => const SizedBox(width: 20.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: Colors.grey),
            ),
            width: 180.0,
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: itemImages[index],
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                              Colors.red, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: Text('Loading...'),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                // Image(
                //   image: AssetImage(itemImages[index]),
                //   width: 50.w,
                //   height: 50.h,
                // ),
                Text(
                  itemTitles[index],
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5.0),
                if (logos != null)
                  CachedNetworkImage(
                    imageUrl: logos![index]!,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(
                                Colors.red, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) => const Center(
                      child: Text('Loading...'),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                // Image.network(logos![index]!),
                Text(
                  itemDescriptions[index],
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  itemPrices[index],
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.orange),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: 110.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Center(
                        child: Row(
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
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
