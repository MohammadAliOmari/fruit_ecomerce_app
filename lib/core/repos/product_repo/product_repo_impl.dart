import 'package:dartz/dartz.dart';
import 'package:fruite_app/core/entities/product_entity.dart';
import 'package:fruite_app/core/errors/failure.dart';
import 'package:fruite_app/core/repos/product_repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() {
    throw UnimplementedError();
  }
}
