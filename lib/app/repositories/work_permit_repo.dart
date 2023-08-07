import 'package:Seef/app/models/work_permit.dart';

import '../models/work_permit_item.dart';
import '../providers/api_client/work_permit_api.dart';

class WorkPermitRepo {
  Future<List<WorkPermit>> getWorkPermits() async {
    return WorkPermitApi.getWorkPermits();
  }

  Future<List<WorkPermitItem>> getWorkPermitItems(
      {required String workPermitId}) async {
    return WorkPermitApi.getWorkPermitItems(workPermitId: workPermitId);
  }
}
