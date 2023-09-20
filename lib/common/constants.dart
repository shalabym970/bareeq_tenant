class Constants {
  static const String appName = 'IGames';
  static const String sentMessage = 'sent';
  static const String inboxMessage = 'inbox';
  static const String username = 'testuser1';
  static const String password = 'pass@T1#22';
  static const String standard = 'Standard';
  static const String emergency = 'Emergency';
  static const String baseUrl =
      "https://bartest.crm4.dynamics.com/api/data/v9.2/";

  // 'http://d365.blive.me/bar/api/data/v9.1/';
  static const String environmentName = "Bareeq";
  static const String workPermitKey = "blser_workpermit";
  static const String messageKey = "blser_portalmessages";
  static const String caseKey = "blser_case";
  static const String invoiceKey = "blser_invoice";
  static const String leaseKey = "advanced_propertycontract";
  static const String fitOutKey = "blser_fitoutprocess";
  static const String fitOutStepsKey = " blser_fitoutstep";
  static const String allKey = "all";
  static const String workPermitInsuranceAttachment = "Insurance Attachment";
  static const String workPermitCprCardsAttachment = "CPR Cards Attachment";
  static const String workPermitMethodStatementAttachment =
      "Method Statement Attachment";
  static const String workPermitRiskAssessmentAttachment =
      "Risk Assessment Attachment";
  static const String workPermitTableName = "blser_workpermit";
  static const String soldPropertyTableName = "  blser_propertyagreement";

  static const String caseTableName = "blser_case";
  static const String fitOutStepTableName = "blser_fitoutstep";
  static const String downloadPath = "/storage/emulated/0/Download/";
  static const String cprFile = "cprAttach";
  static const String insuranceFile = "insuranceAttach";
  static const String methodFile = "methodAttach";
  static const String riskFile = "riskAttach";

  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Prefer": "odata.include-annotations=*, return=representation"
  };

  /// Work Permit Item TYPES
  static const Map<String, int> workPermitItemTypesMap = {
    "Carpentry": 550220000,
    "Fit out": 550220001,
    "Layout change": 550220002,
    "Structural": 550220003,
    "Electrical": 550220004,
    "Snagging": 550220005,
    "Flooring": 550220006,
    "Decorating": 550220007,
    "Painting": 550220008,
    "Hot work": 550220009,
    "Working on the Roof": 550220010,
    "Other": 550220011
  };

  /// FIT OUT TYPES
  static const Map<String, int> fitOuTTypesMap = {
    'Approved': 550220005,
    'Not Yet Started': 550220004,
    'Rejected': 550220003,
    'Completed': 550220002,
    'In Progress': 550220001,
    'Further requirement to be submitted': 550220000
  };

  /// FIT OUT STEPS TYPES
  static const Map<String, int> fitOuTStepsTypesMap = {
    'Further requirement to be submitted': 550220004,
    "Skipped": 550220003,
    'Verified': 550220002,
    'Completed': 550220001,
    'Pending': 550220000
  };

  /// CASE TYPES
  static const Map<String, int> caseTypesMap = {
    'Question': 550220000,
    "Problem": 550220001,
    'Request': 550220002,
    'Warranty': 550220004
  };

  /// CASES PRIORITY
  static const Map<String, int> casePriorityMap = {
    'High': 100000000,
    'Normal': 100000001,
    'Low': 100000002
  };

  /// CASES STATE
  static const Map<String, int> caseStatesMap = {"Active": 1, "InActive": 0};

  /// LEASED PROPERTIES STATUS
  static const Map<String, int> leasedPropertyStatusMap = {
    "Draft": 153160000,
    "Pending for Mgmt Signature": 153160001,
    "Pending for Tenant Signature": 153160002,
    "Pending for Final Signature": 153160003,
    "Active": 153160004,
    "Renewed": 153160005,
    "Expired": 100000000,
    "Terminated": 858870000,
    "Hold Over": 550220000
  };

  /// SOLD PROPERTIES STATUS
  static const Map<String, int> soldPropertyStatusMap = {
    "Cancelled": 550220006,
    "Active": 550220000,
    "Inactive": 550220001,
    "Available": 153160000,
    "Booked": 550220004,
    "Reserved": 153160001,
    "Registered": 550220005,
    "Occupied": 153160002,
    "Under Maintenance": 153160003,
    "Move In": 550220002,
    "Move Out": 858870000,
    "Blocked": 100000001
  };

  /// LEASES TYPE
  static const Map<String, int> leaseTypeMap = {
    "New Lease": 153160000,
    "Renewal Lease": 153160001
  };

  /// MESSAGES PRIORITY
  static const Map<String, int> messagePriorityMap = {
    "Normal": 1,
    "Low": 0,
    "Height": 2
  };

  /// Nature Of Complaints
  static const Map<String, int> natureOfComplaints = {
    "Ambience - Overall look": 550220000,
    "Ambience - Smell": 550220001,
    "Ambience - Disturbance": 550220002,
    "Ambience - Tenant relation": 550220003,
    "Ambience - Cleanliness": 550220004,
    "Staff - Attitude": 550220005,
    "Staff - Knowledge": 550220006,
    "Staff - Professional ethics": 550220007,
    "Security - Competence": 550220008,
    "Security - Safety": 550220009,
    "Security - Fire": 550220010,
    "Security - Privacy": 550220011,
    "Contractual - Price": 550220012,
    "Contractual - Renewal": 550220013,
    "Contractual - Value for money": 550220014,
    "Contractual - Move-in/move-out": 550220015,
    "Facilities - Repeat maintenance": 550220016,
    "Facilities - Parking": 550220017,
    "Facilities - F&B": 550220018,
    "Facilities - Recreation": 550220019,
    "Facilities - TV/Internet": 550220020,
    "Others": 550220021
  };
}
