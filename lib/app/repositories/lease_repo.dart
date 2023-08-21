import 'package:Bareeq/app/models/lease_model.dart';

import '../providers/api_client/leases_api.dart';

class LeasesRepo {
  Future<List<LeaseModel>> getLeases() async {
    return LeasesApi.getLeases();
  }
}
