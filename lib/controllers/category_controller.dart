import 'package:athanasia/controllers/setting_controller.dart';
import 'package:athanasia/models/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum CategoryType { first, second, third, fourth }

class CategoryController extends GetxController {
  // ! get_storage 기본타입 아닐때 무조건 json 저장. 불러올때 캐스팅.
  // @ 초기값 메모리에 저장될때는 기본타입 아니라도 상관없지만 저장된것 로드시 타입 호환안됨(json만 받는듯)

  final GetStorage box = GetStorage();

  late ReadWriteValue<List> storageCateList;
  Category selectedCategory =
      Category(first: '', second: '', third: '', fourth: '');

  late List<Category> cateList;

  List<String> get cateFirstList =>
      cateList.map((e) => e.first).toSet().toList();

  List<String> get cateSecondList => cateList
      .where((e) =>
          _matchCate(CategoryType.first, e, selectedCategory) &&
          e.second.isNotEmpty)
      .map((e) => e.second)
      .toSet()
      .toList();

  List<String> get cateThirdList => cateList
      .where((e) =>
          _matchCate(CategoryType.second, e, selectedCategory) &&
          e.second.isNotEmpty &&
          e.third.isNotEmpty)
      .map((e) => e.third)
      .toSet()
      .toList();

  List<String> get cateFourthList => cateList
      .where((e) =>
          _matchCate(CategoryType.third, e, selectedCategory) &&
          e.second.isNotEmpty &&
          e.third.isNotEmpty &&
          e.fourth.isNotEmpty)
      .map((e) => e.fourth)
      .toSet()
      .toList();

  List<String> get cateFirstListOnlyName =>
      cateFirstList.map((e) => e.split('_').first).toList();

  List<String> get cateSecondListOnlyName =>
      cateSecondList.map((e) => e.split('_').first).toList();

  List<String> get cateThirdListOnlyName =>
      cateThirdList.map((e) => e.split('_').first).toList();

  List<String> get cateFourthListOnlyName =>
      cateFourthList.map((e) => e.split('_').first).toList();

  // 중복 체크
  bool _duplicateCheck(bool Function(Category e) test, [String msg = '']) {
    bool isDuplicated = cateList.any(test);
    if (isDuplicated) {
      Get.defaultDialog(
        title: '알림',
        content: Text('중복된 내용입니다.${msg.isNotEmpty ? '($msg)' : ''}'),
        confirm: TextButton(
          onPressed: () => Get.back(),
          child: const Text('확인'),
        ),
      );
      return true;
    }
    return false;
  }

  bool _checkCategoryText(String text) {
    if (text.isEmpty) {
      SettingController.showSnackBar('알림', '"빈값은 입력할 수 없습니다.');
      return false;
    }

    var splitValue = text.split(categorySeparator);

    if (splitValue.length != 2 || !GetUtils.isNum(splitValue.last)) {
      SettingController.showSnackBar(
          '카테고리 형식 확인', '"카테고리 이름$categorySeparator번호" 형식으로 입력해 주세요.');
      return false;
    }

    return true;
  }

  bool _matchCate(CategoryType type, Category sourceCate, Category targetCate) {
    late bool test;

    switch (type) {
      case CategoryType.first:
        test = sourceCate.first == targetCate.first;
        break;
      case CategoryType.second:
        test = sourceCate.first == targetCate.first &&
            sourceCate.second == targetCate.second;
        break;
      case CategoryType.third:
        test = sourceCate.first == targetCate.first &&
            sourceCate.second == targetCate.second &&
            sourceCate.third == targetCate.third;
        break;
      case CategoryType.fourth:
        test = sourceCate.first == targetCate.first &&
            sourceCate.second == targetCate.second &&
            sourceCate.third == targetCate.third &&
            sourceCate.fourth == targetCate.fourth;
        break;
    }

    return test;
  }

  void selectCategory({
    required String first,
    required String second,
    required String third,
    String fourth = '',
  }) {
    selectedCategory = Category(
      first: first,
      second: second,
      third: third,
      fourth: fourth,
    );
    update();
  }

  void addCategory(CategoryType type, String? value) {
    var text = value ?? '';

    var check = _checkCategoryText(text);
    if (!check) {
      return;
    }

    late Category newCategory;
    switch (type) {
      case CategoryType.first:
        newCategory = Category(
          first: text,
          second: '',
          third: '',
          fourth: '',
        );
        break;
      case CategoryType.second:
        assert(selectedCategory.first.isNotEmpty, 'first 필요');
        newCategory = Category(
          first: selectedCategory.first,
          second: text,
          third: '',
          fourth: '',
        );
        break;
      case CategoryType.third:
        assert(
            selectedCategory.first.isNotEmpty &&
                selectedCategory.second.isNotEmpty,
            'first, second 필요');
        newCategory = Category(
          first: selectedCategory.first,
          second: selectedCategory.second,
          third: text,
          fourth: '',
        );
        break;
      case CategoryType.fourth:
        assert(
            selectedCategory.first.isNotEmpty &&
                selectedCategory.second.isNotEmpty &&
                selectedCategory.third.isNotEmpty,
            'first, second, third 필요');
        newCategory = Category(
          first: selectedCategory.first,
          second: selectedCategory.second,
          third: selectedCategory.third,
          fourth: text,
        );
        break;
    }
    bool isDuplicate = _duplicateCheck(
        (source) => _matchCate(CategoryType.fourth, source, newCategory), '');
    if (!isDuplicate) {
      cateList.add(newCategory);
      update();
    }
  }

