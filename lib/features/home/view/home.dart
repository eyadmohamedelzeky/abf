import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/CutsomTextHeader.dart';
import 'package:abf_ather/core/widgets/custom_list_view.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/auth/model/login_response_model.dart';
import 'package:abf_ather/features/home/controller/home_controller.dart';
import 'package:abf_ather/features/home/controller/home_state.dart';
import 'package:abf_ather/features/product_details/view/product_category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = "HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoginResponseModel? userModel;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> imagePaths = [
    ImagesConstants.personWithAbf,
    ImagesConstants.personWithAbf,
    ImagesConstants.personWithAbf,
    ImagesConstants.personWithAbf,
  ];
  PageController? pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    HomeController.get(context).getHomeSilder();
    HomeController.get(context).getHome();
    HomeController.get(context).getProductBrands();
    HomeController.get(context).getFavouriteProducts();
    pageController = PageController();

    pageController!.addListener(() {
      setState(() {
        currentIndex = pageController!.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: AppColors.whiteColor,
          height: 70.h,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(ImagesConstants.home),
                  height: 25.sp,
                  width: 25.sp,
                ),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage(ImagesConstants.shopping),
                      height: 25.sp,
                      width: 25.sp,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: const Text(
                          '3', // Replace with dynamic value if needed
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                label: 'العربة',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(ImagesConstants.project),
                  height: 25.sp,
                  width: 25.sp,
                ),
                label: 'مشاريعنا',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(ImagesConstants.business),
                  height: 25.sp,
                  width: 25.sp,
                ),
                label: 'أعمالنا',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(ImagesConstants.more),
                  height: 25.sp,
                  width: 25.sp,
                ),
                label: 'المزيد',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppColors.buttonColor,
            unselectedItemColor: AppColors.greyColor,
            onTap: _onItemTapped,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            final home = HomeController.get(context);
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            // var whatsappEntry =
                            //     home.soicalResponseModel.data?.firstWhere(
                            //   (e) => e.name?.toLowerCase() == 'whatsapp',
                            //   // Handle if no entry found
                            // );
                            // log("whatsappEntry.toString(): $whatsappEntry");
                            // String whatsappUrl = whatsappEntry?.url ?? '';

                            // if (whatsappUrl.isNotEmpty &&
                            //     await canLaunchUrl(Uri.parse(whatsappUrl))) {
                            //   await launchUrl(Uri.parse(whatsappUrl),
                            //       mode: LaunchMode
                            //           .externalApplication); // Ensures it opens in browser or app
                            // } else {
                            //   throw "Could not launch $whatsappUrl";
                            // }
                          },
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundColor: Colors.green,
                            child: Image(
                              image: AssetImage(ImagesConstants.whatsApp),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: Colors.black.withOpacity(.1),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: AppColors.buttonColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        CustomText(
                          text:
                              'مرحبا , ${userModel?.data?.fName ?? 'Guest '} ',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<HomeController, HomeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      final home = HomeController.get(context);
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider.builder(
                            options: CarouselOptions(
                              height: 150.h,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              onPageChanged: (value, reason) {
                                setState(() {
                                  currentIndex = value;
                                });
                              },
                            ),
                            itemCount: home.homeSilderResponse.data?.length ??
                                0, // Default to 0 if null
                            itemBuilder: (context, index, realIndex) {
                              if (home.homeSilderResponse.data != null &&
                                  index <
                                      home.homeSilderResponse.data!.length) {
                                return CachedNetworkImage(
                                  width: double.infinity,
                                  height: 40.h,
                                  imageUrl: home.homeSilderResponse.data![index]
                                          .image ??
                                      '',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
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
                                  placeholder: (context, url) => const Center(
                                    child: Text('Loading...'),
                                  ),
                                  errorWidget: (context, url, error) => Image(
                                    image: AssetImage(
                                        ImagesConstants.personWithAbf),
                                    width: double.infinity,
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'كل ما تحتاجه من مكيفات',
                                color: AppColors.whiteColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.h, vertical: 10.h),
                                child: CustomText(
                                  textAlign: TextAlign.center,
                                  text:
                                      'أصبح سهلا الآن وبين يديك فقط أطب ما تحتاجه ونصله إليك',
                                  color: Colors.white70,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    List.generate(imagePaths.length, (index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    width:
                                        currentIndex == index ? 50.0.w : 3.0.w,
                                    height: 7.0.h,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? Colors.white
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocBuilder<HomeController, HomeState>(
                    builder: (context, state) {
                      return const GridViewBody();
                    },
                  ),
                  const CustomTitleHeader(
                    text: "الأكثر مبيعا",
                    description: "أكثر منتجاتنا تحقيقا للمبيعات",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomListView(
                    itemCount: home.homeResponse.data?.products?.length ?? 0,
                    itemImages: (home.homeResponse.data?.products != null)
                        ? home.homeResponse.data!.products!
                            .expand((e) => e.images!)
                            .toList()
                        : [],
                    itemTitles: (home.homeResponse.data?.products != null)
                        ? home.homeResponse.data!.products!
                            .map((e) => e.name!)
                            .toList()
                        : [],
                    itemDescriptions: (home.homeResponse.data?.products != null)
                        ? home.homeResponse.data!.products!
                            .map((e) => e.description!)
                            .toList()
                        : [],
                    itemPrices: (home.homeResponse.data?.products != null)
                        ? home.homeResponse.data!.products!
                            .map((e) => e.price!)
                            .toList()
                        : [],
                    logos: home.productBrandsResponse.data
                        ?.map((e) => e.image)
                        .toList(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTitleHeader(
                      fontSize: 16.sp,
                      text: 'فتحات التكييف الألومنيوم',
                      description:
                          'مبيعات فتحات التكييف الألومنيوم المتاحة لدينا'),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: home.homeResponse.data != null
                        ? CustomListView(
                            itemCount:
                                home.homeResponse.data!.accssories!.length,
                            itemImages: home.homeResponse.data!.accssories!
                                .map((e) => e.image!)
                                .toList(),
                            itemTitles: home.homeResponse.data!.accssories!
                                .map((e) => e.name!)
                                .toList(),
                            itemDescriptions: home
                                .homeResponse.data!.accssories!
                                .map((e) => e.description!)
                                .toList(),
                            itemPrices: home.homeResponse.data!.accssories!
                                .map((e) => e.price!)
                                .toList())
                        : null,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomTitleHeader extends StatelessWidget {
  const CustomTitleHeader({
    super.key,
    required this.text,
    required this.description,
    this.fontSize,
  });
  final String text;
  final String description;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: AppColors.orangeColor,
            ),
            CustomText(
              fontSize: 16.sp,
              text: 'عرض المزيد',
              color: AppColors.orangeColor,
            ),
          ],
        ),
        //const Spacer(),
        Column(
          children: [
            CustomTextHeader(
              fontSize: fontSize,
              text: text,
            ),
            CustomText(
              text: description,
              color: AppColors.greyColor,
            )
          ],
        )
      ],
    );
  }
}

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
