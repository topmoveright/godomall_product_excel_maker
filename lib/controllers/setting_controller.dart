import 'package:athanasia/constants/const_setting.dart';
import 'package:athanasia/controllers/category_controller.dart';
import 'package:athanasia/models/brand.dart';
import 'package:athanasia/models/size_detail_type.dart';
import 'package:athanasia/models/size_range.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {

  static const String version = '0.1.2';

  final GetStorage box = GetStorage(version);
  late ReadWriteValue<int> _formDense;
  late ReadWriteValue<int> _formMaxWidth;
  late ReadWriteValue<int> _formLabelWidth;
  late ReadWriteValue<String> _imageExtension;
  late ReadWriteValue<String> _imageRepositoryUrl;
  late ReadWriteValue<String> _naverTag;
  late ReadWriteValue<Map> _sizeRange;
  late ReadWriteValue<String> _sizeDetail;
  late ReadWriteValue<List> _materialList;
  late ReadWriteValue<List> _colorList;
  late ReadWriteValue<List> _sizeList;
  late ReadWriteValue<String> _detailPCDesc;
  late ReadWriteValue<String> _detailMobileDesc;
  late ReadWriteValue<List> _brandList;
  late ReadWriteValue<String> _brandFolder;

  bool get formDense => _formDense.val == 1;

  int get formMaxWidth => _formMaxWidth.val;

  int get formLabelWidth => _formLabelWidth.val;

  String get imageExtension => _imageExtension.val;

  String get imageRepositoryUrl => _imageRepositoryUrl.val;

  String get naverTag => _naverTag.val;

  SizeRange get sizeRange => SizeRange.fromJson(_sizeRange.val);

  List<SizeDetailType> get sizeDetailList =>
      _makeStrToSizeDetailList(_sizeDetail.val);

  List<String> get materialList =>
      _materialList.val.map((e) => e.toString()).toList();

  List<String> get colorList =>
      _colorList.val.map((e) => e.toString()).toList();

  List<String> get sizeList => _sizeList.val.map((e) => e.toString()).toList();

  String get detailPCDesc => _detailPCDesc.val;

  String get detailMobileDesc => _detailMobileDesc.val;

  String get brandFolder => _brandFolder.val;

  List<Brand> get brandList =>
      _brandList.val.map((e) => Brand.fromJson(e)).toList();

  List<Brand> _makeStrToBrandList(String text) {
    return text.split('\n').map((e) {
      var splitRow = e.trim().split('.');
      var fileExtension = '.${splitRow.last}';
      var name = e.split(fileExtension).first;
      return Brand(name: name, filename: '$name$fileExtension');
    }).toList();
  }

  List<SizeDetailType> _makeStrToSizeDetailList(String text) {
    return text.split('\n').map((e) {
      var splitRow = e.trim().split('|');
      var type = splitRow.first.trim();
      var detailList = splitRow.last.trim().split(',');
      return SizeDetailType(type: type, detailList: detailList);
    }).toList();
  }

  static void showSnackBar(String title, String content) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      content,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
    );
  }

  // Val : value
  // TC : text editing controller
  void updateSetting({
    required bool formDenseVal,
    required TextEditingController formMaxWidthTC,
    required TextEditingController formLabelWidthTC,
    required TextEditingController imageExtensionTC,
    required TextEditingController imageRepositoryUrlTC,
    required TextEditingController naverTagTC,
    required TextEditingController sizeRangeTC1,
    required TextEditingController sizeRangeTC2,
    required TextEditingController sizeDetailListTC,
    required TextEditingController materialListTC,
    required TextEditingController colorListTC,
    required TextEditingController brandListTC,
    required TextEditingController sizeListTC,
    required TextEditingController detailPCDescTC,
    required TextEditingController detailMobileDescTC,
    required TextEditingController brandFolderTC,
  }) {
    var sizeRangeStart = int.tryParse(sizeRangeTC1.text) ?? 0;
    var sizeRangeEnd = int.tryParse(sizeRangeTC2.text) ?? 0;

    if (sizeRangeStart == sizeRangeEnd) {
      showSnackBar('알림', '최소값과 최대값은 같을 수 없습니다.');
      return;
    }

    _formDense.val = formDenseVal ? 1 : 0;
    _formMaxWidth.val = int.parse(formMaxWidthTC.text);
    _formLabelWidth.val = int.parse(formLabelWidthTC.text);
    _imageExtension.val = imageExtensionTC.text;
    _imageRepositoryUrl.val = imageRepositoryUrlTC.text;
    _naverTag.val = naverTagTC.text;
    _sizeRange.val = SizeRange(sizeRangeStart, sizeRangeEnd).toJson();
    _sizeDetail.val = sizeDetailListTC.text;
    _materialList.val = materialListTC.text.split(',');
    _colorList.val = colorListTC.text.split(',');
    _brandList.val =
        _makeStrToBrandList(brandListTC.text).map((e) => e.toJson()).toList();
    _sizeList.val = sizeListTC.text.split(',');
    _detailPCDesc.val = detailPCDescTC.text;
    _detailMobileDesc.val = detailMobileDescTC.text;
    _brandFolder.val = brandFolderTC.text;

    Get.find<CategoryController>().updateSettingCategory();

    Get.back(canPop: true);
  }

  void resetStorage() async {
    await box.erase();
    Get.back(canPop: true);
  }

  void initStorage() {
    try {
      _formDense = ReadWriteValue('formDense', 0, () => box);
      _formMaxWidth = ReadWriteValue('formMaxWidth', 800, () => box);
      _formLabelWidth = ReadWriteValue('formLabelWidth', 150, () => box);
      _imageExtension = ReadWriteValue('imageExtension', 'jpg', () => box);
      _imageRepositoryUrl = ReadWriteValue(
          'imageRepositoryUrl', 'http://sigifs3.godohosting.com', () => box);
      _naverTag = ReadWriteValue('naverTag',
          '봄패션|봄옷|빈티지패션|레트로패션|명품구제샵|스트릿패션|여친룩|남친룩|빈티지쇼핑몰|명품빈티지샵', () => box);
      _sizeRange =
          ReadWriteValue('sizeRange', SizeRange(20, 40).toJson(), () => box);
      _sizeDetail = ReadWriteValue(
          'sizeDetailList',
          'Outers|어깨,가슴,팔,총장\nSetup 바지|어깨,가슴,암홀,총장\nTops|어깨,가슴,팔,총장',
          () => box);

      _materialList =
          ReadWriteValue('materialList', ['소재1', '소재2', '소재3'], () => box);
      _colorList =
          ReadWriteValue('colorList', ['컬러1', '컬러2', '컬러3'], () => box);
      _brandList = ReadWriteValue(
          'brandList',
          _makeStrToBrandList(ConstSetting.defaultBrandList)
              .map((e) => e.toJson())
              .toList(),
          () => box);
      _sizeList =
          ReadWriteValue('sizeList', ['사이즈1', '사이즈2', '사이즈3'], () => box);
      _detailPCDesc = ReadWriteValue('detailPCDesc',
          ConstSetting.defaultDetailImageHtmlTemplate, () => box);
      _detailMobileDesc = ReadWriteValue('detailMobileDesc',
          ConstSetting.defaultDetailImageHtmlTemplate, () => box);
      _brandFolder = ReadWriteValue('brandFolder', '/brand/', () => box);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    initStorage();
    super.onInit();
  }
}
