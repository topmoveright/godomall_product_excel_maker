import 'package:athanasia/constants/const_form.dart';
import 'package:athanasia/controllers/category_controller.dart';
import 'package:athanasia/controllers/product_controller.dart';
import 'package:athanasia/controllers/setting_controller.dart';
import 'package:athanasia/models/brand.dart';
import 'package:athanasia/models/material.dart';
import 'package:athanasia/models/product.dart';
import 'package:athanasia/models/size_detail.dart';
import 'package:athanasia/models/size_detail_type.dart';
import 'package:athanasia/models/size_range.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  FormController({this.modifyIndex});

  final int? modifyIndex;
  late bool isModify;

  bool enableSizeRange = false;

  final productController = Get.find<ProductController>();
  final settingController = Get.find<SettingController>();
  final categoryController = Get.find<CategoryController>();

  late final bool formDense = settingController.formDense;
  late final double labelWidth = settingController.formLabelWidth.toDouble();
  late final double formMaxWidth = settingController.formMaxWidth.toDouble();
  late final List<String> sizeDetailList =
      settingController.sizeDetailList.map((e) => e.type).toList();
  late final List<String> sizeList = settingController.sizeList;
  late final List<String> colorList = settingController.colorList;
  late final List<Brand> brandList = settingController.brandList;
  late final List<String> materialList = settingController.materialList;
  late final min = settingController.sizeRange.start.toDouble();
  late final max = settingController.sizeRange.end.toDouble();

  AutocompleteOptionsBuilder<String> get optionsBuilder =>
      (TextEditingValue textEditingValue) {
        return settingController.brandList
            .map((e) => e.name)
            .where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        }).toList();
      };

  final nameTC = TextEditingController();
  final sellingPriceTC = TextEditingController();
  final fixedPriceTC = TextEditingController();
  final searchKeywordTC = TextEditingController();
  final listImageNameTC = TextEditingController();
  final listImageNameDetailTC = TextEditingController();
  final listImageNameDetailLastNumTC = TextEditingController();
  final brandTC = TextEditingController();
  SizeDetailType sizeDetailType = SizeDetailType(type: '', detailList: []);
  final sizeDetailTC = TextEditingController();

  late SizeRange sizeRange = settingController.sizeRange;
  final imageFolderTC = TextEditingController();

  List<TextEditingController> materialListTC = [TextEditingController()];

  // 드롭다운
  List<String> materialListDR = [''];
  String colorDR = '';
  String sizeDR = '';

  String displayStringForOption(Brand option) => option.name;

  void selectSizeType(String? value) {
    var type = value ?? '';

    sizeDetailType = type.isNotEmpty
        ? settingController.sizeDetailList.firstWhere((e) => e.type == value)
        : SizeDetailType(type: '', detailList: []);
    update();
  }

  void _initModify(int modifyIndex) {
    final Product modifyProduct = productController.productList[modifyIndex];
    nameTC.text = modifyProduct.name;
    sellingPriceTC.text =
        ConstForm.priceFormat.format(modifyProduct.sellingPrice);
    fixedPriceTC.text = ConstForm.priceFormat.format(modifyProduct.fixedPrice);
    searchKeywordTC.text = modifyProduct.searchKeyword;
    listImageNameTC.text = modifyProduct.listImageName;
    listImageNameDetailTC.text = modifyProduct.listImageNameDetail;
    listImageNameDetailLastNumTC.text =
        modifyProduct.listImageNameDetailLastNum.toString();
    if (modifyProduct.sizeRange == null) {
      enableSizeRange = false;
    } else {
      enableSizeRange = true;
      sizeRange = modifyProduct.sizeRange!;
    }
    sizeDetailType = modifyProduct.sizeDetail.sizeDetailType;
    sizeDetailTC.text = modifyProduct.sizeDetail.value;
    imageFolderTC.text = modifyProduct.imageFolder;
    materialListDR = modifyProduct.material.map((e) => e.name).toList();
    materialListTC = List.generate(
        modifyProduct.material.length,
        (index) => TextEditingController()
          ..text = modifyProduct.material[index].percent.toString());
    colorDR = modifyProduct.color;
    sizeDR = modifyProduct.size;
    brandTC.text = modifyProduct.brand.name;

    categoryController.selectCategory(
      first: modifyProduct.category.first,
      second: modifyProduct.category.second,
      third: modifyProduct.category.third,
      fourth: modifyProduct.category.fourth,
    );
  }

  String _getCateValByName(
    String name,
    List<String> listName,
    List<String> listCate,
  ) {
    var selectedIndex = listName.indexOf(name);
    return selectedIndex < 0 ? '' : listCate.elementAt(selectedIndex);
  }

  void selectCateFirst(String? value) {
    var selectedVal = value ?? '';

    var cateVal = _getCateValByName(
      selectedVal,
      categoryController.cateFirstListOnlyName,
      categoryController.cateFirstList,
    );

    categoryController.selectCategory(
      first: cateVal,
      second: '',
      third: '',
      fourth: '',
    );
  }

  void selectCateSecond(String? value) {
    var selectedVal = value ?? '';

    var cateVal = _getCateValByName(
      selectedVal,
      categoryController.cateSecondListOnlyName,
      categoryController.cateSecondList,
    );

    categoryController.selectCategory(
      first: categoryController.selectedCategory.first,
      second: cateVal,
      third: '',
      fourth: '',
    );
  }

  void selectCateThird(String? value) {
    var selectedVal = value ?? '';

    var cateVal = _getCateValByName(
      selectedVal,
      categoryController.cateThirdListOnlyName,
      categoryController.cateThirdList,
    );

    categoryController.selectCategory(
      first: categoryController.selectedCategory.first,
      second: categoryController.selectedCategory.second,
      third: cateVal,
      fourth: '',
    );
  }

  void selectCateFourth(String? value) {
    var selectedVal = value ?? '';

    var cateVal = _getCateValByName(
      selectedVal,
      categoryController.cateFourthListOnlyName,
      categoryController.cateFourthList,
    );

    categoryController.selectCategory(
      first: categoryController.selectedCategory.first,
      second: categoryController.selectedCategory.second,
      third: categoryController.selectedCategory.third,
      fourth: cateVal,
    );
  }

  void selectSizeRange(RangeValues values) {
    sizeRange = SizeRange(values.start.toInt(), values.end.toInt());
    update();
  }

  void addMaterial() {
    materialListDR.add('');
    materialListTC.add(TextEditingController());
    update();
  }

  void removeMaterial(int index) {
    materialListDR.removeAt(index);
    materialListTC.removeAt(index);
    update();
  }

  void submitAction() {
    var checkSizeDetailLength =
        sizeDetailType.detailList.length == sizeDetailTC.text.split(',').length;

    if (sizeDetailType.type.isNotEmpty && !checkSizeDetailLength) {
      SettingController.showSnackBar('알림',
          '사이즈 상세 값을 확인해 주세요.(총 ${sizeDetailType.detailList.length}개 : ${sizeDetailType.toStrDetailList()}) ');
      return;
    }

    if (sizeDetailTC.text.isNotEmpty && sizeDetailType.type.isEmpty) {
      SettingController.showSnackBar('알림', '사이즈 상세 종류를 선택해 주세요.');
      return;
    }

    var product = Product(
      name: nameTC.text,
      sellingPrice: int.tryParse(sellingPriceTC.text.replaceAll(',', '')) ?? 0,
      fixedPrice: int.tryParse(fixedPriceTC.text.replaceAll(',', '')) ?? 0,
      searchKeyword: searchKeywordTC.text,
      listImageName: listImageNameTC.text,
      listImageNameDetail: listImageNameDetailTC.text,
      listImageNameDetailLastNum:
          int.tryParse(listImageNameDetailLastNumTC.text) ?? 0,
      sizeRange: enableSizeRange ? sizeRange : null,
      sizeDetail:
          SizeDetail(sizeDetailType: sizeDetailType, value: sizeDetailTC.text),
      imageFolder: imageFolderTC.text,
      material: List.generate(
          materialListDR.length,
          (index) => PMaterial(
              name: materialListDR[index],
              percent: int.tryParse(materialListTC[index].text) ?? 0))..removeWhere((e) => e.name.isEmpty),
      color: colorDR,
      brand: settingController.brandList.firstWhere(
          (e) => e.name == brandTC.text,
          orElse: () => Brand(name: '', filename: '')),
      size: sizeDR,
      category: categoryController.selectedCategory,
      naverTag: settingController.naverTag,

    );

    if (isModify) {
      assert(modifyIndex != null, 'modifyIndex 값 필요');
      productController.updateProduct(modifyIndex!, product);
    } else {
      productController.insertProduct(product);
    }
  }

  @override
  void onInit() {
    isModify = modifyIndex == null ? false : true;
    // 수정
    if (isModify) {
      _initModify(modifyIndex!);
    }

    super.onInit();
  }

  @override
  void onClose() {
    nameTC.dispose();
    sellingPriceTC.dispose();
    fixedPriceTC.dispose();
    searchKeywordTC.dispose();
    listImageNameTC.dispose();
    listImageNameDetailTC.dispose();
    listImageNameDetailLastNumTC.dispose();
    sizeDetailTC.dispose();
    imageFolderTC.dispose();
    // imageRepositoryTC.dispose();
    super.onClose();
  }
}
