import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/common/appbar_widget.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/cart/cart_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(),
      // si l'écran est superposé, si le drawer n'est pas présent, une flèche de retour va apparaître
      // drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CartWidget(),
          ],
        ),
      ),
    );
  }
}
