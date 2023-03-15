import '../models/case_model.dart';
import '../providers/api_client_provider.dart';

class CasesRepository {
  Future<List<Case>> getCases() async {
    return ApiClientProvider.getCases();
  }
}
