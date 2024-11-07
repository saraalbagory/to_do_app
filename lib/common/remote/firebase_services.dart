import 'package:to_do_app/auth/model/user_data_model.dart';
// import 'package:to_do_app/auth/view/login.dart';
// import 'package:to_do_app/auth/view/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/models/task_model.dart';

class FirebaseServices {
  static Future login(String email, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    getUser();
  }

  static Future register(UserDataModel user, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: password);
      user.id = credential.user?.uid;
      print(user.id);
      await createUser(user);
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  static CollectionReference<TaskModel> getTaskCollection() =>
      getUserCollection().doc(FirebaseAuth.instance.currentUser!.uid).collection("tasks").withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, _) => value.toJson(),);
  static CollectionReference<UserDataModel> getUserCollection() =>
      FirebaseFirestore.instance
          .collection('users')
          .withConverter<UserDataModel>(
            fromFirestore: (snapshot, _) =>
                UserDataModel.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, _) => value.toJson(),
          );
  static Future<UserDataModel?> getUser() async {
    DocumentSnapshot<UserDataModel> docRefract = await getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return docRefract.data();
  }

  static Future<void> createUser(UserDataModel userDataModel) async {
    try {
      print('Creating user document for ID: ${userDataModel.id}');
      await getUserCollection().doc(userDataModel.id).set(userDataModel);
      print('User document created successfully.');
    } catch (e) {
      print('Error creating user document: $e');
    }
  }
}
