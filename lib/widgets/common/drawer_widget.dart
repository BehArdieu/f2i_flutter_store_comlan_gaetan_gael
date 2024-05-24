import 'package:f2i_flutter_store_comlan_gaetan_gael/providers/category_provider.dart';
import 'package:f2i_flutter_store_comlan_gaetan_gael/services/categories_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final CategoriesService _categoriesService = CategoriesService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CloseButton(),
              ],
            ),
            FutureBuilder(
                future: _categoriesService.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<String> data = snapshot.requireData;
                    return
                      SizedBox(
                        height: 500,
                        child: ListView(
                          children: data.map((String category) {
                            return ListTile(
                                title: Text(category),
                                minTileHeight: 50,
                                onTap: () {
                                  context.read<CategoryProvider>().category = category;
                                  context.pushNamed('category');
                                },
                              );
                            }).toList(),
                        ),
                      );
                  } else {
                    return const Text('chargement...');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
