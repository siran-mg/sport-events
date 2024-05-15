sealed class DataState {}

class Initial extends DataState {}

class Loading extends DataState {}

class Success extends DataState {}

class Error extends DataState {
  final String message;

  Error(this.message);
}
