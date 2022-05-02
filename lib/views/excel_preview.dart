import 'package:athanasia/controllers/excel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExcelPreview extends StatelessWidget {
  ExcelPreview({Key? key}) : super(key: key);

  final tableHScrollController = ScrollController();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            label: const Text('파일', style: TextStyle(color: Colors.white)),
            onPressed: () => Get.find<ExcelController>().save(),
            icon: const Icon(Icons.download, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: GetBuilder<ExcelController>(
          builder: (ctl) => Scrollbar(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('총 : ${ctl.productList.length}개')],
                    ),
                  ),
                  Scrollbar(
                    controller: tableHScrollController,
                    child: SingleChildScrollView(
                      controller: tableHScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.top,
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
                            children: [
                              buildTableHeader(title: ''),
                              ...List.generate(
                                ctl.header_1.length,
                                (index) => buildTableHeader(
                                    title: ctl.headerAlphabet[index]),
                              ),
                            ],
                          ),
                          ...List.generate(
                            ctl.headerList.length,
                            (index_1) => TableRow(
                              decoration:
                                  BoxDecoration(color: Colors.grey[100]),
                              children: [
                                buildTableHeader(title: (index_1 + 1).toString()),
                                ...List.generate(
                                  ctl.headerList[index_1].length,
                                  (index_2) => buildTableHeader(
                                      title: ctl.headerList[index_1][index_2]),
                                ),
                              ],
                            ),
                          ),
                          ...List.generate(
                            ctl.productList.length,
                            (index) {
                              var row = ctl.makeDataRow(ctl.productList[index]);
                              return TableRow(
                                children: [
                                  buildTableHeader(
                                      title: (index + 1 + ctl.headerList.length).toString()),
                                  ...List.generate(
                                      row.length,
                                      (index) =>
                                          buildTableCell(title: row[index])),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*ctl.productList.isEmpty
                        ? Container(
                            padding: const EdgeInsets.symmetric(vertical: 80),
                            child: const Center(
                              child: Text('목록이 없습니다.'),
                            ),
                          )
                        : const SizedBox.shrink(),*/
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
