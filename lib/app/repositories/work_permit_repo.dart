import 'package:Bareeq/app/models/work_permit.dart';
import '../models/account_model.dart';
import '../models/unit.dart';
import '../models/work_permit_item.dart';
import '../providers/api_client/work_permit_api.dart';

class WorkPermitRepo {
  Future<List<WorkPermit>> getWorkPermits() async {
    return await WorkPermitApi.getWorkPermits();
  }

  Future<List<WorkPermitItem>> getWorkPermitItems(
      {required String workPermitId}) async {
    return await WorkPermitApi.getWorkPermitItems(workPermitId: workPermitId);
  }

  Future<List<Unit>> getRelatedUnites() async {
    return await WorkPermitApi.getRelatedUnits();
  }

  Future<List<Account>> getContractors() async {
    return await WorkPermitApi.getContractors();
  }

  Future<String> postWorkPermit({required WorkPermit request}) async {
    return await WorkPermitApi.postWorkPermit(request: request);
  }

  Future postWorkPermitItem({required WorkPermitItem request}) async {
    return await WorkPermitApi.postWorkPermitItem(request: request);
  }
}
