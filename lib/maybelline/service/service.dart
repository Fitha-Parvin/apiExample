import 'package:http/http.dart'as http;

import '../model/model.dart';



class HttpService{
  static Future<List<Product>> fetchProductus() async{
    var response = await http.get(Uri.parse
      ("https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    if(response.statusCode == 200){
      var data = response.body;
      return productFromJson(data);
    }else{
      throw Exception();
    }
  }
}