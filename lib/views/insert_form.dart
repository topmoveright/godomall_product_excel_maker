import 'package:athanasia/constants/const_form.dart';
import 'package:athanasia/controllers/category_controller.dart';
import 'package:athanasia/controllers/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InsertForm extends GetView<FormController> {
  InsertForm({Key? key}) : super(key: key);

  final FocusNode _focusNode = FocusNode();
  final GlobalKey _autocompleteKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(controller.isModify ? '상품 수정' : '상품 등록'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: controller.formMaxWidth.toDouble(),
            ),
            child: GetBuilder<FormController>(
                builder: (ctl) => Column(
                      children: [
                        const SizedBox(height: 40),
                        formRow(
                          label: buildLabel('상품명'),
                          content: buildInput(
                            textController: ctl.nameTC,
                            autofocus: true,
                            hintText: '상품명을 입력해 주세요.',
                          ),
                        ),
                        formRow(
                          label: buildLabel('가격'),
                          content: Row(
                            children: [
                              buildLabel('판매가', 60),
                              Flexible(
                                flex: 1,
                                child: buildInput(
                                  textController: ctl.sellingPriceTC,
                                  keyboardType: TextInputType.number,
                                  autoInputList: [ctl.fixedPriceTC],
                                  hintText: '10,000',
                                ),
                              ),
                              const SizedBox(width: 40),
                              buildLabel('정가', 60),
                              Flexible(
                                flex: 1,
                                child: buildInput(
                                  textController: ctl.fixedPriceTC,
                                  keyboardType: TextInputType.number,
                                  hintText: '10,000',
                                ),
                              ),
                            ],
                          ),
                        ),
                        formRow(
                          label: buildLabel('검색키워드'),
                          content: buildInput(
                            textController: ctl.searchKeywordTC,
                            hintText: '검색 키워드를 입력해 주세요.',
                          ),
                        ),
                        formRow(
                          label: buildLabel('폴더명'),
                          content: buildInput(
                            textController: ctl.imageFolderTC,
                            hintText: '/folder/',
                          ),
                        ),
                        formRow(
                          label: buildLabel('리스트 이미지명'),
                          content: buildInput(
                            textController: ctl.listImageNameTC,
                            hintText: 'list_image(확장자 제외)',
                          ),
                        ),
                        formRow(
                          label: buildLabel('상세 이미지'),
                          content: Row(
                            children: [
                              buildLabel('이미지명', 60),
                              Expanded(
                                child: buildInput(
                                    textController: ctl.listImageNameDetailTC,
                                    hintText: 'detail_image(확장자 제외)'),
                              ),
                              const SizedBox(width: 40),
                              buildLabel('마지막\n번호', 60),
                              SizedBox(
                                width: 100,
                                child: buildInput(
                                  textController:
                                      ctl.listImageNameDetailLastNumTC,
                                  keyboardType: TextInputType.number,
                                  numberWithCommas: false,
                                  hintText: '4',
                                ),
                              ),
                            ],
                          ),
                        ),
                        formRow(
                          label: buildLabel('사이즈 상세'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  buildLabel('종류', 60),
                                  buildDropdown(
                                    list: controller.sizeDetailList,
                                    onChanged: (value) =>
                                        ctl.selectSizeType(value),
                                    value: ctl.sizeDetailType.type,
                                  ),
                                  const SizedBox(width: 40),
                                  buildLabel('값', 60),
                                  Expanded(
                                    child: buildInput(
                                        textController: ctl.sizeDetailTC,
                                        hintText: '종류 선택 후 순서대로 입력해 주세요.'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(ctl.sizeDetailType.toStrDetailList(),
                                  style: Get.textTheme.caption),
                            ],
                          ),
                        ),
                        formRow(
                          label: buildLabel('사이즈'),
                          content: Row(
                            children: [
                              buildLabel('규격', 60),
                              buildDropdown(
                                list: controller.sizeList,
                                value: ctl.sizeDR,
                                onChanged: (value) {
                                  ctl.sizeDR = value ?? '';
                                  ctl.update();
                                },
                              ),
                              const SizedBox(width: 40),
                              buildLabel('범위', 60),
                              buildRange(
                                rangeValues: ctl.sizeRange.toRangeValue,
                                onChanged: (values) =>
                                    ctl.selectSizeRange(values),
                              ),
                            ],
                          ),
                        ),
                        formRow(
                          label: buildLabel(''),
                          content: Row(
                            children: [
                              buildLabel('컬러', 60),
                              buildDropdown(
                                list: controller.colorList,
                                value: ctl.colorDR,
                                onChanged: (value) {
                                  ctl.colorDR = value ?? '';
                                  ctl.update();
                                },
                              ),
                              const SizedBox(width: 40),
                              buildLabel('브랜드', 60),
                              Expanded(
                                child: RawAutocomplete<String>(
                                  fieldViewBuilder: (context,
                                          textEditingController,
                                          focusNode,
                                          onFieldSubmitted) =>
                                      buildInput(
                                    textController: textEditingController,
                                    focusNode: focusNode,
                                  ),
                                  key: _autocompleteKey,
                                  focusNode: _focusNode,
                                  textEditingController: ctl.brandTC,
                                  optionsBuilder: controller.optionsBuilder,
                                  optionsViewBuilder: (
                                    BuildContext context,
                                    AutocompleteOnSelected<String> onSelected,
                                    Iterable<String> options,
                                  ) =>
                                      Material(
                                    color: Colors.white.withOpacity(0.9),
                                    elevation: 4.0,
                                    child: ListView(
                                      children: options
                                          .map((String option) =>
                                              GestureDetector(
                                                onTap: () {
                                                  onSelected(option);
                                                  ctl.update();
                                                },
                                                child: ListTile(
                                                    title: Text(option)),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        formRow(
                          label: buildLabel('카테고리'),
                          content: GetBuilder<CategoryController>(
                            builder: (ctlCate) => Row(
                              children: [
                                Wrap(
                                  spacing: 40,
                                  children: [
                                    Offstage(
                                      offstage: ctlCate.cateFirstList.isEmpty,
                                      child: buildDropdown(
                                        list: ctlCate.cateFirstListOnlyName,
                                        value: ctlCate.selectedCategory
                                            .onlyName()
                                            .first,
                                        onChanged: (value) =>
                                            ctl.selectCateFirst(value),
                                      ),
                                    ),
                                    ctlCate.selectedCategory.first.isEmpty
                                        ? const SizedBox.shrink()
                                        : buildDropdown(
                                            list:
                                                ctlCate.cateSecondListOnlyName,
                                            value: ctlCate.selectedCategory
                                                .onlyName()
                                                .second,
                                            onChanged: (value) =>
                                                ctl.selectCateSecond(value),
                                          ),
                                    ctlCate.selectedCategory.first.isEmpty ||
                                            ctlCate
                                                .selectedCategory.second.isEmpty
                                        ? const SizedBox.shrink()
                                        : buildDropdown(
                                            list: ctlCate.cateThirdListOnlyName,
                                            value: ctlCate.selectedCategory
                                                .onlyName()
                                                .third,
                                            onChanged: (value) =>
                                                ctl.selectCateThird(value),
                                          ),
                                    ctlCate.selectedCategory.first.isEmpty ||
                                            ctlCate.selectedCategory.second
                                                .isEmpty ||
                                            ctlCate
                                                .selectedCategory.third.isEmpty
                                        ? const SizedBox.shrink()
                                        : buildDropdown(
                                            list:
                                                ctlCate.cateFourthListOnlyName,
                                            value: ctlCate.selectedCategory
                                                .onlyName()
                                                .fourth,
                                            onChanged: (value) =>
                                                ctl.selectCateFourth(value),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        formRow(
                          label: buildLabel('소재'),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  TextButton.icon(
                                    label: const Text(
                                      '소재추가',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    onPressed: () => ctl.addMaterial(),
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      size: 16,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                  ),
                                ],
                              ),
                              ...List.generate(
                                ctl.materialListDR.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                    child: Row(
                                      children: [
                                        buildLabel('소재', 60),
                                        buildDropdown(
                                          list: controller.materialList,
                                          value: ctl.materialListDR[index],
                                          onChanged: (value) {
                                            ctl.materialListDR[index] =
                                                value ?? '';
                                            ctl.update();
                                          },
                                        ),
                                        const SizedBox(width: 40),
                                        buildLabel('함유량\n(%)', 60),
                                        SizedBox(
                                          width: 100,
                                          height:
                                              controller.formDense ? 24 : null,
                                          child: buildInput(
                                            textController:
                                                ctl.materialListTC[index],
                                            keyboardType: TextInputType.number,
                                            numberWithCommas: false,
                                            hintText: '10',
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        index > 0
                                            ? IconButton(
                                                onPressed: () =>
                                                    ctl.removeMaterial(index),
                                                icon: const Icon(
                                                  Icons.remove_circle_outline,
                                                  color: Colors.red,
                                                  size: 16,
                                                ),
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                              )
                                            : const SizedBox.shrink(),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        ButtonBar(
                          children: [
                            ElevatedButton(
                              style: ConstForm.btnStyleCancel,
                              onPressed: () => Get.back(),
                              child: const Text('취소'),
                            ),
                            ElevatedButton(
                              style: ConstForm.btnStyleConfirm,
                              onPressed: () => ctl.submitAction(),
                              child: const Text('등록'),
                            ),
                          ],
                        ),
                      ],
                    )),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown({
    required List<String> list,
    required ValueChanged<String?>? onChanged,
    required String value,
    bool addBlankVal = true,
  }) {
    var notContainedValue = value.isNotEmpty && !list.any((e) => e == value);

    return list.isEmpty
        ? const SizedBox.shrink()
        : Container(
            color:
                notContainedValue ? Colors.red.withOpacity(0.2) : Colors.white,
            child: DropdownButton<String>(
              dropdownColor: Colors.white,
              focusColor: Colors.transparent,
              underline: const SizedBox.shrink(),
              isDense: controller.formDense,
              value: notContainedValue ? list.first : value,
              onChanged: onChanged,
              items: (addBlankVal ? ['', ...list] : list).map((String value) {
                return DropdownMenuItem(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(value),
                    ));
              }).toList(),
            ),
          );
  }

  Widget buildInput({
    required TextEditingController textController,
    TextInputType keyboardType = TextInputType.text,
    List<TextEditingController> autoInputList = const [],
    bool autofocus = false,
    bool numberWithCommas = true,
    FocusNode? focusNode,
    String? hintText,
  }) {
    final isNumber = keyboardType == TextInputType.number;

    return Stack(
      children: [
        TextField(
          focusNode: focusNode,
          autofocus: autofocus,
          textInputAction: TextInputAction.next,
          textAlignVertical:
              controller.formDense ? null : TextAlignVertical.top,
          decoration: inputDecoration(hintText: hintText),
          controller: textController,
          keyboardType: keyboardType,
          inputFormatters:
              isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
          onChanged: (value) {
            if (isNumber) {
              var number = '';
              if (value.isNotEmpty) {
                try {
                  number = numberWithCommas
                      ? ConstForm.priceFormat.format(int.parse(value))
                      : int.parse(value).toString();
                } catch (e) {
                  number = '너무 비싼거 아닌가요...';
                }
                textController
                  ..text = number
                  ..selection = TextSelection.collapsed(
                      offset: textController.text.length);
              }
              if (autoInputList.isNotEmpty) {
                for (var cnt in autoInputList) {
                  cnt.text = number;
                }
              }
            }
            Get.find<FormController>().update();
          },
        ),
        IgnorePointer(
          ignoring: textController.text.isEmpty,
          child: Align(
            alignment: Alignment.centerRight,
            child: Opacity(
              opacity: textController.text.isEmpty ? 0 : 1,
              child: IconButton(
                alignment: controller.formDense
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                hoverColor: Colors.transparent,
                padding: EdgeInsets.only(bottom: controller.formDense ? 0 : 4),
                visualDensity:
                    controller.formDense ? VisualDensity.compact : null,
                focusNode: FocusNode(skipTraversal: true),
                onPressed: () {
                  textController.text = '';
                  Get.find<FormController>().update();
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.black12,
                  size: controller.formDense ? 16 : 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRange({
    required RangeValues rangeValues,
    required ValueChanged<RangeValues>? onChanged,
    bool skipFocusTraversal = false,
  }) {
    return Row(
      children: [
        Checkbox(
          value: controller.enableSizeRange,
          onChanged: (value) {
            controller.enableSizeRange = value ?? false;
            controller.update();
          },
        ),
        const SizedBox(width: 16),
        Text(rangeValues.start.toInt().toString()),
        SizedBox(
          height: controller.formDense ? 24 : null,
          width: 300,
          child: RangeSlider(
            onChanged: controller.enableSizeRange ? onChanged : null,
            values: rangeValues,
            min: controller.min,
            max: controller.max,
            divisions: controller.max.toInt() - controller.min.toInt(),
            labels: RangeLabels(
              rangeValues.start.toInt().toString(),
              rangeValues.end.toInt().toString(),
            ),
          ),
        ),
        Text(rangeValues.end.toInt().toString()),
      ],
    );
  }

  SizedBox buildLabel(String title, [double? width]) {
    return SizedBox(
        width: width ?? controller.labelWidth,
        child: Text(title, style: const TextStyle(fontSize: 12)));
  }

  Widget formRow({
    Widget? label,
    Widget? content,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            children: [
              label ?? const SizedBox.shrink(),
              Expanded(child: content ?? const SizedBox.shrink()),
            ],
          ),
        ),
        const Divider(thickness: 0.4),
      ],
    );
  }

  InputDecoration inputDecoration({String? hintText}) => InputDecoration(
        hintText: hintText,
        hintStyle:
            const TextStyle(color: Colors.black26, fontStyle: FontStyle.italic),
        isDense: controller.formDense,
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2,
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
