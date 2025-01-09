part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState {}

class CartInitial extends CartState {}

class CartLoadedState extends CartState{
  final List<ProductModel> cartItems;

  CartLoadedState({required this.cartItems});
}


