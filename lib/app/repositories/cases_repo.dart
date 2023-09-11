import '../models/case_model.dart';
import '../providers/api_client/case_api.dart';

class CasesRepo {
  Future<List<Case>> getCases() async {
    return CasesApi.getCases();
  }

  Future postCase({required Case request}) async {
    return await CasesApi.postCase(request: request);
  }
}
