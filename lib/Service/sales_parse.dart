import 'package:angular2/core.dart';

@Injectable()
class SalesParse{
  Set<String> parse(List<Map<String,dynamic> >res){
    Set<String> result = new Set();
    res.forEach( (Map car){
      if(car['sales'] != null)
        (car['sales'] as String).split('、').forEach( (item)=> result.add(item) );
    });
    return result ;
  }
}