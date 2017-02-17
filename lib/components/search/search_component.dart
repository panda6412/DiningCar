// Copyright (c) 2017, liuyouyang. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:DiningCar/Service/rest_service.dart';
import 'package:DiningCar/Service/sales_parse.dart';
import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';


@Component(
  selector: 'search',
  styleUrls: const ['search_component.css'],
  templateUrl: 'search_component.html',
  providers: const[RestService,SalesParse]
)
class SearchComponent implements OnInit{
  // Nothing here yet. All logic is in HelloDialog.
  final RestService _restService ;
  final SalesParse _salesParse;

  SearchComponent(this._restService,this._salesParse);

  List<Map<String,dynamic>> items=[];
  List<Map<String,dynamic>> origin;

  String temp_station="中正站" ;
  String temp_sale = "";

  List<String> stations = [];
  List<String> selectedSales = new List();
  List<String> sales = [];
  Set<String> salesSet ;


  @override
  ngOnInit() async {
    // TODO: implement ngOnInit
    Map<String,dynamic> result= await _restService.getData("http://localhost:8080/data.json");
    origin = result['result']['records'];
    //items = result['result']['records'];

    // functional function
    origin.forEach((item){
      stations.add(item['station']);

      // init all origin car list
      items.add(item);
    });

    //add sales
    origin.forEach((sale)=>sales.add(sale['sales']));
    print(sales);

    initSalesList();
  }

  initSalesList(){
    salesSet = _salesParse.parse(origin);
  }

  onChangeStation(){
    print(temp_station);

//
//    items.clear();
//    origin.forEach((Map<String,dynamic> car){
//      if(checkStation(car)){
//        items.add(car);
//      }
//    });
    update();
  }

  onChangeSale( ){
    print("click");
  }

  onSelectSale(String str){
    print("select");
  }

  onCheck(String sale){
    if(selectedSales.contains(sale)){
      selectedSales.remove(sale);
    }else{
      selectedSales.add(sale);
    }
    print(selectedSales);

    update();
  }
  void update(){
    items = origin.where( (Map<String,dynamic> car)=> checkStation(car));
  }

  bool checkStation(Map<String,dynamic> car){

    bool checkStation = car['station'] == temp_station || temp_station=="All";
    bool checkSales = selectedSales.isEmpty;
    selectedSales.forEach((sale){
      checkSales = checkSales || (car['sales'] as String).contains(sale);
    });
    return checkStation && checkSales;
  }

  Set<String> spiltString(){

    Set list = new Set();
    sales.forEach(  (saleList)=>  saleList.split("\u3001").forEach( (sale)=> list.add(sale) ));
    //l.forEach( (ls) => ls.forEach( (k)=>list.add(k)) );

    return list;
  }
}
