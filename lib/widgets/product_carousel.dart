import 'package:e_commerce_app/models/models.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductCarousel({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 160,
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: ProductCard(product: products[index]),
              );
            }),
      ),
    );
  }
}
