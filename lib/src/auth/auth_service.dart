import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<Either<Exception, Unit>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(unit);
    } catch (e) {
      return left(Exception());
    }
  }

  Future<Either<Exception, Unit>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return right(unit);
    } catch (e) {
      return left(Exception());
    }
  }
}
