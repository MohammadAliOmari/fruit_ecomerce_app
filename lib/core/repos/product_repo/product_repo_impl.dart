import 'package:dartz/dartz.dart';
import 'package:fruite_app/core/entities/product_entity.dart';
import 'package:fruite_app/core/errors/failure.dart';
import 'package:fruite_app/core/models/product_model.dart';
import 'package:fruite_app/core/repos/product_repo/product_repo.dart';
import 'package:fruite_app/core/services/data_base_services.dart';
import 'package:fruite_app/core/utils/backend_end_point.dart';

class ProductRepoImpl implements ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImpl(this.dataBaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      var data = await dataBaseService.getData(
              collectionPath: BackendEndPoint.products)
          as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } on Exception catch (e) {
      return Left(NetworkFailure(
          "Failed to get best selling products ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct() async {
    try {
      var data = await dataBaseService
          .getData(collectionPath: BackendEndPoint.products, query: {
        'limit': 10,
        'orderBy': 'sellingCount',
        'descending': true,
      }) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } on Exception catch (e) {
      return Left(NetworkFailure(
          "Failed to get best selling products ${e.toString()}"));
    }
  }
}
