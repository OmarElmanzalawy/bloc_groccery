import 'package:bloc_groccery/data/models/product_model.dart';
import 'package:bloc_groccery/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_groccery/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final ProductModel productModel;
  final CartBloc cartBloc;
  const CartTile({super.key, required this.productModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
          
        )
      ),
        child: 
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(productModel.imageUrl,),
                  fit: BoxFit.cover
                  ) 
                ),),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text('${productModel.name} ${productModel.price}\$',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),maxLines: 2,),
                      SizedBox(height: 7,),
                      Text(productModel.description,maxLines: 5,),
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: () => cartBloc.add(CartRemoveEvent(product: productModel)), icon: Icon(Icons.delete),color: Colors.red,),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
    );
  }
}