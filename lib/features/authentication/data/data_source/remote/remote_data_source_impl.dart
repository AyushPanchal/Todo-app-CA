import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/authentication/data/data_source/remote/remote_data_source.dart';
import 'package:todo_app/features/authentication/data/models/user_model.dart';
import 'package:todo_app/features/authentication/domain/entities/user_entity.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _fireStore;

  RemoteDataSourceImpl(
      {required FirebaseAuth auth, required FirebaseFirestore fireStore})
      : _fireStore = fireStore,
        _auth = auth;

  @override
  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<String> getCurrentUId() async {
    return _auth.currentUser!.uid;
  }

  @override
  Future<void> getOrCreateUser(UserEntity user) async {
    final userCollection = _fireStore.collection('users');

    final uid = await getCurrentUId();

    userCollection.doc(uid).get().then((userDoc) {
      if (!userDoc.exists) {
        final newUser = UserModel(
          email: user.email,
          uid: uid,
          username: user.username,
          profileUrl: user.profileUrl,
        ).toDocument();

        userCollection.doc(uid).set(newUser);
      } else {
        print('User already Exists');
      }
    });
  }

  @override
  Stream<List<UserEntity>> getSingleUser(UserEntity user) {
    final userCollection = _fireStore.collection('users');
    return userCollection
        .limit(1)
        .where('uid', isEqualTo: user.uid)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    });
  }

  @override
  Future<void> getUpdateUser(UserEntity user) async {
    final userCollection = _fireStore.collection('users');
    Map<String, dynamic> userInformation = {};
    if (user.profileUrl != null && user.profileUrl != '') {
      userInformation['profileUrl'] = user.profileUrl;
    }
    if (user.username != null && user.username != '') {
      userInformation['username'] = user.username;
    }

    await userCollection.doc(user.uid).update(userInformation);
  }

  @override
  Future<bool> isSignIn() async {
    return _auth.currentUser?.uid != null;
  }

  @override
  Future<void> signIn(UserEntity user) async {
    await _auth.signInWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    await _auth.createUserWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
  }
}
