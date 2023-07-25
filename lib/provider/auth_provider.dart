// ignore_for_file: unused_field

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:maidmatch_app/model/user_model.dart';
import 'package:maidmatch_app/src/otp.dart';
import 'package:maidmatch_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _uid;
  String get uid => _uid!;
  UserModel? _userModel;
  UserModel get userModel=> _userModel!;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  AuthProvider(){
    checkSignIn();
  }
  
  Future<void> checkSignIn() async {

  final SharedPreferences s = await SharedPreferences.getInstance();
  _isSignedIn = s.getBool("is_signedin") ?? false;
  notifyListeners();
  
}

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try{
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential PhoneAuthCredential) async {
          await _firebaseAuth.signInWithCredential(PhoneAuthCredential);
        }, 
        verificationFailed:(error){
          throw Exception(error.message);
        }, 
        codeSent: (verificationId, forceResendingToken){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen(verificationId: verificationId),
           ),
           );
        }, 
        codeAutoRetrievalTimeout: ((verificationId){}),
        );
    } on FirebaseAuthException catch (e){
      showSnackBar(context, e.message.toString());
    }
  }

//verify otp

void verifyOtp({
  required BuildContext context,
  required String verificationId,
  required String userOtp,
  required Function onSuccess,
}) async {
_isLoading = true;
notifyListeners();

try {
  PhoneAuthCredential creds = PhoneAuthProvider.credential(
    verificationId: verificationId, smsCode: userOtp);

    User? user = (await _firebaseAuth.signInWithCredential(creds)).user;

    if (user!=null){
      //do our logic
    _uid = user.uid;
    onSuccess();
    }
    _isLoading = false;
    notifyListeners();

} on FirebaseAuthException catch (e){
  showSnackBar(context, e.message.toString());
}

  }


//database oprations

Future<bool> checkExistingUser() async {
  DocumentSnapshot snapshot = await _firebaseFirestore.collection("users").doc(_uid).get();
  if(snapshot.exists){
    print("user exits");
    return true;
  }else {
    print('new user');
    return false;
  }
}

void saveUserDatatoFirebase({
  required BuildContext context, 
  required UserModel userModel,
  required File profilePic,
  required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    try{

      //upload image to fb storage
      await storeFileToStorage("profilePic/$_uid", profilePic).then((value) {
        userModel.profilePic = value;
        userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
        userModel.phoneNumber = _firebaseAuth.currentUser!.phoneNumber!;
        userModel.uid = _firebaseAuth.currentUser!.phoneNumber!;
      });
      _userModel =userModel;

      await _firebaseFirestore.collection("users").doc(_uid).set(userModel.toMap()).then((value){
        onSuccess();
        _isLoading =false;
        notifyListeners();
      });

    } on FirebaseAuthException catch(e){
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    };

  }

  Future<String>storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot =await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  Future saveUserDataToSP() async{
    SharedPreferences s =await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModel.toMap())); 
  }

}


