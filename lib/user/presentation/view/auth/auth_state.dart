sealed class AuthState {}

class Initial extends AuthState {}

class SignInWithGoogleLoading extends AuthState {}

class SignInWithFacebookLoading extends AuthState {}

class Success extends AuthState {}
