import 'package:flutter/material.dart';
import '../app_data.dart';
import '../components/categories_item.dart';

class categories extends StatelessWidget {
  const categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,

        ),
        children: categories_data
            .map(

              (categoryData) => CategoryItem(
                categoryData.id,
                categoryData.title,
                categoryData.placeImage,

              ),
            )
            .toList(),

    );
  }
}