  void removeCategory(CategoryType type, String item) {
    late Category target;

    switch (type) {
      case CategoryType.first:
        target = Category(
          first: item,
          second: '',
          third: '',
          fourth: '',
        );
        break;
      case CategoryType.second:
        target = Category(
          first: selectedCategory.first,
          second: item,
          third: '',
          fourth: '',
        );
        break;
      case CategoryType.third:
        target = Category(
          first: selectedCategory.first,
          second: selectedCategory.second,
          third: item,
          fourth: '',
        );
        break;
      case CategoryType.fourth:
        target = Category(
          first: selectedCategory.first,
          second: selectedCategory.second,
          third: selectedCategory.third,
          fourth: item,
        );
        break;
    }

    cateList.removeWhere((e) => _matchCate(type, e, target));
    update();
  }

  void modifyCate(CategoryType type, String source, String target) {
    var check = _checkCategoryText(target);
    if (!check) {
      return;
    }

    late Category sourceCate;
    late Category targetCate;

    switch (type) {
      case CategoryType.first:
        sourceCate = Category(
          first: source,
          second: '',
          third: '',
          fourth: '',
        );
        targetCate = Category(
          first: target,
          second: '',
          third: '',
          fourth: '',
        );
        break;
      case CategoryType.second:
        sourceCate = Category(
          first: selectedCategory.first,
          second: source,
          third: '',
          fourth: '',
        );
        targetCate = Category(
          first: selectedCategory.first,
          second: target,
          third: '',
          fourth: '',
        );
        break;
      case CategoryType.third:
        sourceCate = Category(
          first: selectedCategory.first,
          second: selectedCategory.second,
          third: source,
          fourth: '',
        );
        targetCate = Category(
          first: selectedCategory.first,
          second: selectedCategory.second,
          third: target,
          fourth: '',
        );
        break;
      case CategoryType.fourth:
        sourceCate = Category(
          first: selectedCategory.first,
          second: selectedCategory.second,
          third: selectedCategory.third,
          fourth: source,
        );
        targetCate = Category(
          first: selectedCategory.first,
          second: selectedCategory.second,
          third: selectedCategory.third,
          fourth: target,
        );
        break;
    }

    var isDuplicated =
        _duplicateCheck((e) => _matchCate(type, e, targetCate), target);

    if (!isDuplicated) {
      cateList = cateList.map((e) {
        if (_matchCate(type, e, sourceCate)) {
          late Category modifiedCate;

          switch (type) {
            case CategoryType.first:
              modifiedCate = Category(
                first: target,
                second: e.second,
                third: e.third,
                fourth: e.fourth,
              );
              break;
            case CategoryType.second:
              modifiedCate = Category(
                first: e.first,
                second: target,
                third: e.third,
                fourth: e.fourth,
              );
              break;
            case CategoryType.third:
              modifiedCate = Category(
                first: e.first,
                second: e.second,
                third: target,
                fourth: e.fourth,
              );
              break;
            case CategoryType.fourth:
              modifiedCate = Category(
                first: e.first,
                second: e.second,
                third: e.third,
                fourth: target,
              );
              break;
          }

          return modifiedCate;
        } else {
          return e;
        }
      }).toList();
      update();

      switch (type) {
        case CategoryType.first:
          selectCategory(first: '', second: '', third: '');
          break;
        case CategoryType.second:
          selectCategory(first: targetCate.first, second: '', third: '');
          break;
        case CategoryType.third:
          selectCategory(
              first: targetCate.first, second: targetCate.second, third: '');
          break;
        case CategoryType.fourth:
          break;
      }

      SettingController.showSnackBar('카테고리 수정됨', '"$source"  >>>  "$target"');
    }
  }

  void updateSettingCategory() {
    storageCateList.val = cateList.map((e) => e.toJson()).toList();
    update();
  }

  @override
  void onInit() {
    storageCateList = ReadWriteValue(
        'cateList',
        [
          Category(
            first: '분류1_1',
            second: '',
            third: '',
            fourth: '',
          ).toJson(),
          Category(
            first: '분류1_1',
            second: '분류1-2_12',
            third: '',
            fourth: '',
          ).toJson(),
          Category(
            first: '분류1_1',
            second: '분류1-2_12',
            third: '분류1-3_123',
            fourth: '',
          ).toJson(),
          Category(
            first: '분류1_1',
            second: '분류1-2_12',
            third: '분류1-3_123',
            fourth: '분류1-4_1234',
          ).toJson(),
        ],
        () => box);

    cateList = storageCateList.val.map((e) => Category.fromJson(e)).toList();
    super.onInit();
  }
}
