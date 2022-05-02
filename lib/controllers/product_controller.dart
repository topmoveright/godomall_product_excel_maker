import 'package:athanasia/controllers/category_controller.dart';
import 'package:athanasia/controllers/form_controller.dart';
import 'package:athanasia/models/product.dart';
import 'package:athanasia/views/insert_form.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> productList = [];

  void insertProduct(Product product) {
    productList.add(product);
    update();
    Get.back(canPop: true);
  }

  void updateProduct(int index, Product product) {
    productList[index] = product;
    update();
    Get.back(canPop: true);
  }

  void removeProduct(int index) {
    productList.removeAt(index);
    update();
  }

  void removeAll(){
    productList.clear();
    update();
  }

  void modifyProduct(int index) {
    Get.to(
      () =>  InsertForm(),
      binding: BindingsBuilder(() {
        Get.put(CategoryController());
        Get.put(FormController(modifyIndex: index));
      }),
    );
  }

  void copyProduct(Product product) {
    productList.add(product);
    update();
  }
}
