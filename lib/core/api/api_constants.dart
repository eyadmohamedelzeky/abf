class ApiConstants {
  static const String baseUrl = 'https://albakr-ac.com';
  static const String login = '/api/login';
  static const String register = '/api/register';
  static const String completeRegister = '/api/complete/register';
  static const String resetPassword = '/api/resetPassword';
  static const String homeSilder = '/api/home/slider';
  static const String home = '/api/home';
  static const String productBrands = '/api/product/brands';
  static String sendOtp(String email) => '/api/send/otp?email=$email';
  static String askPriceCategory = '/api/ask_price/categories';
  static String askPrice = '/api/ask_price/store';
  static String filterPath = '/api/product/filter';
  static String soical = '/api/settings/social-urls';
  static String productDetails(int id) => '/api/product/details?product_id=$id';
  static String accessoriesDetails(int id) => '/api/accessories-details/$id';
  static String checkOtp(String email, String otp) =>
      '/api/check/otp?email=$email&otp=$otp';
  static String favouriteProducts = '/api/favourites';
  // static String productBrandsDetails(int id) =>
  //     'api/product/details?product_category_id=$id';
  //
  static String productByCategory(int id) =>
      '/api/product/category?category_id=$id';

  ///api/product/category?category_id=1
  static const timeOutDuration = Duration(seconds: 5000);
}
