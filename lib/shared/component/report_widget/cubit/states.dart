abstract class SendingReportStates {}

class SendingReportInitialState extends SendingReportStates {}

class SendingReportLoadingState extends SendingReportStates {}

class SendingReportSuccessState extends SendingReportStates {
  final String message;

  SendingReportSuccessState(this.message);
}

class SendingReportErrorState extends SendingReportStates {
  final String error;

  SendingReportErrorState(this.error);
}
