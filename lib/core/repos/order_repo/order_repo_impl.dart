import 'package:dartz/dartz.dart';
import 'package:fruite_app/core/errors/failure.dart';
import 'package:fruite_app/core/services/data_base_services.dart';
import 'package:fruite_app/core/utils/backend_end_point.dart';
import 'package:fruite_app/features/check_out/data/models/order_model.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:fruite_app/core/repos/order_repo/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final DataBaseService dataBaseService;
  OrderRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async {
    try {
      await dataBaseService.addData(
        collectionPath: BackendEndPoint.orders,
        data: OrderModel.fromEntity(orderEntity).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}
