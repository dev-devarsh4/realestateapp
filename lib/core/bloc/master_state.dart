abstract class BaseApiState {
  const BaseApiState();
}

class BaseApiStateInitial extends BaseApiState {}

class ApiErrorState extends BaseApiState {
  final String? message, title, actionText;
  final int? apiStatus;
  final bool shouldGoBack;
  final dynamic model;

  ApiErrorState(
    this.message,
    this.apiStatus, {
    this.title,
    this.actionText,
    this.shouldGoBack = true,
    this.model,
  }) : super();

  @override
  String toString() {
    return 'ApiErrorState{message: $message, title: $title, actionText: $actionText, apiStatus: $apiStatus, shouldGoBack: $shouldGoBack}';
  }
}

class ApiErrorStateWithPopScreen extends BaseApiState {
  final String? message, title, actionText;
  final int apiStatus;

  ApiErrorStateWithPopScreen(this.message, this.apiStatus,
      {this.title, this.actionText})
      : super();
}

class ApiLoadingState extends BaseApiState {}

class ApiLoadedState extends BaseApiState {}
