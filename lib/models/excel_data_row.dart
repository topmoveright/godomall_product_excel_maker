class ExcelDataRow {
  final String goods_no;
  final String goods_name;
  final String commission;
  final String goods_cd;
  final String name_main;
  final String name_list;
  final String name_detail;
  final String name_partner;
  final String global_data_2_goodsnm;
  final String global_data_3_goodsnm;
  final String global_data_4_goodsnm;
  final String search_word;
  final String goods_open_dt;
  final String goods_state;
  final String goods_color;
  final String pay_limit_fl;
  final String pay_limit;
  final String model_no;
  final String category_code;
  final String purchase_goods_name;
  final String brand_code;
  final String maker_name;
  final String origin_name;
  final String make_date;
  final String launch_date;
  final String effective_start_ymd;
  final String effective_end_ymd;
  final String goods_permission;
  final String goods_permission_group;
  final String goods_permission_price_string_fl;
  final String goods_permission_price_string;
  final String only_adult_fl;
  final String only_adult_display_fl;
  final String only_adult_image_fl;
  final String goods_access;
  final String goods_access_group;
  final String goods_access_display_fl;
  final String add_info;
  final String goods_must_info;
  final String kcmark_fl;
  final String kcmark_div_fl;
  final String kcmark_no;
  final String kcmark_dt;
  final String icon_start;
  final String icon_end;
  final String icon_period;
  final String icon_code;
  final String weight;
  final String volume;
  final String stock_type;
  final String mileage_type;
  final String mileage_group;
  final String mileage_group_info;
  final String mileage_goods;
  final String mileage_goods_unit;
  final String goods_discount_fl;
  final String goods_discount;
  final String goods_discount_unit;
  final String fixed_sales;
  final String sales_unit;
  final String soldout_yn;
  final String tax_free_type;
  final String tax_percent;
  final String display_pc_yn;
  final String display_mobile_yn;
  final String sell_pc_yn;
  final String sell_mobile_yn;
  final String deliverySno;
  final String goods_price_string;
  final String fixed_cnt;
  final String min_cnt;
  final String max_cnt;
  final String sales_start_ymd;
  final String sales_end_ymd;
  final String culture_benefit_fl;
  final String external_video_fl;
  final String external_video_url;
  final String external_video_width;
  final String external_video_height;
  final String goods_price;
  final String fixed_price;
  final String cost_price;
  final String option_yn;
  final String option_display;
  final String option_name;
  final String option_value;
  final String option_image;
  final String option_cost_price;
  final String option_price;
  final String stock_cnt;
  final String option_view_fl;
  final String option_sell_fl;
  final String option_delivery_fl;
  final String option_code;
  final String option_memo;
  final String text_option_yn;
  final String text_option;
  final String relation_yn;
  final String relation_same_fl;
  final String relation_code;
  final String relation_goods_date;
  final String relation_goods_each;
  final String add_goods_fl;
  final String add_goods;
  final String imgDetail_view_fl;
  final String image_storage;
  final String image_path;
  final String image_name;
  final String short_desc;
  final String global_data_2_short_description;
  final String global_data_3_short_description;
  final String global_data_4_short_description;
  final String event_description;
  final String goods_desc_pc;
  final String goods_desc_mobile;
  final String goods_desc_same_flag;
  final String daum_flag;
  final String naver_flag;
  final String naver_import_flag;
  final String naver_product_flag;
  final String naver_age_group;
  final String naver_gender;
  final String naver_tag;
  final String naver_attribute;
  final String naver_category;
  final String naver_product_id;
  final String detail_delivery_fl;
  final String detail_delivery;
  final String detail_as_fl;
  final String detail_as;
  final String detail_refund_fl;
  final String detail_refund;
  final String detail_exchange_fl;
  final String detail_exchange;
  final String memo;
  final String hscode;
  final String seo_tag_fl;
  final String set_tag_title;
  final String set_tag_author;
  final String set_tag_description;
  final String set_tag_keyword;
  final String fb_vn;
  final String fb_image_name;

  ExcelDataRow({
    required this.goods_name,
    required this.search_word,
    required this.category_code,
    required this.goods_must_info,
    required this.goods_price,
    required this.fixed_price,
    required this.image_storage,
    required this.image_name,
    required this.short_desc,
    required this.goods_desc_pc,
    required this.goods_desc_mobile,
    required this.naver_tag,
    this.goods_no = '',
    this.commission = '0',
    this.goods_cd = '',
    this.name_main = '',
    this.name_list = '',
    this.name_detail = '',
    this.name_partner = '',
    this.global_data_2_goodsnm = '',
    this.global_data_3_goodsnm = '',
    this.global_data_4_goodsnm = '',
    this.goods_open_dt = '0000-00-00 00:00:00',
    this.goods_state = 'u',
    this.goods_color = '',
    this.pay_limit_fl = 'n',
    this.pay_limit = '',
    this.model_no = '',
    this.purchase_goods_name = '',
    this.brand_code = '',
    this.maker_name = '',
    this.origin_name = '',
    this.make_date = '0000-00-00',
    this.launch_date = '0000-00-00',
    this.effective_start_ymd = '0000-00-00 00:00:00',
    this.effective_end_ymd = '0000-00-00 00:00:00',
    this.goods_permission = 'all',
    this.goods_permission_group = '',
    this.goods_permission_price_string_fl = 'n',
    this.goods_permission_price_string = '',
    this.only_adult_fl = 'n',
    this.only_adult_display_fl = 'y',
    this.only_adult_image_fl = 'n',
    this.goods_access = 'all',
    this.goods_access_group = '',
    this.goods_access_display_fl = 'y',
    this.add_info = '',
    this.kcmark_fl = 'n',
    this.kcmark_div_fl = '',
    this.kcmark_no = '',
    this.kcmark_dt = '',
    this.icon_start = '',
    this.icon_end = '',
    this.icon_period = '',
    this.icon_code = '',
    this.weight = '0',
    this.volume = '0',
    this.stock_type = 'y',
    this.mileage_type = 'c',
    this.mileage_group = 'all',
    this.mileage_group_info = '',
    this.mileage_goods = '',
    this.mileage_goods_unit = '',
    this.goods_discount_fl = 'n',
    this.goods_discount = '0',
    this.goods_discount_unit = 'percent',
    this.fixed_sales = 'option',
    this.sales_unit = '1',
    this.soldout_yn = 'n',
    this.tax_free_type = 't',
    this.tax_percent = '10',
    this.display_pc_yn = 'n',
    this.display_mobile_yn = 'n',
    this.sell_pc_yn = 'y',
    this.sell_mobile_yn = 'y',
    this.deliverySno = '2',
    this.goods_price_string = '',
    this.fixed_cnt = 'option',
    this.min_cnt = '1',
    this.max_cnt = '0',
    this.sales_start_ymd = '0000-00-00 00:00:00',
    this.sales_end_ymd = '0000-00-00 00:00:00',
    this.culture_benefit_fl = 'n',
    this.external_video_fl = 'n',
    this.external_video_url = '',
    this.external_video_width = '0',
    this.external_video_height = '0',
    this.cost_price = '0',
    this.option_yn = 'n',
    this.option_display = 's',
    this.option_name = '',
    this.option_value = '',
    this.option_image = '',
    this.option_cost_price = '',
    this.option_price = '',
    this.stock_cnt = '1',
    this.option_view_fl = '',
    this.option_sell_fl = '',
    this.option_delivery_fl = '',
    this.option_code = '',
    this.option_memo = '',
    this.text_option_yn = 'n',
    this.text_option = '',
    this.relation_yn = 'a',
    this.relation_same_fl = 'n',
    this.relation_code = '',
    this.relation_goods_date = '',
    this.relation_goods_each = '',
    this.add_goods_fl = 'n',
    this.add_goods = '',
    this.imgDetail_view_fl = 'n',
    this.image_path = '',
    this.global_data_2_short_description = '',
    this.global_data_3_short_description = '',
    this.global_data_4_short_description = '',
    this.event_description = '',
    this.goods_desc_same_flag = 'y',
    this.daum_flag = 'y',
    this.naver_flag = 'y',
    this.naver_import_flag = '',
    this.naver_product_flag = '',
    this.naver_age_group = 'a',
    this.naver_gender = '',
    this.naver_attribute = '',
    this.naver_category = '',
    this.naver_product_id = '',
    this.detail_delivery_fl = 'selection',
    this.detail_delivery = '002001',
    this.detail_as_fl = 'no',
    this.detail_as = '',
    this.detail_refund_fl = 'no',
    this.detail_refund = '',
    this.detail_exchange_fl = 'selection',
    this.detail_exchange = '005001',
    this.memo = '',
    this.hscode = '',
    this.seo_tag_fl = 'n',
    this.set_tag_title = '',
    this.set_tag_author = '',
    this.set_tag_description = '',
    this.set_tag_keyword = '',
    this.fb_vn = 'y',
    this.fb_image_name = '',
  });

  ExcelDataRow.fromJson(Map<String, dynamic> json)
      : goods_no = json['goods_no'],
        goods_name = json['goods_name'],
        commission = json['commission'],
        goods_cd = json['goods_cd'],
        name_main = json['name_main'],
        name_list = json['name_list'],
        name_detail = json['name_detail'],
        name_partner = json['name_partner'],
        global_data_2_goodsnm = json['global_data_2_goodsnm'],
        global_data_3_goodsnm = json['global_data_3_goodsnm'],
        global_data_4_goodsnm = json['global_data_4_goodsnm'],
        search_word = json['search_word'],
        goods_open_dt = json['goods_open_dt'],
        goods_state = json['goods_state'],
        goods_color = json['goods_color'],
        pay_limit_fl = json['pay_limit_fl'],
        pay_limit = json['pay_limit'],
        model_no = json['model_no'],
        category_code = json['category_code'],
        purchase_goods_name = json['purchase_goods_name'],
        brand_code = json['brand_code'],
        maker_name = json['maker_name'],
        origin_name = json['origin_name'],
        make_date = json['make_date'],
        launch_date = json['launch_date'],
        effective_start_ymd = json['effective_start_ymd'],
        effective_end_ymd = json['effective_end_ymd'],
        goods_permission = json['goods_permission'],
        goods_permission_group = json['goods_permission_group'],
        goods_permission_price_string_fl =
            json['goods_permission_price_string_fl'],
        goods_permission_price_string = json['goods_permission_price_string'],
        only_adult_fl = json['only_adult_fl'],
        only_adult_display_fl = json['only_adult_display_fl'],
        only_adult_image_fl = json['only_adult_image_fl'],
        goods_access = json['goods_access'],
        goods_access_group = json['goods_access_group'],
        goods_access_display_fl = json['goods_access_display_fl'],
        add_info = json['add_info'],
        goods_must_info = json['goods_must_info'],
        kcmark_fl = json['kcmark_fl'],
        kcmark_div_fl = json['kcmark_div_fl'],
        kcmark_no = json['kcmark_no'],
        kcmark_dt = json['kcmark_dt'],
        icon_start = json['icon_start'],
        icon_end = json['icon_end'],
        icon_period = json['icon_period'],
        icon_code = json['icon_code'],
        weight = json['weight'],
        volume = json['volume'],
        stock_type = json['stock_type'],
        mileage_type = json['mileage_type'],
        mileage_group = json['mileage_group'],
        mileage_group_info = json['mileage_group_info'],
        mileage_goods = json['mileage_goods'],
        mileage_goods_unit = json['mileage_goods_unit'],
        goods_discount_fl = json['goods_discount_fl'],
        goods_discount = json['goods_discount'],
        goods_discount_unit = json['goods_discount_unit'],
        fixed_sales = json['fixed_sales'],
        sales_unit = json['sales_unit'],
        soldout_yn = json['soldout_yn'],
        tax_free_type = json['tax_free_type'],
        tax_percent = json['tax_percent'],
        display_pc_yn = json['display_pc_yn'],
        display_mobile_yn = json['display_mobile_yn'],
        sell_pc_yn = json['sell_pc_yn'],
        sell_mobile_yn = json['sell_mobile_yn'],
        deliverySno = json['deliverySno'],
        goods_price_string = json['goods_price_string'],
        fixed_cnt = json['fixed_cnt'],
        min_cnt = json['min_cnt'],
        max_cnt = json['max_cnt'],
        sales_start_ymd = json['sales_start_ymd'],
        sales_end_ymd = json['sales_end_ymd'],
        culture_benefit_fl = json['culture_benefit_fl'],
        external_video_fl = json['external_video_fl'],
        external_video_url = json['external_video_url'],
        external_video_width = json['external_video_width'],
        external_video_height = json['external_video_height'],
        goods_price = json['goods_price'],
        fixed_price = json['fixed_price'],
        cost_price = json['cost_price'],
        option_yn = json['option_yn'],
        option_display = json['option_display'],
        option_name = json['option_name'],
        option_value = json['option_value'],
        option_image = json['option_image'],
        option_cost_price = json['option_cost_price'],
        option_price = json['option_price'],
        stock_cnt = json['stock_cnt'],
        option_view_fl = json['option_view_fl'],
        option_sell_fl = json['option_sell_fl'],
        option_delivery_fl = json['option_delivery_fl'],
        option_code = json['option_code'],
        option_memo = json['option_memo'],
        text_option_yn = json['text_option_yn'],
        text_option = json['text_option'],
        relation_yn = json['relation_yn'],
        relation_same_fl = json['relation_same_fl'],
        relation_code = json['relation_code'],
        relation_goods_date = json['relation_goods_date'],
        relation_goods_each = json['relation_goods_each'],
        add_goods_fl = json['add_goods_fl'],
        add_goods = json['add_goods'],
        imgDetail_view_fl = json['imgDetail_view_fl'],
        image_storage = json['image_storage'],
        image_path = json['image_path'],
        image_name = json['image_name'],
        short_desc = json['short_desc'],
        global_data_2_short_description =
            json['global_data_2_short_description'],
        global_data_3_short_description =
            json['global_data_3_short_description'],
        global_data_4_short_description =
            json['global_data_4_short_description'],
        event_description = json['event_description'],
        goods_desc_pc = json['goods_desc_pc'],
        goods_desc_mobile = json['goods_desc_mobile'],
        goods_desc_same_flag = json['goods_desc_same_flag'],
        daum_flag = json['daum_flag'],
        naver_flag = json['naver_flag'],
        naver_import_flag = json['naver_import_flag'],
        naver_product_flag = json['naver_product_flag'],
        naver_age_group = json['naver_age_group'],
        naver_gender = json['naver_gender'],
        naver_tag = json['naver_tag'],
        naver_attribute = json['naver_attribute'],
        naver_category = json['naver_category'],
        naver_product_id = json['naver_product_id'],
        detail_delivery_fl = json['detail_delivery_fl'],
        detail_delivery = json['detail_delivery'],
        detail_as_fl = json['detail_as_fl'],
        detail_as = json['detail_as'],
        detail_refund_fl = json['detail_refund_fl'],
        detail_refund = json['detail_refund'],
        detail_exchange_fl = json['detail_exchange_fl'],
        detail_exchange = json['detail_exchange'],
        memo = json['memo'],
        hscode = json['hscode'],
        seo_tag_fl = json['seo_tag_fl'],
        set_tag_title = json['set_tag_title'],
        set_tag_author = json['set_tag_author'],
        set_tag_description = json['set_tag_description'],
        set_tag_keyword = json['set_tag_keyword'],
        fb_vn = json['fb_vn'],
        fb_image_name = json['fb_image_name'];

  Map<String, String> toJson() => {
        'goods_no': goods_no,
        'goods_name': goods_name,
        'commission': commission,
        'goods_cd': goods_cd,
        'name_main': name_main,
        'name_list': name_list,
        'name_detail': name_detail,
        'name_partner': name_partner,
        'global_data_2_goodsnm': global_data_2_goodsnm,
        'global_data_3_goodsnm': global_data_3_goodsnm,
        'global_data_4_goodsnm': global_data_4_goodsnm,
        'search_word': search_word,
        'goods_open_dt': goods_open_dt,
        'goods_state': goods_state,
        'goods_color': goods_color,
        'pay_limit_fl': pay_limit_fl,
        'pay_limit': pay_limit,
        'model_no': model_no,
        'category_code': category_code,
        'purchase_goods_name': purchase_goods_name,
        'brand_code': brand_code,
        'maker_name': maker_name,
        'origin_name': origin_name,
        'make_date': make_date,
        'launch_date': launch_date,
        'effective_start_ymd': effective_start_ymd,
        'effective_end_ymd': effective_end_ymd,
        'goods_permission': goods_permission,
        'goods_permission_group': goods_permission_group,
        'goods_permission_price_string_fl': goods_permission_price_string_fl,
        'goods_permission_price_string': goods_permission_price_string,
        'only_adult_fl': only_adult_fl,
        'only_adult_display_fl': only_adult_display_fl,
        'only_adult_image_fl': only_adult_image_fl,
        'goods_access': goods_access,
        'goods_access_group': goods_access_group,
        'goods_access_display_fl': goods_access_display_fl,
        'add_info': add_info,
        'goods_must_info': goods_must_info,
        'kcmark_fl': kcmark_fl,
        'kcmark_div_fl': kcmark_div_fl,
        'kcmark_no': kcmark_no,
        'kcmark_dt': kcmark_dt,
        'icon_start': icon_start,
        'icon_end': icon_end,
        'icon_period': icon_period,
        'icon_code': icon_code,
        'weight': weight,
        'volume': volume,
        'stock_type': stock_type,
        'mileage_type': mileage_type,
        'mileage_group': mileage_group,
        'mileage_group_info': mileage_group_info,
        'mileage_goods': mileage_goods,
        'mileage_goods_unit': mileage_goods_unit,
        'goods_discount_fl': goods_discount_fl,
        'goods_discount': goods_discount,
        'goods_discount_unit': goods_discount_unit,
        'fixed_sales': fixed_sales,
        'sales_unit': sales_unit,
        'soldout_yn': soldout_yn,
        'tax_free_type': tax_free_type,
        'tax_percent': tax_percent,
        'display_pc_yn': display_pc_yn,
        'display_mobile_yn': display_mobile_yn,
        'sell_pc_yn': sell_pc_yn,
        'sell_mobile_yn': sell_mobile_yn,
        'deliverySno': deliverySno,
        'goods_price_string': goods_price_string,
        'fixed_cnt': fixed_cnt,
        'min_cnt': min_cnt,
        'max_cnt': max_cnt,
        'sales_start_ymd': sales_start_ymd,
        'sales_end_ymd': sales_end_ymd,
        'culture_benefit_fl': culture_benefit_fl,
        'external_video_fl': external_video_fl,
        'external_video_url': external_video_url,
        'external_video_width': external_video_width,
        'external_video_height': external_video_height,
        'goods_price': goods_price,
        'fixed_price': fixed_price,
        'cost_price': cost_price,
        'option_yn': option_yn,
        'option_display': option_display,
        'option_name': option_name,
        'option_value': option_value,
        'option_image': option_image,
        'option_cost_price': option_cost_price,
        'option_price': option_price,
        'stock_cnt': stock_cnt,
        'option_view_fl': option_view_fl,
        'option_sell_fl': option_sell_fl,
        'option_delivery_fl': option_delivery_fl,
        'option_code': option_code,
        'option_memo': option_memo,
        'text_option_yn': text_option_yn,
        'text_option': text_option,
        'relation_yn': relation_yn,
        'relation_same_fl': relation_same_fl,
        'relation_code': relation_code,
        'relation_goods_date': relation_goods_date,
        'relation_goods_each': relation_goods_each,
        'add_goods_fl': add_goods_fl,
        'add_goods': add_goods,
        'imgDetail_view_fl': imgDetail_view_fl,
        'image_storage': image_storage,
        'image_path': image_path,
        'image_name': image_name,
        'short_desc': short_desc,
        'global_data_2_short_description': global_data_2_short_description,
        'global_data_3_short_description': global_data_3_short_description,
        'global_data_4_short_description': global_data_4_short_description,
        'event_description': event_description,
        'goods_desc_pc': goods_desc_pc,
        'goods_desc_mobile': goods_desc_mobile,
        'goods_desc_same_flag': goods_desc_same_flag,
        'daum_flag': daum_flag,
        'naver_flag': naver_flag,
        'naver_import_flag': naver_import_flag,
        'naver_product_flag': naver_product_flag,
        'naver_age_group': naver_age_group,
        'naver_gender': naver_gender,
        'naver_tag': naver_tag,
        'naver_attribute': naver_attribute,
        'naver_category': naver_category,
        'naver_product_id': naver_product_id,
        'detail_delivery_fl': detail_delivery_fl,
        'detail_delivery': detail_delivery,
        'detail_as_fl': detail_as_fl,
        'detail_as': detail_as,
        'detail_refund_fl': detail_refund_fl,
        'detail_refund': detail_refund,
        'detail_exchange_fl': detail_exchange_fl,
        'detail_exchange': detail_exchange,
        'memo': memo,
        'hscode': hscode,
        'seo_tag_fl': seo_tag_fl,
        'set_tag_title': set_tag_title,
        'set_tag_author': set_tag_author,
        'set_tag_description': set_tag_description,
        'set_tag_keyword': set_tag_keyword,
        'fb_vn': fb_vn,
        'fb_image_name': fb_image_name,
      };
}
