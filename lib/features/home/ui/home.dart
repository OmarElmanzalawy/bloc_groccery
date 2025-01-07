import 'package:bloc_groccery/features/home/bloc/home_bloc.dart';
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
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      // listenWhen: (previous, current) {},
      // buildWhen: (previous, current) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Learning Bloc", style: TextStyle(color: Colors.white)),
            actions: [
              IconButton(onPressed: (){homeBloc.add(HomeProductWishlistButtonClickedEvent());}, icon: Icon(Icons.favorite_outline),color: Colors.white,),
              IconButton(onPressed: (){homeBloc.add(HomeProductCartButtonClickedEvent());}, icon: Icon(Icons.shopping_bag_outlined),color: Colors.white,)
            ],
          ),
        );
      },
    );
  }
}
