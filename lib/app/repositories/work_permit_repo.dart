import 'package:Seef/app/models/work_permit.dart';

import '../providers/api_client/work_permit_api.dart';

class WorkPermitRepo {
  Future<List<WorkPermit>> getWorkPermits() async {
    return WorkPermitApi.getWorkPermits();
  }
}
