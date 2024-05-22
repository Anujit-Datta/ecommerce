import 'package:get/get.dart';

class BottomNavBarController extends GetxController{

  int _selectedNavBarItem=0;

  get selectedNavBarItem => _selectedNavBarItem;

  changeSelectedItem(int index){
    _selectedNavBarItem=index;
    update();
  }
}