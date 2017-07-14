// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

@Component(
  selector: 'part1',
  template: '''<h2>Part1</h2>''',
)
class Part1 {
}

@Component(
  selector: 'part2',
  template: '''<h2>Part2</h2>''',
)
class Part2 {
}

@Component(
  selector: 'container1',
  template: '''
    <h1>Cont1 XXXXXX YYYY</h1>
    <router-outlet></router-outlet>
  ''',
  directives: const [ROUTER_DIRECTIVES],
)
@RouteConfig(const [
    const Route(path: '/part1', name: 'Part1', component: Part1, useAsDefault: true),
    const Route(path: '/part2', name: 'Part2', component: Part2),
])
class Cont1 {
}

@Component(
  selector: 'container2',
  template: '''
    <h1>Cont2</h1>
    <router-outlet></router-outlet>
  ''',
  directives: const [ROUTER_DIRECTIVES],
)
@RouteConfig(const [
    const Route(path: '/part1', name: 'Part1', component: Part1, useAsDefault: true),
    const Route(path: '/part2', name: 'Part2', component: Part2),
])
class Cont2 {
}

@Component(
  selector: 'my-app',
  template: '''
    <ul>
      <li><a [routerLink]="['Cont1', 'Part1']">Cont1/Part1</a></li>
      <li><a [routerLink]="['Cont1', 'Part2']">Cont1/Part2</a></li>
      <li><a [routerLink]="['Cont2', 'Part1']">Cont2/Part1</a></li>
      <li><a [routerLink]="['Cont2', 'Part2']">Cont2/Part2</a></li>
    </ul>
    <router-outlet></router-outlet>
  ''',
  directives: const [ROUTER_DIRECTIVES],
  providers: const [ROUTER_PROVIDERS],
  styles: const ['''
    .router-link-active {
      color: #d3531a;
    }
  '''],
)
@RouteConfig(const [
    const Route(path: '/cont1/...', name: 'Cont1', component: Cont1, useAsDefault: true),
    const Route(path: '/cont2/...', name: 'Cont2', component: Cont2),
])
class AppComponent {
}
