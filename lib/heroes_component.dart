// Copyright (c) 2017, Paul Welbourne. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'hero.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes', 
  templateUrl: 'heroes_component.html',
  styleUrls: const ['heroes_component.css'],  
)
class HeroesComponent implements OnInit {  
  final Router _router;
  final HeroService _heroService;

  Hero selectedHero;
  List<Hero> heroes;

  HeroesComponent(this._heroService, this._router);
  
  Future<Null> getHeroes() async {
    heroes = await _heroService.getHeroes();
  }

  @override
  void ngOnInit() {
    getHeroes();
  }

  void onSelect(Hero hero) {
    selectedHero = hero;
  }

  Future<Null> gotoDetail() => _router.navigate([
    'HeroDetail',
    {'id': selectedHero.id.toString()}
  ]);

}