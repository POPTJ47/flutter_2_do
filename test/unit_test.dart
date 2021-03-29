import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_2_do/services/auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockUser extends Mock implements User {}

final MockUser _mockUser = MockUser();

class MockAuth extends Mock implements FirebaseAuth {

  @override
  Stream<User> authStateChanges() {
    
    return Stream.fromIterable([
      _mockUser,
    ]);
  }


}


void main() {

  final MockAuth mockAuth = MockAuth();
  final Auth auth = Auth(auth: mockAuth);
  
    //Runs before every test
  setUp (() {
  });

    //Runs after every test
  tearDown (() {
  });


  test("Emit occurs", () async {
      expectLater(auth.user, emitsInOrder([_mockUser]));
  });

  test("Create account", () async {
    when(
      mockAuth.createUserWithEmailAndPassword(
          email: "epic00467piraveen@gmail.com",
          password: "abc123"),
    ).thenAnswer((realInvocation) => null);

    expect(
      await auth.createAccount(
          email: "epic00467piraveen@gmail.com",
          password: "abc123"),
      "createAccount Success"
      );
    
  });


  test("Create account exception", () async {
    when(
      mockAuth.createUserWithEmailAndPassword(
          email: "epic00467piraveen@gmail.com",
          password: "abc123"),
    ).thenAnswer((realInvocation) =>
    throw FirebaseAuthException(message: "You screwed up."));

    expect(
        await auth.createAccount(
            email: "epic00467piraveen@gmail.com",
            password: "abc123"),
        "createAccount Success"
    );

  });


  test("Sign in", () async {
    when(
      mockAuth.signInWithEmailAndPassword(
          email: "epic00467piraveen@gmail.com",
          password: "abc123"),
    ).thenAnswer((realInvocation) =>
    throw FirebaseAuthException(message: "You screwed up."));

    expect(
        await auth.signIn(
            email: "epic00467piraveen@gmail.com",
            password: "abc123"),
        "signIn Success"
    );

  });

  test("Sign in Exception", () async {
    when(
      mockAuth.signInWithEmailAndPassword(
          email: "epic00467piraveen@gmail.com",
          password: "abc123"),
    ).thenAnswer((realInvocation) => null);

    expect(
        await auth.signIn(
            email: "epic00467piraveen@gmail.com",
            password: "abc123"),
        "signIn Success"
    );

  });


  test ("Sign out", () async {
    when(
      mockAuth.signOut()
    ).thenAnswer((realInvocation) => null);

    expect( await auth.signOut(), "signOut Success");

  });



}