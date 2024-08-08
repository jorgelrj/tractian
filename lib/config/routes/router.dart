import 'package:auto_route/auto_route.dart';
import 'package:tractian/config/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: CompanyRoute.page,
          path: '/company/:id',
        ),
      ];
}
