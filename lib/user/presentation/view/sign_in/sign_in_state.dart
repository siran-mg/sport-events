sealed class SignInState {}

class Initial extends SignInState {}

class Loading extends SignInState {}

class Success extends SignInState {}

class BadCredentials extends SignInState {}
