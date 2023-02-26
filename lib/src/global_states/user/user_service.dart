import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finances/src/global_states/user/user_model.dart';
import 'package:personal_finances/src/global_states/user/user_state.dart';

class UserService {
  final UserState _userState = UserState.instace;
  static const String _collection = 'users';

  String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  // String? get _email => FirebaseAuth.instance.currentUser?.email;

  Future<Either<Exception, Unit>> getUserByUidAndSalveInGlobalState() async {
    try {
      if (_uid == null) {
        return left(Exception());
      }

      DocumentReference<dynamic> docRef =
          FirebaseFirestore.instance.collection(_collection).doc(_uid);

      DocumentSnapshot<dynamic> docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        UserModel userModel =
            UserModel.fromJson(docSnapshot.data() as Map<String, dynamic>);

        _userState.updateUserModel(userModel: userModel);

        return right(unit);
      }

      return left(Exception());
    } catch (e) {
      return left(Exception());
    }
  }

  Future<Either<Exception, Unit>> setUser({
    required UserModel userModel,
  }) async {
    try {
      if (_uid == null) {
        return left(Exception());
      }

      CollectionReference<Map<String, dynamic>> colletionRef =
          FirebaseFirestore.instance.collection(_collection);

      DocumentReference<Map<String, dynamic>> userRef = colletionRef.doc(_uid);

      await userRef.set(userModel.toJson());

      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await userRef.get();

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
