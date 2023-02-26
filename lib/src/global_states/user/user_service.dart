import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finances/src/global_states/user/user_model.dart';

class UserService {
  static const String collection = 'users';

  String? get uid => FirebaseAuth.instance.currentUser?.uid;

  String? get email => FirebaseAuth.instance.currentUser?.email;

  Future<Either<Exception, UserModel>> getUserByUid() async {
    try {
      if (uid == null) {
        return left(Exception());
      }

      DocumentReference<dynamic> docRef =
          FirebaseFirestore.instance.collection(collection).doc(uid);

      DocumentSnapshot<dynamic> docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        UserModel user =
            UserModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
        return right(user);
      }

      return left(Exception());
    } catch (e) {
      return left(Exception());
    }
  }

  Future<Either<Exception, Unit>> addUser() async {
    try {
      if (uid == null && email == null) {
        return left(Exception());
      }

      CollectionReference<Map<String, dynamic>> usersRef =
          FirebaseFirestore.instance.collection(collection);

      DocumentReference<Map<String, dynamic>> newUserRef = usersRef.doc(uid);

      UserModel user = UserModel(email: email!);

      await newUserRef.set(user.toJson());

      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await newUserRef.get();

      if (snapshot.exists) {
        return right(unit);
      } else {
        return left(Exception());
      }
    } catch (e) {
      return left(Exception());
    }
  }
}
