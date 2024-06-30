import 'package:ecommerce/data/models/network_reponse.dart';
import 'package:ecommerce/data/models/product_list_model.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/data/network_caller/network_caller.dart';
import 'package:ecommerce/data/utils/urls.dart';
import 'package:get/get.dart';

class PopularProductsController extends GetxController{
  bool _inProgress=false;
  bool _isLoaded=false;
  String _errorMessage='';
  List<Product> _popularProductsList=[];

  bool get inProgress => _inProgress;
  bool get isLoaded => _isLoaded;
  List<Product> get popularProductsList => _popularProductsList;
  String get errorMessage => _errorMessage;

  Future<void> getPopularProductsList()async{
    _inProgress=true;
    update();

    final NetworkResponse response=await NetworkCaller.getRequest(url: Urls.productListByRemark('popular'));
    if(response.isSuccess){
      _popularProductsList=ProductList.fromJson(response.responseData).productListByCategory ?? [];
    }else{
      _errorMessage=response.errorMessage ?? '';
    }

    _inProgress=false;
    _isLoaded=true;
    update();
    return;
  }
}