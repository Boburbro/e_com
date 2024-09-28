import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      _firebaseAuth.authStateChanges().listen((user) {
        if (user == null) {
          add(LoggedOutEvent(isLogOut: false));
        } else {
          add(LoggedInEvent());
        }
      });
    });

    on<LoggedInEvent>((LoggedInEvent event, Emitter emit) {
      emit(AuthAuthed());
    });
    on<LoggedOutEvent>((LoggedOutEvent event, Emitter emit) async {
      emit(AuthUnauthed());
      if (event.isLogOut) {
        await _firebaseAuth.signOut();
      }
    });
    on<RegisterEvent>((RegisterEvent event, Emitter emit) async {
      emit(AuthRegLoading());
      try {
        final newUser = await _firebaseAuth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(newUser.user!.uid)
            .set({
          'name': event.fullname,
          'email': event.email,
          'password': event.password,
        });
        emit(AuthAuthed());
      } on FirebaseAuthException catch (e) {
        emit(AuthRegFailed(msg: e.toString()));
      } catch (e) {
        rethrow;
      }
    });

    on<LogInEvent>((LogInEvent event, Emitter emit) async {
      emit(AuthLogInLoading());

      try {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
      } on FirebaseAuthException catch (e) {
        emit(AuthLogInFailed(msg: e.toString()));
      } catch (e) {
        rethrow;
      }
    });

    on<LogInGoogleEvent>((event, emit) async {
      try {
        GoogleAuthProvider authGoogle = GoogleAuthProvider();
        await _firebaseAuth.signInWithProvider(authGoogle);
      } catch (e) {
        rethrow;
      }
    });
  }
}
