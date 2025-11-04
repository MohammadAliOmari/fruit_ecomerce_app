abstract class DataBaseService {
  Future<void> addData(
      {required String collectionPath,
      required Map<String, dynamic> data,
      String? docId});
  Future<dynamic> getData(
      {String? docId,
      required String collectionPath,
      Map<String, dynamic>? query});

  Future<bool> checkIfUserExists(
      {required String userId, required String collectionPath});
}
