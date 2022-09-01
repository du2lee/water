import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parse;

class AppController extends GetxService {
  static AppController get to => Get.find();
  String url = 'http://me.go.kr/home/web/index.do?menuId=10227';
  
  Future<void> scrapyManufacturer() async {
    
    final response = await http.get(Uri.parse(url));
    dom.Document document = parse.parse(response.body);
    
    // // count Data
    // final count = document.getElementsByClassName('ft_l');
    // int num = int.parse(count
    //             .map((element) => element.getElementsByTagName('i')[0].innerHtml)
    //             .toList()[0]);

    // get Data
    final table = document.getElementsByClassName('table_case01');

    final tbody = table
      .map((element) => element.getElementsByTagName('tbody')).toList();

    final tr = tbody[0]
      .map((element) => element.getElementsByTagName('tr')).toList();
    
    for (int i = 0 ; i < tr[0].length; i++){
      List data = tr[0][i].getElementsByClassName('al');
      if (data[0].text == '먹는샘물' && data[1].text != '전체')
        print(data[1].text);
        // To do
    }
  }
}
