import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:temp_store/controllers/userController.dart';
import 'package:temp_store/models/userModel.dart';
import 'package:temp_store/services/database.dart';
import 'package:temp_store/views/buyers/AppMainNavigation.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Observalbe firebase user
  final Rxn<User> _firebaseUser = Rxn<User>();

  // User? get user => _firebaseUser.value;
  User? get user => _firebaseUser.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
    // Fetch user data when the authentication state changes
    _firebaseUser.listen((firebaseUser) {
      if (firebaseUser != null) {
        fetchUserData(firebaseUser.uid);
      }
    });
  }

  // Get current User Details from Firestore
  Future<void> fetchUserData(String uid) async {
    try {
      UserModel userData = await Database().getUser(uid);
      Get.find<UserController>().user = userData;
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Sign-Up With Email Password
  Future<void> signUpWithEmail(
      String email, String password, String nam, String phone) async {
    try {
      var userDetails = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      // Add user to Firestore 'Users' Collections
      UserModel _user = UserModel(
        id: userDetails.user!.uid,
        name: nam,
        phone: phone,
        email: email,
        password: password,
        address: '',
        image: '',
        phoneAds: [],
      );

      print('User model data in Signup controller ${_user.name}');

      if (await Database().addNewUser(_user)) {
        print('User Created Successfully in Firestore');
        Get.find<UserController>().user = _user;
        Get.off(AppNavigationScreen(
          index: 4,
        ));
      } else {
        print('Error Creating User in Firestore');
      }
      Get.snackbar('Logged In', userDetails.user!.email.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('Error: ${e.toString()}');
      Get.snackbar('Error creating account', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Sign-In With Email Password
  Future<void> signInWithEmail(String email, String password) async {
    try {
      var userDetails = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

      // Get.find<UserController>().user =
      //     await Database().getUser(userDetails.user!.uid);
      Get.back();
      print("Sign In Email check 1: ${Get.find<UserController>().user}");

      Get.snackbar('Logged In', userDetails.user!.email.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('Error ${e.toString()}');
      Get.snackbar('Error signing in', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      Get.find<UserController>().clear();
      await _auth.signOut();
    } catch (e) {
      print('Error ${e.toString()}');
      Get.snackbar('Signing out', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Sign-In With Google
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      var userDetails = await _auth.signInWithCredential(credential);

      // Add user to Firestore 'Users' Collections
      UserModel _user = UserModel(
        id: userDetails.user!.uid,
        name: userDetails.user!.displayName,
        phone: userDetails.user!.phoneNumber,
        email: userDetails.user!.email,
        password: '',
        address: '',
        image: userDetails.user!.photoURL,
        phoneAds: [],
      );

      if (await Database().addNewUser(_user)) {
        print('User Created Successfully in Firestore From Google');
        Get.find<UserController>().user = _user;
        Get.back();
      } else {
        print('Error Creating User in Firestore From Google');
      }

      Get.snackbar('Logged In', userDetails.user!.email.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('Error ${e.toString()}');
      Get.snackbar('Error signing in', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}
