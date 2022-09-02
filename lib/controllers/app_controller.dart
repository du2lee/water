import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parse;
import 'package:cp949/cp949.dart' as cp949;

class AppController extends GetxService {
  static AppController get to => Get.find();
  String url = 'http://me.go.kr/home/web/index.do?menuId=10227';
  String brandUrl = 'http://nmwater.or.kr/member/member_list1.asp';
  
  RxList<String> manufacturers = RxList.empty(growable : true);
  RxList<List> result = RxList.empty(growable : true);
  List<String> get getManufacturers => manufacturers;
  List<List> get getResult => result;

  @override
  void onInit() {
      scrapyManufacturer();
      scrapyBrand();
      super.onInit();
  }

  Future<List<String>> scrapyManufacturer() async {

    final response = await http.get(Uri.parse(url));
    dom.Document document = parse.parse(response.body);

    final table = document.getElementsByClassName('table_case01');
    final tbody = table
      .map((element) => element.getElementsByTagName('tbody')).toList();
    final tr = tbody[0]
      .map((element) => element.getElementsByTagName('tr')).toList();
    
    for (int i = 0 ; i < tr[0].length; i++){
      List data = tr[0][i].getElementsByClassName('al');
      if (data[0].text == '먹는샘물' && data[1].text != '전체')
        manufacturers.add(data[1].text);
    }
    return manufacturers;
  }


  Future<List<List>> scrapyBrand() async {
    final response = await http.get(Uri.parse(brandUrl));
    dom.Document document = parse.parse(response.body);

    final table = document.getElementsByClassName('result')[0];
    final tbody = table.getElementsByTagName('tbody')[0];
    final tr = tbody.getElementsByTagName('tr');

    for (int i = 0; i < tr.length; i++){
      String manufacturer = tr[i].getElementsByTagName('th')[0].text;
      String brand = tr[i].getElementsByTagName('td')[0].text;
      manufacturer = cp949.decodeString(manufacturer);

      if (manufacturers.contains(manufacturer)){
        brand = cp949.decodeString(brand);
        List brands = brand.split(',');
        for (String brand in brands){
          result.add([manufacturer, brand.trimLeft()]);
        }
      }
    }
    return result;
  }
}
