import 'package:Bareeq/app/models/work_permit.dart';
import '../models/unit.dart';
import '../models/work_permit_item.dart';
import '../providers/api_client/work_permit_api.dart';

class WorkPermitRepo {
  Future<List<WorkPermitModel>> getWorkPermits() async {
    return WorkPermitApi.getWorkPermits();
  }

  Future<List<WorkPermitItem>> getWorkPermitItems(
      {required String workPermitId}) async {
    return WorkPermitApi.getWorkPermitItems(workPermitId: workPermitId);
  }

  Future<List<Unit>> getRelatedUnites() async {
    return WorkPermitApi.getRelatedUnits();
  }
}
