class StatusNo {
  /// FIT OUT
  static const int fitOutApproved = 550220005;
  static const int fitOutFurtherRequirementSubmitted = 550220004;
  static const int fitOutRejected = 550220003;
  static const int fitOutCompleted = 550220002;
  static const int fitOutInProgress = 550220001;
  static const int fitOutNotStarted = 550220000;

  /// FIT OUT STEP
  static const int fitOutStepFurtherRequirementSubmitted = 550220004;
  static const int fitOutStepSkipped = 550220003;
  static const int fitOutStepVerified = 550220002;
  static const int fitOutStepCompleted = 550220001;
  static const int fitOutStepPending = 550220000;

  /// CASES TYPES
  static const int caseTypeQuestion = 550220000;
  static const int caseTypeProblem = 550220001;
  static const int caseTypeRequest = 550220002;
  static const int caseTypeHandover = 550220003;
  static const int caseTypeWarranty = 550220004;

  /// CASES PRIORITY
  static const int casePriorityHigh = 100000000;
  static const int casePriorityNormal = 100000001;
  static const int casePriorityLow = 100000002;

  /// STATE
  static const int stateActive = 1;
  static const int stateInActive = 0;
}
