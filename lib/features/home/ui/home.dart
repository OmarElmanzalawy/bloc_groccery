import 'package:bloc_groccery/features/home/bloc/home_bloc.dart';
import 'package:bloc_groccery/features/home/ui/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
          Navigator.pushNamed(context, '/cart');
        }
        else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.pushNamed(context, '/wishlist');
        }
        else if(state is HomeProductItemCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to cart!')));
        }
         else if(state is HomeProdcutItemWishlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Added to wishlist!')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
          case HomeLoadedState:
          final loadedState = state as HomeLoadedState;
             return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Learning Bloc", style: TextStyle(color: Colors.white)),
            actions: [
              IconButton(onPressed: (){homeBloc.add(HomeWishlistButtonNavigateEvent());}, icon: Icon(Icons.favorite_outline),color: Colors.white,),
              IconButton(onPressed: (){homeBloc.add(HomeWishlistButtonNavigateEvent());}, icon: Icon(Icons.shopping_bag_outlined),color: Colors.white,)
            ],
          ),
          body: ListView.builder(
            itemCount: loadedState.products.length,
            itemBuilder: (context,index){
            return ProductTile(productModel: loadedState.products[index],homeBloc: homeBloc,);
          }),
        );

        case HomeErrorState:
          return Scaffold(body: Center(child: Text('An error occured'),));


          default: return SizedBox();
        } 
       
      },
    );
  }
}
