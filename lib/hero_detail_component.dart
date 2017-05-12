// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import 'hero.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-hero-detail',
  templateUrl: 'hero_detail_component.html',
)
class HeroDetailComponent implements OnInit {
  @Input()
  Hero hero;

  final HeroService _heroService;
  final RouteParams _routeParams;
  final Location _location;

  HeroDetailComponent(this._heroService, this._routeParams, this._location);  

  @override
  Future<Null> ngOnInit() async  {
    var _id = _routeParams.get('id');
    var id = int.parse(_id ?? '', onError: (_) => null);
    if (id != null) hero = await (_heroService.getHero(id));
  }
  
  void goBack() => _location.back();
}