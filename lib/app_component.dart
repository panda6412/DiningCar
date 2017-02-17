import 'package:DiningCar/components/page2/page_component.dart';
import 'package:DiningCar/components/search/search_component.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const[ROUTER_DIRECTIVES]
)

@RouteConfig(const[
    const Route(
      path: '/search',
      name: 'Search',
      component: SearchComponent,
      useAsDefault: true
    ),
    const Route(
        path: '/page',
        name: 'Page',
        component: PageComponent
    )
  ])
class AppComponent{

}