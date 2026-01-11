import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/repos/order_repo/order_repo.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit({required this.orderRepo}) : super(AddOrderInitial());
  final OrderRepo orderRepo;
  Future<void> addOrder(OrderEntity orderEntity) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(orderEntity);
    result.fold(
      (failure) => emit(AddOrderFailure(failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
