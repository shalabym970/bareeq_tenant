import 'package:bareeq/app/models/leased_property.dart';
import 'package:bareeq/app/models/sold_property.dart';

import '../providers/api_client/properties_api.dart';

class PropertiesRepo {
  Future<List<LeasedProperty>> getLeasedProperties() async {
    return PropertiesApi.getLeasedProperties();
  }

  Future<List<SoldProperty>> getSoldProperties() async {
    return PropertiesApi.getSoldProperties();
  }
}
