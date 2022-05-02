import 'package:athanasia/constants/const_form.dart';
import 'package:athanasia/controllers/category_controller.dart';
import 'package:athanasia/controllers/excel_controller.dart';
import 'package:athanasia/controllers/form_controller.dart';
import 'package:athanasia/controllers/product_controller.dart';
import 'package:athanasia/controllers/setting_controller.dart';
import 'package:athanasia/views/excel_preview.dart';
import 'package:athanasia/views/insert_form.dart';
import 'package:athanasia/views/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final tableHScrollController = ScrollController();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.to(() => const Setting(),
              binding: BindingsBuilder.put(() => CategoryController())),
          icon: const Icon(Icons.settings),
        ),
        actions: [
          /*TextButton.icon(
            label: const Text('초기화', style: TextStyle(color: Colors.white)),
            onPressed: () => Get.find<SettingController>().resetStorage(),
            icon: const Icon(Icons.warning, color: Colors.white),
          ),*/
          TextButton.icon(
            label: const Text('미리보기', style: TextStyle(color: Colors.white)),
            onPressed: () => Get.to(() => ExcelPreview()),
            icon: const Icon(Icons.preview, color: Colors.white),
          ),
          TextButton.icon(
            label: const Text('파일', style: TextStyle(color: Colors.white)),
            onPressed: () => Get.find<ExcelController>().save(),
            icon: const Icon(Icons.download, color: Colors.white),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('등록'),
        onPressed: () => Get.to(
          () => InsertForm(),
          binding: BindingsBuilder(() {
            Get.put(CategoryController());
            Get.put(FormController());
          }),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
          bottom: 40,
        ),
        child: GetBuilder<ProductController>(
          builder: (ctl) => Scrollbar(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('version : ${SettingController.version}',
                          style: Get.textTheme.caption),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: () => ctl.removeAll(),
                          icon: const Icon(Icons.refresh),
                          label: const Text('전체삭제'),
                        ),
                        const SizedBox(width: 40),
                        Text('총 : ${ctl.productList.length}개'),
                      ],
                    ),
                  ),
                  Scrollbar(
                    controller: tableHScrollController,
                    child: SingleChildScrollView(
                      controller: tableHScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        defaultColumnWidth: const IntrinsicColumnWidth(),
                        border: TableBorder.all(
                          color: Colors.grey,
                          //style: BorderStyle.solid,
                          width: 0.5,
                        ),
                        children: <TableRow>[
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                            ),
                            children: <Widget>[
                              buildTableHeader(title: ''),
                              buildTableHeader(title: '복사'),
                              buildTableHeader(title: '수정'),
                              buildTableHeader(title: '삭제'),
                              buildTableHeader(title: '상품명'),
                              buildTableHeader(title: '판매가'),
                              buildTableHeader(title: '정가'),
                              buildTableHeader(title: '검색k'),
                              // buildTableHeader(title: 'PC 상세'),
                              // buildTableHeader(title: 'M 상세'),
                              buildTableHeader(title: '폴더명'),
                              buildTableHeader(title: '리스트 i'),
                              buildTableHeader(title: '상세 i'),
                              buildTableHeader(title: '상세 i 끝'),
                              buildTableHeader(title: '상세 s'),
                              buildTableHeader(title: '규격 s'),
                              buildTableHeader(title: '범위 s'),
                              buildTableHeader(title: '컬러'),
                              buildTableHeader(title: '브랜드'),
                              buildTableHeader(title: '카테고리'),
                              buildTableHeader(title: '소재'),
                            ],
                          ),
                          ...List.generate(
                            ctl.productList.length,
                            (index) {
                              var item = ctl.productList[index];
                              return TableRow(
                                children: <Widget>[
                                  buildTableCell(title: (index + 1).toString()),
                                  IconButton(
                                    onPressed: () => ctl.copyProduct(item),
                                    icon: const Icon(Icons.copy),
                                  ),
                                  IconButton(
                                    onPressed: () => ctl.modifyProduct(index),
                                    icon: const Icon(Icons.create),
                                  ),
                                  IconButton(
                                    onPressed: () => ctl.removeProduct(index),
                                    icon: const Icon(Icons.delete),
                                  ),
                                  buildTableCell(title: item.name),
                                  buildTableCell(
                                      title: ConstForm.priceFormat
                                          .format(item.sellingPrice)),
                                  buildTableCell(
                                      title: ConstForm.priceFormat
                                          .format(item.fixedPrice)),
                                  buildTableCell(title: item.searchKeyword),
                                  // buildTableCell(title: item.detailDescPC),
                                  // buildTableCell(title: item.detailDescMobile),
                                  buildTableCell(title: item.imageFolder),
                                  buildTableCell(title: item.listImageName),
                                  buildTableCell(
                                      title: item.listImageNameDetail),
                                  buildTableCell(
                                      title: item.listImageNameDetailLastNum
                                          .toString()),
                                  buildTableCell(
                                      title: item.sizeDetail.toString()),
                                  buildTableCell(title: item.size),
                                  buildTableCell(
                                      title: item.sizeRange?.toRangeStr ?? ''),
                                  buildTableCell(title: item.color),
                                  buildTableCell(title: item.brand.name),
                                  buildTableCell(
                                      title: item.category.toString()),
                                  buildTableCell(
                                      title: item.material
                                          .map((e) => e.toString())
                                          .join(' ')),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  ctl.productList.isEmpty
                      ? Container(
                          padding: const EdgeInsets.symmetric(vertical: 80),
                          child: const Center(
                            child: Text('목록이 없습니다.'),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTableHeader({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title),
    );
  }

  Widget buildTableCell({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title),
    );
  }
}
