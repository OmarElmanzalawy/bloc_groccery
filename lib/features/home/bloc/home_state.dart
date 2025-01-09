part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedState extends HomeState{
  final List<ProductModel> products;

  HomeLoadedState({required this.products});

}

class HomeErrorState extends HomeState{}


class HomeNavigateToWishlistPageActionState extends HomeActionState{

}

class HomeNavigateToCartPageActionState extends HomeActionState{
  
}

class HomeProdcutItemWishlistedActionState extends HomeActionState{}
class HomeProductItemCartedActionState extends HomeActionState{}


