import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCaseController extends GetxController {
  final caseTitleController = TextEditingController();
  final requestDetailsController = TextEditingController();
  final caseTypeValue = 'Problem';
  final caseTypeList = <String>['Problem', 'Test', 'Test', 'Test'];
  final natureOfCaseValue = 'Contractual - Price';
  final natureOfCaseList = <String>[
    'Contractual - Price',
    'Test',
    'Test',
    'Test'
  ];
  final relatedUnitValue = 'Unit 10 - Building 8';
  final relatedUnitList = <String>[
    'Unit 10 - Building 8',
    'Test',
    'Test',
    'Test'
  ];
  final relatedLeaseValue = 'Unit 10 - Building 8';
  final relatedLeaseList = <String>[
    'Unit 10 - Building 8',
    'Test',
    'Test',
    'Test'
  ];
}
