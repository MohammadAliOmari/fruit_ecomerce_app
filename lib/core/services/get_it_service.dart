import 'package:fruite_app/core/services/data_base_services.dart';
import 'package:fruite_app/core/services/firebase_auth_service.dart';
import 'package:fruite_app/core/services/firestore_services.dart';
import 'package:fruite_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:fruite_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FirestoreServices());
  getIt.registerSingleton<AuthRepo>(AuthRepoImp(
    dataBaseService: getIt<DataBaseService>(),
    firebaseAuthService: getIt<FirebaseAuthService>(),
  ));
}
