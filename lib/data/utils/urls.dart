class Urls{
  static const String _baseUrl='http://ecom-api.teamrabbil.com/api';

  static const String promotionalSliderList='$_baseUrl/ListProductSlider';
  static const String categoriesList='$_baseUrl/CategoryList';

  static String productListByCategory(int categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';
  static String productListByRemark(String remark) => '$_baseUrl/ListProductByRemark/$remark';


  static String productDetails(int id) => '$_baseUrl/ProductDetailsById/$id';

  static String addToCart = '$_baseUrl/CreateCartList';


  static String emailVerify(String email) => '$_baseUrl/UserLogin/$email';
  static String otpVerify(String email,String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static String readProfile = '$_baseUrl/ReadProfile';
  static String createProfile = '$_baseUrl/CreateProfile';

}