import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  Future<void> getUser() async {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((QueryDocumentSnapshot<Object?> doc) {
        print(doc);
      });
    });
  }
}


// final user = FirebaseAuth.instance.currentUser;
// final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

// await userRef.set({
//   'name': 'John Doe',
//   'email': 'johndoe@example.com',
//   // outros dados do usuário que você queira salvar
// });


// final user = FirebaseAuth.instance.currentUser;
// final userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

// final userDoc = await userRef.get();
// if (userDoc.exists) {
//   final userData = userDoc.data();
//   print(userData['name']);
//   print(userData['email']);
// }