import 'package:abf_ather/core/app_varaible/app_varabile.dart';
import 'package:abf_ather/core/cache/shared_pref.dart';
import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/core/widgets/custom_list_view.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/home/controller/home_controller.dart';
import 'package:abf_ather/features/home/controller/home_state.dart';
import 'package:abf_ather/features/home/widgets/custom_grid_view_body.dart';
import 'package:abf_ather/features/home/widgets/custom_title_header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});
  static const String homePageScreen = '/HomePageScreen';
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<String> imagePaths = [
    ImagesConstants.personWithAbf,
    ImagesConstants.personWithAbf,
    ImagesConstants.personWithAbf,
    ImagesConstants.personWithAbf,
  ];
  PageController? pageController;
  int currentIndex = 0;
  var userModel;
  void getUserData() async {
    userModel = await SharedPreferencesService.getUserModel();
  }

  @override
  void initState() {
    getUserData();
    pageController = PageController();
    pageController!.addListener(() {
      setState(() {
        currentIndex = pageController!.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomeController, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            final home = HomeController.get(context);
            if (state is HomeLoadingState ||
                state is ProductByCategoryLoadingState ||
                state is HomeSilderLoadingState ||
                state is FavouriteProductsLoadingState) {
              return Center(
                child: spinkit,
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
                          onTap: () async {},
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
                        userModel != null
                            ? CustomText(
                                text:
                                    'مرحبا , ${userModel?.data?.fName ?? 'Guest '} ',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              )
                            : const CircularProgressIndicator.adaptive(),
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
                            itemCount:
                                home.homeSilderResponse.data?.length ?? 0,
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
