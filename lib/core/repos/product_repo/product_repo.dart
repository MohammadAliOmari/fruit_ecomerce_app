import 'package:dartz/dartz.dart';
import 'package:fruite_app/core/entities/product_entity.dart';
import 'package:fruite_app/core/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct();
}
