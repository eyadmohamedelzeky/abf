import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/constants/app_constants.dart';
import 'package:abf_ather/features/business/view/business_screen.dart';
import 'package:abf_ather/features/cart/controller/card_controller.dart';
import 'package:abf_ather/features/cart/view/cart_screen.dart';
import 'package:abf_ather/features/home/controller/home_controller.dart';
import 'package:abf_ather/features/home/view/home_page.dart';
import 'package:abf_ather/features/more/view/more_screen.dart';
import 'package:abf_ather/features/projects/view/project_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = "HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomePageScreen(),
    const CartScreen(),
    const ProjectsScreen(),
    const BusinessScreen(),
    const MoreScreen(),
  ];
  Color getIconColor(int index) {
    return _selectedIndex == index
        ? Colors.blue
        : Colors.grey; // Change colors as needed
  }

  @override
  void initState() {
    super.initState();
    HomeController.get(context).getHomeSilder();
    HomeController.get(context).getHome();
    HomeController.get(context).getProductBrands();
    HomeController.get(context).getFavouriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: AppColors.whiteColor,
          height: 70,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(ImagesConstants.home),
                  height: 25,
                  width: 25,
                  color: getIconColor(0),
                ),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage(ImagesConstants.shopping),
                      height: 25,
                      width: 25,
                      color: getIconColor(1),
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
                        child: Text(
                          '${CardController.get(context).cardProductsResponse?.data?.cartProducts?.length ?? 0}',
                          style: const TextStyle(
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
                  height: 25,
                  width: 25,
                  color: getIconColor(2), // Set icon color based on selection
                ),
                label: 'مشاريعنا',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(ImagesConstants.business),
                  height: 25,
                  width: 25,
                  color: getIconColor(3), // Set icon color based on selection
                ),
                label: 'أعمالنا',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage(ImagesConstants.more),
                  height: 25,
                  width: 25,
                  color: getIconColor(4), // Set icon color based on selection
                ),
                label: 'المزيد',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue, // Color for selected item
            unselectedItemColor: Colors.grey, // Color for unselected items
            onTap: _onItemTapped,
          ),
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
