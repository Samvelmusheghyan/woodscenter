part of 'sign_in_bloc.dart';

@Freezed()
sealed class SignInEvent {
  const factory SignInEvent.signIn({required String email, required String password}) = SignIn;
}

class SignIn implements SignInEvent {
  const SignIn({required this.email, required this.password});

  final String email;
  final String password;
}
