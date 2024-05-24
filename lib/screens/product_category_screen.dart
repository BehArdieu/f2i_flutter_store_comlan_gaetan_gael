import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/category/products_category_grid_widget.dart';
import 'package:flutter/material.dart';

import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/common/appbar_widget.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(),
    // si l'écran est superposé, si le drawer n'est pas présent, une flèche de retour va apparaître
    //     drawer: DrawerWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductsCategoryGridWidget(),
            ]
          )
        )
    );
  }
}
