import 'package:learn/config/route/route_model.dart';

/// [Paths] list of all routes
class Paths {
  static final RouteModel appStateObserver =
      RouteModel(routeName: 'appStateObserver', path: '/appStateObserver');
  static final RouteModel splashRoute =
      RouteModel(routeName: 'splash', path: '/splash');

  static final RouteModel learningDashboardScreenRoute = RouteModel(
      routeName: 'learningDashboardScreenRoute',
      path: '/learningDashboardScreenRoute');
}
