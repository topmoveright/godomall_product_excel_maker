import 'dart:io';

import 'package:athanasia/constants/const_excel.dart';
import 'package:athanasia/controllers/product_controller.dart';
import 'package:athanasia/controllers/setting_controller.dart';
import 'package:athanasia/models/excel_data_row.dart';
import 'package:athanasia/models/product.dart';
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ExcelController extends GetxController {
  final productController = Get.find<ProductController>();
  final settingController = Get.find<SettingController>();

  List<Product> get productList => productController.productList;

  List<String> header_1 = ConstExcel.csvHeader_1.split('\t');
  List<String> header_2 = ConstExcel.csvHeader_2.split('\t');
  List<String> header_3 = ConstExcel.csvHeader_3.split('\t');

  List<List<String>> get headerList => [header_1, header_2];

  List<String> get headerAlphabet {
    List<String> alphabets = [];
    for (int i = 65; i <= 90; i++) {
      alphabets.add(String.fromCharCode(i));
    }
    var alphabetsLength = alphabets.length;
    List<String> temp = [];
    for (var i = 0; i < header_1.length; i++) {
      var aaa = i ~/ alphabetsLength;
      var bbb = i % alphabetsLength;
      var ccc =
          aaa > 0 ? '${alphabets[aaa - 1]}${alphabets[bbb]}' : alphabets[i];
      temp.add(ccc);
    }
    return temp;
  }

  String get _makeFileName {
    var strNow = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    return 'products_$strNow';
  }

  List<String> makeDataRow(Product product) {
    // auto... 자동생성값

    String _autoShortDesc(Product product) {
      String rangeContent = product.sizeRange?.toRangeStr ?? '';
      return 'SIZE ${product.size} ${rangeContent.isNotEmpty ? '$rangeContent인치' : ''}';
    }

    String _autoGoodsMustInfo(Product product) {
      var sizeDetailContent = product.sizeDetail.toString();
      var shortDesc = _autoShortDesc(product);
      return '''권장사이즈^|^$shortDesc^|^실측사이즈^|^$sizeDetailContent
컬러^|^${product.color}^|^소재^|^${product.material.map((e) => e.toString()).join(' ')}''';
    }

    String _autoImageName(Product product) {
      var tempName =
          '${settingController.imageRepositoryUrl}${product.imageFolder}${product.listImageName}';
      var extension = settingController.imageExtension;

      return '''detail^|^${tempName}_detail.$extension
list^|^${tempName}_list.$extension
main^|^${tempName}_main.$extension''';
    }

    String _autoGoodsDesc(Product product, [String type = 'pc']) {
      var tempPC = type == 'pc'
          ? settingController.detailPCDesc
          : settingController.detailMobileDesc;
      var replacedBrandTemp =
          tempPC.replaceAll('{{brand_image}}', '${settingController.imageRepositoryUrl}${settingController.brandFolder}${product.brand.filename}');

      var tempLoop = replacedBrandTemp
          .split('{{detail_loop_start}}')
          .last
          .split('{{detail_loop_end}}')
          .first;

      var detailList =
          List.generate(product.listImageNameDetailLastNum, (index) {
        var imageUrl =
            '${settingController.imageRepositoryUrl}${product.imageFolder}${product.listImageNameDetail}${index + 1}.${settingController.imageExtension}';
        return tempLoop.replaceFirst('{{detail_image}}', imageUrl).trim();
      });

      var replacedDesc = [
        replacedBrandTemp.split('{{detail_loop_start}}').first.trim(),
        detailList.join('\n'),
        replacedBrandTemp.split('{{detail_loop_end}}').last.trim(),
      ].join('\n');

      return replacedDesc;
    }

    var excelData = ExcelDataRow(
      goods_name: product.name,
      search_word: product.searchKeyword,
      category_code: product.category.toExcelData(),
      goods_must_info: _autoGoodsMustInfo(product),
      goods_price: product.sellingPrice.toString(),
      fixed_price: product.fixedPrice.toString(),
      image_storage: settingController.imageRepositoryUrl,
      image_name: _autoImageName(product),
      short_desc: _autoShortDesc(product),
      goods_desc_pc: _autoGoodsDesc(product, 'pc'),
      goods_desc_mobile: _autoGoodsDesc(product, 'mobile'),
      naver_tag: product.naverTag,
    ).toJson();

    assert(header_1.length == excelData.length, 'header 와 data 의 크기 불일치');

    return excelData.values.toList();
  }

  void save() async {
    var excel = Excel.createExcel();
    var fileName = _makeFileName;
    var sheetObject = excel[fileName];
    excel.delete('Sheet1');

    var _headerList = [header_1, header_2, header_3];
    for (var e in _headerList) {
      sheetObject.appendRow(e);
    }

    for (var p in productController.productList) {
      sheetObject.appendRow(makeDataRow(p));
    }

    CellStyle cellStyle =
        CellStyle(textWrapping: TextWrapping.WrapText); // 줄바꿈 설정

    var maxCols = sheetObject.maxCols;
    var maxRows = sheetObject.maxRows;
    for (var c = 0; c < maxCols; c++) {
      for (var r = _headerList.length; r < maxRows; r++) {
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: c, rowIndex: r))
            .cellStyle = cellStyle;
      }
    }

    var fileBytes = excel.save();
    var directoryDownload = await getDownloadsDirectory();
    var directoryDocument = await getApplicationDocumentsDirectory();

    var savePath = (directoryDownload ?? directoryDocument).path;

    File("$savePath/$fileName.xlsx")
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
    OpenFile.open('$savePath\\');
  }
}
