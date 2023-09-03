import '../../common/status_no.dart';
import '../../common/status_string.dart';
import '../../common/strings/strings.dart';

class StateHandler {


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
