import 'package:f2i_flutter_store_comlan_gaetan_gael/screens/home_screen.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/screens/product_details_screen.dart';
import 'package:go_router/go_router.dart';


class RouterService {
  // lister les routes
  static GoRouter getRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          /*
            path : schéma Web d'une route
              > la route / doit exister et est considérée comme la route d'accueil
            name : nom de la route
            builder permet de cibler un widget associé à la route
          */
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/product-details',
          name: 'product-details',
          builder: (context, state) => const ProductDetailsScreen(),
        ),
      ],
    );
  }
}
