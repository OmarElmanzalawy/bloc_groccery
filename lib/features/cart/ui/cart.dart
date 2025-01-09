import 'package:bloc_groccery/data/items/cart_items.dart';
import 'package:bloc_groccery/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_groccery/features/cart/ui/cart_tile.dart';
import 'package:bloc_groccery/features/home/ui/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Cart',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        listener: (context,state) {},
        builder: (context,state){
          switch (state.runtimeType) {
            case CartLoadedState:
                final loaded = state as CartLoadedState;
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context,index){
                      // return ProductTile(productModel: loaded.cartItems[index], homeBloc: homeBloc)
                      return CartTile(productModel: loaded.cartItems[index], cartBloc: cartBloc);
                    }
                    ),
                );
            default: return SizedBox();
          }        
          }, 
        
        ),
    );
  }
}