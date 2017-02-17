// Copyright (c) 2017, liuyouyang. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:DiningCar/app_component.dart';
import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';

import 'package:DiningCar/components/search/search_component.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';

main() {

  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
