import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/cart_provider.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/widgets/cart/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // watch (getter) : accéder au product stocké dans ProductProvider


  return Consumer<CartProvider>(
      builder: (context, cart, child) {
        if (cart.products?.isEmpty ?? true) {
            return EmptyWidget();
        } else {
          return ListView.builder(
            itemCount: cart.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cart.products[index].title),
                subtitle: Text('Price: ${cart.products[index].price}'),
              );
            },
        );
        }
      },
    );
  }
}
