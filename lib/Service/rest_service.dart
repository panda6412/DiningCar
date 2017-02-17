import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:angular2/core.dart';

@Injectable()
class RestService{

  Future<Map<String,dynamic>> getData(String path)  {
    return HttpRequest.getString(path).then((result)=>parse(result));
  }

  Map <String , dynamic> parse(String jsonString){
    return JSON.decode(jsonString);
  }
}