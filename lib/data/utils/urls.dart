class Urls{
  static const String _baseUrl='http://ecom-api.teamrabbil.com/api';

  static const String promotionalSliderList='$_baseUrl/ListProductSlider';
  static const String categoriesList='$_baseUrl/CategoryList';

  static String productListByCategory(int categoryId) => '$_baseUrl/ListProductByCategory/$categoryId';
  static String productListByRemark(String remark) => '$_baseUrl/ListProductByRemark/$remark';

}