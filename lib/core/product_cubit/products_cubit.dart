import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/entities/product_entity.dart';
import 'package:fruite_app/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;

  Future<void> getBestSellingProduct() async {
    emit(ProductsLoadingState());
    var result = await productRepo.getBestSellingProduct();
    result.fold(
      (failure) => emit(ProductsFailureState(message: failure.message)),
      (products) => emit(
        ProductsSuccessState(products: products),
      ),
    );
  }

  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    var result = await productRepo.getProduct();
    result.fold(
      (failure) => emit(ProductsFailureState(message: failure.message)),
      (products) => emit(
        ProductsSuccessState(products: products),
      ),
    );
  }
}
