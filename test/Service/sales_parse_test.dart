@TestOn('chrome')
import 'package:DiningCar/Service/sales_parse.dart';
import 'package:test/test.dart';
void main(){

  SalesParse salesParse ;

  //init before test running
  setUp((){
    salesParse = new SalesParse();
  });

  test('test#1',(){
    List<Map<String,dynamic>> res =
    [{'sales':'咖啡、輕食、飲料'},
      {'sales':'創意土司料理、飲料'},
      {'sales':'咖啡、輕食'}];
    List exp = ['咖啡,輕食,飲料,創意土司料理'];
    Set<String> result = salesParse.parse(res);
    expect(result.length,4);
  });

  test('test#2',(){
    List<Map<String,dynamic>> res =
    [{'sdd':'咖啡、輕食、飲料'},
    {'saless':'創意土司料理、飲料'},
    {'salaabyts':'咖啡、輕食'}];


    Set<String> result = salesParse.parse(res);
    expect(result.length,0);
  });
  tearDown((){
    salesParse = null ;
  });
}