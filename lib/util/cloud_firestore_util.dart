import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:friendlist/data/model/friend.dart';
import 'package:friendlist/data/model/person_response.dart';

class CloudFirestoreUtils {

  static Firestore _firestore = Firestore.instance;
  static final loveFriend = "love_friends";

  static void saveOrUpdatePerson(final Friend friend) async {
    if (friend != null) {
      await _firestore.collection("love_friends")/// create the collection where Visitors will be saved
          .document(friend.email)/// construct a path (more like reference)
          .setData(Friend.toMap(friend));/// save data
    }
  }
}