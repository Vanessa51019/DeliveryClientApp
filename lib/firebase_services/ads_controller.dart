import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/firebase_services/basic_firebase.dart';
import 'package:delivery_app/models/ads_model.dart';

class AdsController{
  static Future<List<Ads>> getAllAvailableAds() async {
    QuerySnapshot docSnapshot = await db
      .collection("ads")
      .where("available", isEqualTo: true)
      .getDocuments();
    if(docSnapshot == null || docSnapshot.documents.length == 0){
      return [];
    }
    List<Ads> adsList = [];
    adsList = docSnapshot.documents.map((doc) { return Ads.fromJson(doc.data); }).toList();
    return adsList;
  }
}