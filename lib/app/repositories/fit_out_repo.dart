import 'package:Seef/app/models/message.dart';
import 'package:Seef/app/providers/api_client/fit_out_api.dart';
import 'package:Seef/app/providers/api_client/messages_api.dart';

import '../models/fit_out_model.dart';
import '../models/fit_out_step_model.dart';

class FitOutRepo {
  Future<List<FitOutModel>> getFitOuts() async {
    return FitOutApi.getFitOuts();
  }

  Future<List<FitOutStepModel>> getFitStepsOuts(
      {required String fitOutId}) async {
    return FitOutApi.getFitOutsSteps(fitOutId: fitOutId);
  }
}
