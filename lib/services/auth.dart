import 'package:firebase_auth/firebase_auth.dart';

class Auth{

  final FirebaseAuth auth;

  Auth ({this.auth});

  Stream<User> get user => auth.authStateChanges();

  Future<String> createAccount ({String email, String password})async{
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      );
      return "createAccount Success";
    } on FirebaseAuthException catch(e){
      print( "createAccount Failure : " + e.message);
      return "createAccount Failure : " + e.message;
    }

    catch (e) {
      print("createAccount Catch block : " + e.toString());
      rethrow;
    }
  }

  Future<String> signIn ({String email, String password})async{
    try {
      await auth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()
      );
      return "signIn Success";
    } on FirebaseAuthException catch(e){
      print( "signIn Failure : " + e.message);
      return "signIn Failure : " + e.message;
    }

    catch (e) {
      print("signIn Catch block : " + e.toString());
      rethrow;
    }
  }


  Future<String> signOut ()async{
    try {
      await auth.signOut(

      );
      return "signOut Success";
    } on FirebaseAuthException catch(e){
      print( "signOut Failure : " + e.message);
      return "signOut Failure : " + e.message;
    }

    catch (e) {
      print("signOut Catch block : " + e.toString());
      rethrow;
    }
  }


}