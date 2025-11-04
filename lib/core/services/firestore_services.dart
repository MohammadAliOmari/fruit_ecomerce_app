import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruite_app/core/services/data_base_services.dart';

class FirestoreServices implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String collectionPath,
      required Map<String, dynamic> data,
      String? docId}) async {
    if (docId != null) {
      await firestore.collection(collectionPath).doc(docId).set(data);
    } else {
      await firestore.collection(collectionPath).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {String? docId, required String collectionPath,Map<String,dynamic>? query}) async {
    if (docId != null) {
      var data = await firestore.collection(collectionPath).doc(docId).get();
      return data.data()!;
    } else {
      Query<Map<String, dynamic>> data =  firestore.collection(collectionPath);
      if(query != null){
         
          if(query['orderBy'] != null){
            var orderby = query['orderBy'];
            var descending = query['descending'];
          data=data.orderBy(orderby, descending: descending);
          }
          if(query['Limit'] != null){
            data=data.limit(query['limit']);
          }
     
      
      return data.get().then((value) => value.docs.map((doc) => doc.data()).toList());
    }
  }

  @override
  Future<bool> checkIfUserExists(
      {required String userId, required String collectionPath}) async {
    var data = await firestore.collection(collectionPath).doc(userId).get();
    return data.exists;
  }
}
