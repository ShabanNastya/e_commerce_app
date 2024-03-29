import 'package:e_commerce_app/bloc/wishlist/wishlist_bloc.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'WishlistScreen'),
      bottomNavigationBar: CustomNavBar(),
      body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
        if (state is WishListLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WishListLoaded) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 2.5),
            itemCount: state.wishlist.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard(
                  product: state.wishlist.products[index],
                  widthFactor: 1,
                  leftPosition: 100,
                  isWishlist: true,
                ),
              );
            },
          );
        } else {
          return Text('Smth wrong');
        }
      }),
    );
  }
}
