import '../../common/status_no.dart';
import '../../common/status_string.dart';
import '../../common/strings/strings.dart';

class StateHandler {
  static String fitOutStatus({required int statusNo}) {
    if (statusNo == StatusNo.fitOutNotStarted) {
      return StatusString.fitOutNotStarted;
    } else if (statusNo == StatusNo.fitOutRejected) {
      return StatusString.fitOutRejected;
    } else if (statusNo == StatusNo.fitOutInProgress) {
      return StatusString.fitOutInProgress;
    } else if (statusNo == StatusNo.fitOutFurtherRequirementSubmitted) {
      return StatusString.fitOutFurtherRequirementSubmitted;
    } else if (statusNo == StatusNo.fitOutCompleted) {
      return StatusString.fitOutCompleted;
    } else if (statusNo == StatusNo.fitOutApproved) {
      return StatusString.fitOutApproved;
    } else {
      return Strings.na;
    }
  }

  static String caseType({required int statusNo}) {
    if (statusNo == StatusNo.caseTypeHandover) {
      return StatusString.caseTypeHandover;
    } else if (statusNo == StatusNo.caseTypeProblem) {
      return StatusString.caseTypeProblem;
    } else if (statusNo == StatusNo.caseTypeQuestion) {
      return StatusString.caseTypeQuestion;
    } else if (statusNo == StatusNo.caseTypeRequest) {
      return StatusString.caseTypeRequest;
    } else if (statusNo == StatusNo.caseTypeWarranty) {
      return StatusString.caseTypeWarranty;
    } else {
      return Strings.na;
    }
  }

  static String casePriority({required int statusNo}) {
    if (statusNo == StatusNo.casePriorityNormal) {
      return StatusString.casePriorityNormal;
    } else if (statusNo == StatusNo.casePriorityLow) {
      return StatusString.casePriorityLow;
    } else if (statusNo == StatusNo.casePriorityHigh) {
      return StatusString.casePriorityLow;
    } else {
      return Strings.na;
    }
  }

  static String state({required int statusNo}) {
    if (statusNo == StatusNo.stateActive) {
      return StatusString.stateActive;
    } else if (statusNo == StatusNo.stateInActive) {
      return StatusString.stateInActive;
    }
    {
      return Strings.na;
    }
  }

  static String leaseStatus({required int statusNo}) {
    if (statusNo == StatusNo.leasesTerminatedStatus) {
      return StatusString.leasesTerminatedStatus;
    } else if (statusNo == StatusNo.leasesRenewedStatus) {
      return StatusString.leasesRenewedStatus;
    } else if (statusNo == StatusNo.leasesPendingTenantStatus) {
      return StatusString.leasesPendingTenantStatus;
    } else if (statusNo == StatusNo.leasesActiveStatus) {
      return StatusString.leasesActiveStatus;
    } else if (statusNo == StatusNo.leasesPendingMgmtStatus) {
      return StatusString.leasesPendingMgmtStatus;
    } else if (statusNo == StatusNo.leasesPendingFinalStatus) {
      return StatusString.leasesPendingFinalStatus;
    } else if (statusNo == StatusNo.leasesHoldOverStatus) {
      return StatusString.leasesHoldOverStatus;
    } else if (statusNo == StatusNo.leasesExpiredStatus) {
      return StatusString.leasesExpiredStatus;
    } else if (statusNo == StatusNo.leasesDaftStatus) {
      return StatusString.leasesDaftStatus;
    } else {
      return Strings.na;
    }
  }

  static String leaseType({required int statusNo}) {
    if (statusNo == StatusNo.leasesNewType) {
      return StatusString.leasesNewType;
    } else if (statusNo == StatusNo.leasesRenewalType) {
      return StatusString.leasesRenewalType;
    } else {
      return Strings.na;
    }
  }

  static String messagePriority({required int statusNo}) {
    if (statusNo == StatusNo.messagePriorityHeight) {
      return StatusString.messagePriorityHeight;
    } else if (statusNo == StatusNo.messagePriorityLow) {
      return StatusString.messagePriorityLow;
    } else if (statusNo == StatusNo.messagePriorityNormal) {
      return StatusString.messagePriorityNormal;
    } else {
      return Strings.na;
    }
  }
}
