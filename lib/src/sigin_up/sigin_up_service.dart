import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_finances/src/sigin_up/sigin_up_errors.dart';

class SiginUpService {
  Future<Either<Exception, Unit>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(WeakPasswordError());
      } else if (e.code == 'email-already-in-use') {
        return left(EmailAlreadyInUseError());
      } else if (e.code == 'invalid-email') {
        return left(InvalidEmailError());
      }

      return left(Exception());
    } catch (e) {
      return left(Exception());
    }
  }
}
