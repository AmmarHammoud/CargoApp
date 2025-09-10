abstract class HomePageStates {}

class HomePageInitialState extends HomePageStates {}

class HomePageLoadingState extends HomePageStates {}

class HomePageSuccessState extends HomePageStates {}

class HomePageErrorState extends HomePageStates {
  final String error;

  HomePageErrorState(this.error);
}

class HomePageScanningQrState extends HomePageStates {}

class HomePageScannedQrSuccessState extends HomePageStates {
  final String message;

  HomePageScannedQrSuccessState(this.message);
}

class HomePageScannedQrErrorState extends HomePageStates {
  final String error;

  HomePageScannedQrErrorState(this.error);
}

class HomePageLoggingOutLoadingState extends HomePageStates {}

class HomePageLoggingOutSuccessfulState extends HomePageStates {}

class HomePageLoggingOutErrorState extends HomePageStates {
  final String error;

  HomePageLoggingOutErrorState(this.error);
}
