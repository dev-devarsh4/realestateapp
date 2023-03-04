abstract class ApiStateEvents {}

class LoadApiEvent extends ApiStateEvents {}

class ErrorApiEvent extends ApiStateEvents {
  final bool shouldGoBack;

  ErrorApiEvent({this.shouldGoBack = true});
}

class LoadedApiEvent extends ApiStateEvents {}

class DeductionDetailEmptyEvent extends ApiStateEvents {}
