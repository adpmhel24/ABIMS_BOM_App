// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:bom_app/main_wrapper_page.dart' as _i2;
import 'package:bom_app/src/data/models/models.dart' as _i11;
import 'package:bom_app/src/router/router_guard.dart' as _i9;
import 'package:bom_app/src/views/Login/login.dart' as _i1;
import 'package:bom_app/src/views/Master%20Data/boms/components/bom_form.dart'
    as _i6;
import 'package:bom_app/src/views/Master%20Data/boms/components/boms.dart'
    as _i5;
import 'package:bom_app/src/views/Master%20Data/boms/view.dart' as _i4;
import 'package:bom_app/src/views/Master%20Data/products/view.dart' as _i3;
import 'package:fluent_ui/fluent_ui.dart' as _i10;
import 'package:flutter/material.dart' as _i8;

class AppRouter extends _i7.RootStackRouter {
  AppRouter({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.routeGuard,
  }) : super(navigatorKey);

  final _i9.RouteGuard routeGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    MainWrapperRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.MainWrapperPage(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductsRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.ProductsPage(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BillOfMaterialWrapperRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.BillOfMaterialWrapperPage(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BillOfMaterialsRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.BillOfMaterialsPage(),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BillOfMaterialFormRoute.name: (routeData) {
      final args = routeData.argsAs<BillOfMaterialFormRouteArgs>();
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.BillOfMaterialFormPage(
          key: args.key,
          selectedBoMObj: args.selectedBoMObj,
          onRefresh: args.onRefresh,
        ),
        transitionsBuilder: _i7.TransitionsBuilders.noTransition,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '',
          fullMatch: true,
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: 'login',
        ),
        _i7.RouteConfig(
          MainWrapperRoute.name,
          path: '',
          guards: [routeGuard],
          children: [
            _i7.RouteConfig(
              '#redirect',
              path: '',
              parent: MainWrapperRoute.name,
              redirectTo: 'bom',
              fullMatch: true,
            ),
            _i7.RouteConfig(
              ProductsRoute.name,
              path: 'products',
              parent: MainWrapperRoute.name,
            ),
            _i7.RouteConfig(
              BillOfMaterialWrapperRoute.name,
              path: 'bom',
              parent: MainWrapperRoute.name,
              children: [
                _i7.RouteConfig(
                  BillOfMaterialsRoute.name,
                  path: '',
                  parent: BillOfMaterialWrapperRoute.name,
                ),
                _i7.RouteConfig(
                  BillOfMaterialFormRoute.name,
                  path: 'bill-of-material-form-page',
                  parent: BillOfMaterialWrapperRoute.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MainWrapperPage]
class MainWrapperRoute extends _i7.PageRouteInfo<void> {
  const MainWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainWrapperRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';
}

/// generated route for
/// [_i3.ProductsPage]
class ProductsRoute extends _i7.PageRouteInfo<void> {
  const ProductsRoute()
      : super(
          ProductsRoute.name,
          path: 'products',
        );

  static const String name = 'ProductsRoute';
}

/// generated route for
/// [_i4.BillOfMaterialWrapperPage]
class BillOfMaterialWrapperRoute extends _i7.PageRouteInfo<void> {
  const BillOfMaterialWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(
          BillOfMaterialWrapperRoute.name,
          path: 'bom',
          initialChildren: children,
        );

  static const String name = 'BillOfMaterialWrapperRoute';
}

/// generated route for
/// [_i5.BillOfMaterialsPage]
class BillOfMaterialsRoute extends _i7.PageRouteInfo<void> {
  const BillOfMaterialsRoute()
      : super(
          BillOfMaterialsRoute.name,
          path: '',
        );

  static const String name = 'BillOfMaterialsRoute';
}

/// generated route for
/// [_i6.BillOfMaterialFormPage]
class BillOfMaterialFormRoute
    extends _i7.PageRouteInfo<BillOfMaterialFormRouteArgs> {
  BillOfMaterialFormRoute({
    _i10.Key? key,
    _i11.BoMModel? selectedBoMObj,
    required void Function() onRefresh,
  }) : super(
          BillOfMaterialFormRoute.name,
          path: 'bill-of-material-form-page',
          args: BillOfMaterialFormRouteArgs(
            key: key,
            selectedBoMObj: selectedBoMObj,
            onRefresh: onRefresh,
          ),
        );

  static const String name = 'BillOfMaterialFormRoute';
}

class BillOfMaterialFormRouteArgs {
  const BillOfMaterialFormRouteArgs({
    this.key,
    this.selectedBoMObj,
    required this.onRefresh,
  });

  final _i10.Key? key;

  final _i11.BoMModel? selectedBoMObj;

  final void Function() onRefresh;

  @override
  String toString() {
    return 'BillOfMaterialFormRouteArgs{key: $key, selectedBoMObj: $selectedBoMObj, onRefresh: $onRefresh}';
  }
}
