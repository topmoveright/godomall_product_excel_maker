import 'package:athanasia/models/brand.dart';
import 'package:athanasia/models/category.dart';
import 'package:athanasia/models/material.dart';
import 'package:athanasia/models/size_detail.dart';
import 'package:athanasia/models/size_range.dart';

class Product {
  final String name; // 상품명
  final int sellingPrice; // 판매가 - int
  final int fixedPrice; // 정가 - int (판매가 자동 등록)
  final String searchKeyword; // 검색 키워드
  final String listImageName; // 리스트 이미지명 - main, list, detail
  final String listImageNameDetail; // 상세페이지 이미지명
  final int listImageNameDetailLastNum; // 상세페이지 이미지 끝번호 ( XX_1, xx_2...)
  final Category category; // 분류 - dropdown
  final List<PMaterial> material; // 소재 - dropdown
  final String color; // 컬러 - dropdown
  final Brand brand; // 브랜드 - dropdown
  final String size; // 사이즈 - dropdown
  final SizeRange? sizeRange; // 사이즈 범위 - range slider
  final SizeDetail sizeDetail; // 상세사이즈
  final String imageFolder; // 이미지 폴더명
  final String naverTag; // 네이버 태그

  Product({
    required this.name,
    required this.sellingPrice,
    required this.fixedPrice,
    required this.searchKeyword,
    required this.listImageName,
    required this.listImageNameDetail,
    required this.listImageNameDetailLastNum,
    required this.category,
    required this.material,
    required this.color,
    required this.brand,
    required this.size,
    required this.sizeRange,
    required this.sizeDetail,
    required this.imageFolder,
    required this.naverTag,
  });
}
