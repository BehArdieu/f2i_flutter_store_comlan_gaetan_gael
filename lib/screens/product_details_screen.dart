import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/common/appbar_widget.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/product-details/product_details_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(isDetailPage: true,),
      // si l'écran est superposé, si le drawer n'est pas présent, une flèche de retour va apparaître
      // drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailsWidget(),
          ],
        ),
      ),
    );
  }
}
