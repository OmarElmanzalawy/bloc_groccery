import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_groccery/data/items/cart_items.dart';
import 'package:bloc_groccery/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
   on<CartInitialEvent>(cartInitialEvent);
   on<CartRemoveEvent>(cartRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartLoadedState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveEvent(CartRemoveEvent event, Emitter<CartState> emit) {
    print('Cart remove');
    cartItems.removeWhere((item)=> event.product == item);
    emit(CartLoadedState(cartItems: cartItems));

  }
}
