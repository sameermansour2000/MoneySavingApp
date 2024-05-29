import 'package:get/get.dart';

class HomeController extends GetxController{
int selectedScrean=0;

  void changeScrean(int index){
    selectedScrean=index;
    update();
  }
}