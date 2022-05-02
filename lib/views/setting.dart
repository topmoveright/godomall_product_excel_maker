import 'package:athanasia/constants/const_form.dart';
import 'package:athanasia/controllers/category_controller.dart';
import 'package:athanasia/controllers/setting_controller.dart';
import 'package:athanasia/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final settingController = Get.find<SettingController>();

  late bool formDenseVal;
  final formMaxWidthTC = TextEditingController();
  final formLabelWidthTC = TextEditingController();
  final imageExtensionTC = TextEditingController();
  final imageRepositoryUrlTC = TextEditingController();
  final naverTagTC = TextEditingController();
  final sizeRangeTC1 = TextEditingController();
  final sizeRangeTC2 = TextEditingController();
  final sizeDetailListTC = TextEditingController();
  final materialListTC = TextEditingController();
  final colorListTC = TextEditingController();
  final brandFolderTC = TextEditingController();
  final brandListTC = TextEditingController();
  final sizeListTC = TextEditingController();
  final detailPCDescTC = TextEditingController();
  final detailMobileDescTC = TextEditingController();

  @override
  void initState() {
    formDenseVal = settingController.formDense;
    formMaxWidthTC.text = settingController.formMaxWidth.toString();
    formLabelWidthTC.text = settingController.formLabelWidth.toString();
    imageExtensionTC.text = settingController.imageExtension;
    imageRepositoryUrlTC.text = settingController.imageRepositoryUrl;
    naverTagTC.text = settingController.naverTag;
    sizeRangeTC1.text = settingController.sizeRange.start.toInt().toString();
    sizeRangeTC2.text = settingController.sizeRange.end.toInt().toString();
    sizeDetailListTC.text = settingController.sizeDetailList.map((e) => e.toStrSettingValue()).join('\n');
    materialListTC.text = settingController.materialList.join(',');
    colorListTC.text = settingController.colorList.join(',');
    sizeListTC.text = settingController.sizeList.join(',');
    detailPCDescTC.text = settingController.detailPCDesc;
    detailMobileDescTC.text = settingController.detailMobileDesc;
    brandListTC.text =
        settingController.brandList.map((e) => e.filename).join('\n');
    brandFolderTC.text = settingController.brandFolder;
    super.initState();
  }

  @override
  void dispose() {
    formMaxWidthTC.dispose();
    formLabelWidthTC.dispose();
    imageExtensionTC.dispose();
    imageRepositoryUrlTC.dispose();
    naverTagTC.dispose();
    sizeRangeTC1.dispose();
    sizeRangeTC2.dispose();
    sizeDetailListTC.dispose();
    materialListTC.dispose();
    colorListTC.dispose();
    brandListTC.dispose();
    brandFolderTC.dispose();
    sizeListTC.dispose();
    detailPCDescTC.dispose();
    detailMobileDescTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        centerTitle: true,
        actions: [
          TextButton.icon(
            label: const Text('초기화', style: TextStyle(color: Colors.white)),
            onPressed: () => Get.find<SettingController>().resetStorage(),
            icon: const Icon(Icons.warning, color: Colors.white),
          ),
          TextButton.icon(
            label: const Text('License', style: TextStyle(color: Colors.white)),
            onPressed: () => Get.to(() => const LicensePage()),
            icon: const Icon(Icons.copyright, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SettingController>(
          builder: (ctl) => Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  settingRow(
                    label: buildLabel('좁은간격'),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Switch(
                            value: formDenseVal,
                            onChanged: (value) {
                              setState(() {
                                formDenseVal = value;
                              });
                            }),
                      ],
                    ),
                  ),
                  settingRow(
                    content: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: settingRow(
                            label: buildLabel('입력폼 크기'),
                            content: buildInputNumber(formMaxWidthTC),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Flexible(
                          flex: 1,
                          child: settingRow(
                            label: buildLabel('라벨 크기'),
                            content: buildInputNumber(formLabelWidthTC),
                          ),
                        ),
                      ],
                    ),
                  ),
                  settingRow(
                    content: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: settingRow(
                            label: buildLabel('이미지 확장자'),
                            content:
                                buildInputString(controller: imageExtensionTC),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Flexible(
                          flex: 1,
                          child: settingRow(
                            label: buildLabel('이미지 주소'),
                            content: buildInputString(
                                controller: imageRepositoryUrlTC),
                          ),
                        ),
                      ],
                    ),
                  ),
                  settingRow(
                    label: buildLabel('네이버 태그'),
                    content: buildInputString(controller: naverTagTC),
                  ),
                  settingRow(
                    label: buildLabel('사이즈 범위'),
                    content: Row(
                      children: [
                        buildLabel('최소', 50),
                        Flexible(
                          child: buildInputNumber(sizeRangeTC1),
                        ),
                        const SizedBox(width: 40),
                        buildLabel('최대', 50),
                        Flexible(
                          child: buildInputNumber(sizeRangeTC2),
                        ),
                      ],
                    ),
                  ),
                  settingRow(
                    label: buildLabel('소재'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildInputString(controller: materialListTC),
                        Text('쉼표(,)로 구분', style: Get.textTheme.caption),
                      ],
                    ),
                  ),
                  settingRow(
                    label: buildLabel('컬러'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildInputString(controller: colorListTC),
                        Text('쉼표(,)로 구분', style: Get.textTheme.caption),
                      ],
                    ),
                  ),
                  settingRow(
                    label: buildLabel('브랜드 폴더명'),
                    content: buildInputString(controller: brandFolderTC),
                  ),
                  settingRow(
                    label: buildLabel('브랜드'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildInputString(
                          controller: brandListTC,
                          maxLine: 15,
                        ),
                        Text('브랜드파일명 - enter 로 구분',
                            style: Get.textTheme.caption),
                      ],
                    ),
                  ),
                  settingRow(
                    label: buildLabel('규격'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildInputString(controller: sizeListTC),
                        Text('쉼표(,)로 구분', style: Get.textTheme.caption),
                      ],
                    ),
                  ),
                  settingRow(
                    label: buildLabel('사이즈 상세'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildInputString(
                          controller: sizeDetailListTC,
                          maxLine: 15,
                        ),
                        Text('종류명|부위1,부위2,부위3 형식으로 입력 - enter 로 구분', style: Get.textTheme.caption),
                      ],
                    ),
                  ),
                  settingRow(
                    label: buildLabel('PC 상세'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildInputString(
                            controller: detailPCDescTC, maxLine: 10),
                        Text(
                            '치환자: {{brand_image}} / {{detail_loop_start}}...{{detail_image}}...{{detail_loop_end}}',
                            style: Get.textTheme.caption),
                      ],
                    ),
                  ),
                  settingRow(
                    label: buildLabel('Mobile 상세'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildInputString(
                            controller: detailMobileDescTC, maxLine: 10),
                        Text(
                            '치환자: {{brand_image}} / {{detail_loop_start}}...{{detail_image}}...{{detail_loop_end}}',
                            style: Get.textTheme.caption),
                      ],
                    ),
                  ),
                  const Divider(height: 80, thickness: 0.2),
                  settingRow(
                    label: buildLabel(''),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '"카테고리 이름$categorySeparator번호" 형식 / 카테고리 수정, 추가 시 입력 후 Enter',
                          style: Get.textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  GetBuilder<CategoryController>(
                    builder: (ctlCate) => settingRow(
                      label: buildLabel('카테고리'),
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // # 분류1
                          Flexible(
                            child: Column(
                              children: [
                                ...List.generate(
                                  ctlCate.cateFirstList.length,
                                  (index) {
                                    var item = ctlCate.cateFirstList[index];
                                    var isSelected =
                                        item == ctlCate.selectedCategory.first;
                                    return Row(
                                      children: [
                                        buildCateRemoveBtn(
                                            CategoryType.first, item),
                                        Expanded(
                                          child: buildInputString(
                                            value: item,
                                            onTab: () => ctlCate.selectCategory(
                                              first: item,
                                              second: '',
                                              third: '',
                                            ),
                                            onSubmitted: (value) =>
                                                ctlCate.modifyCate(
                                              CategoryType.first,
                                              item,
                                              value,
                                            ),
                                            selected: isSelected,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                buildCateAddRow(CategoryType.first, '분류1 추가'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // # 분류2
                          Flexible(
                            child: Column(
                              children: [
                                ...List.generate(
                                  ctlCate.cateSecondList.length,
                                  (index) {
                                    var item = ctlCate.cateSecondList[index];
                                    var isSelected =
                                        item == ctlCate.selectedCategory.second;
                                    return Row(
                                      children: [
                                        buildCateRemoveBtn(
                                            CategoryType.second, item),
                                        Expanded(
                                          child: buildInputString(
                                            value: item,
                                            onTab: () => ctlCate.selectCategory(
                                              first: ctlCate
                                                  .selectedCategory.first,
                                              second: item,
                                              third: '',
                                            ),
                                            onSubmitted: (value) =>
                                                ctlCate.modifyCate(
                                              CategoryType.second,
                                              item,
                                              value,
                                            ),
                                            selected: isSelected,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Offstage(
                                  offstage:
                                      ctlCate.selectedCategory.first.isEmpty,
                                  child: buildCateAddRow(
                                      CategoryType.second, '분류2 추가'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // # 분류3
                          Flexible(
                            child: Column(
                              children: [
                                ...List.generate(
                                  ctlCate.cateThirdList.length,
                                  (index) {
                                    var item = ctlCate.cateThirdList[index];
                                    var isSelected =
                                        item == ctlCate.selectedCategory.third;
                                    return Row(
                                      children: [
                                        buildCateRemoveBtn(
                                            CategoryType.third, item),
                                        Expanded(
                                          child: buildInputString(
                                            value: item,
                                            onTab: () => ctlCate.selectCategory(
                                              first: ctlCate
                                                  .selectedCategory.first,
                                              second: ctlCate
                                                  .selectedCategory.second,
                                              third: item,
                                              fourth: '',
                                            ),
                                            onSubmitted: (value) =>
                                                ctlCate.modifyCate(
                                              CategoryType.third,
                                              item,
                                              value,
                                            ),
                                            selected: isSelected,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Offstage(
                                  offstage: ctlCate
                                          .selectedCategory.first.isEmpty ||
                                      ctlCate.selectedCategory.second.isEmpty,
                                  child: buildCateAddRow(
                                      CategoryType.third, '분류3 추가'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // # 분류4
                          Flexible(
                            child: Column(
                              children: [
                                ...List.generate(
                                  ctlCate.cateFourthList.length,
                                  (index) {
                                    var item = ctlCate.cateFourthList[index];
                                    return Row(
                                      children: [
                                        buildCateRemoveBtn(
                                            CategoryType.fourth, item),
                                        Expanded(
                                          child: buildInputString(
                                            value: item,
                                            onTab: () => ctlCate.selectCategory(
                                              first: ctlCate
                                                  .selectedCategory.first,
                                              second: ctlCate
                                                  .selectedCategory.second,
                                              third: ctlCate
                                                  .selectedCategory.third,
                                              fourth: item,
                                            ),
                                            onSubmitted: (value) =>
                                                ctlCate.modifyCate(
                                              CategoryType.fourth,
                                              item,
                                              value,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Offstage(
                                  offstage: ctlCate
                                          .selectedCategory.first.isEmpty ||
                                      ctlCate.selectedCategory.second.isEmpty ||
                                      ctlCate.selectedCategory.third.isEmpty,
                                  child: buildCateAddRow(
                                      CategoryType.fourth, '분류4 추가'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  ButtonBar(
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.back(canPop: true),
                        child: const Text('취소'),
                        style: ConstForm.btnStyleCancel,
                      ),
                      ElevatedButton(
                        style: ConstForm.btnStyleConfirm,
                        onPressed: () => ctl.updateSetting(
                          formDenseVal: formDenseVal,
                          formMaxWidthTC: formMaxWidthTC,
                          formLabelWidthTC: formLabelWidthTC,
                          imageExtensionTC: imageExtensionTC,
                          imageRepositoryUrlTC: imageRepositoryUrlTC,
                          naverTagTC: naverTagTC,
                          sizeRangeTC1: sizeRangeTC1,
                          sizeRangeTC2: sizeRangeTC2,
                          sizeDetailListTC: sizeDetailListTC,
                          materialListTC: materialListTC,
                          colorListTC: colorListTC,
                          brandListTC: brandListTC,
                          sizeListTC: sizeListTC,
                          detailPCDescTC: detailPCDescTC,
                          detailMobileDescTC: detailMobileDescTC,
                          brandFolderTC: brandFolderTC,
                        ),
                        child: const Text('저장'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCateRemoveBtn(CategoryType type, String item) {
    return IconButton(
      onPressed: () =>
          Get.find<CategoryController>().removeCategory(type, item),
      icon: const Icon(
        Icons.remove_circle_outline,
        color: Colors.red,
        size: 16,
      ),
    );
  }

  Widget settingRow({
    Widget? label,
    Widget? content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          label ?? const SizedBox.shrink(),
          Expanded(child: content ?? const SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget buildCateAddRow(CategoryType type, [String? hint]) {
    return Column(
      children: [
        const Divider(height: 40),
        buildInputString(
          value: '',
          hint: hint,
          onSubmitted: (value) =>
              Get.find<CategoryController>().addCategory(type, value),
        ),
      ],
    );
  }

  SizedBox buildLabel(String title, [double width = 120]) {
    return SizedBox(width: width, child: Text(title));
  }

  Widget buildInputNumber(TextEditingController textEditingController) {
    return TextField(
      style: const TextStyle(fontSize: 12),
      controller: textEditingController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: inputDecoration(),
    );
  }

  Widget buildInputString({
    String value = '',
    GestureTapCallback? onTab,
    bool selected = false,
    ValueChanged<String>? onChanged,
    TextEditingController? controller,
    ValueChanged<String>? onSubmitted,
    String? hint,
    int maxLine = 1,
  }) {
    var _controller = controller ?? TextEditingController();

    if (value.isNotEmpty) {
      _controller
        ..text = value
        ..selection = TextSelection.collapsed(offset: _controller.text.length);
    }

    return TextField(
      controller: _controller,
      maxLines: maxLine,
      keyboardType: maxLine == 1 ? TextInputType.text : TextInputType.multiline,
      style: TextStyle(
        fontSize: 12,
        color: selected ? Colors.white : null,
      ),
      cursorColor: selected ? Colors.white : null,
      decoration: inputDecoration(selected: selected, hint: hint),
      onTap: onTab,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.none,
    );
  }

  InputDecoration inputDecoration({bool selected = false, String? hint}) =>
      InputDecoration(
        filled: true,
        fillColor:
            selected ? Get.theme.primaryColor.withOpacity(1.0) : Colors.white,
        hoverColor: Colors.transparent,
        hintText: hint,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Get.theme.primaryColor,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        ),
      );
}
