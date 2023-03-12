import 'package:Seef/app/models/account_model.dart';
import 'package:Seef/app/models/contact_model.dart';
import 'package:get/get.dart';

import '../../main.dart';

class SettingServices extends GetxService {
  final currentUser = const Contact().obs;

  // bool hasSession() {
  //  // return sharedPref!.containsKey('player_name') ? true : false;
  // }

  void setSessionData({required Contact user}) async {
    sharedPref!.setString('user_fullName', user.fullName ?? '');
    sharedPref!.setString('user_email', user.emailAddress!);
    sharedPref!
        .setString('user_customerSizeCode', user.customerSizeCode.toString());
    sharedPref!.setString('user_callback', user.callback ?? '');
    sharedPref!.setString('user_parentCustomerId', user.parentCustomerId ?? '');
    sharedPref!.setString(
        'user_transactionCurrencyId', user.transactionCurrencyId ?? '');
    sharedPref!.setString('user_id', user.id!);
    sharedPref!.setString('user_company', user.company ?? '');
    sharedPref!.setString('user_country', user.country ?? '');
    sharedPref!.setString('user_department', user.department ?? '');
    sharedPref!.setString('user_lastName', user.lastName ?? '');
    sharedPref!.setString('user_firstName', user.firstName ?? "");
    sharedPref!.setString('user_password', user.password!);
    sharedPref!.setString('user_crNumber', user.crNumber.toString());
    sharedPref!.setString('user_cprNumber', user.cprNumber.toString());
    sharedPref!.setString('user_businessPhone', user.businessPhone ?? '');
    sharedPref!.setString('user_mobilePhone', user.mobilePhone ?? '');
    sharedPref!.setString('user_accountName', user.account!.name ?? '');
    sharedPref!.setString('user_accountId', user.account!.id ?? '');
    sharedPref!.setString(
        'user_accountPrimaryContactId', user.account!.primaryContactId ?? '');
    sharedPref!.setString(
        'user_accountStatus', user.account!.accountStatus.toString());
    sharedPref!.setString('user_ownerId', user.account!.ownerId!);
    sharedPref!
        .setString('user_emailAddress1', user.account!.emailAddress ?? '');
    sharedPref!
        .setString('user_accountCrNumber', user.account!.crNumber.toString());
    sharedPref!
        .setString('user_accountType', user.account!.accountType.toString());
    sharedPref!
        .setString('user_accountCbrNumber', user.account!.cbrNumber ?? '');
    sharedPref!.setString('user_accountTransactionCurrencyId',
        user.account!.transactionCurrencyId ?? '');

    Get.log(
        '======================== user data is saved Successfully ========================');
  }

  void getSessionUser() async {
    currentUser.value = Contact(
      fullName: sharedPref!.getString('user_fullName'),
      emailAddress: sharedPref!.getString('user_email'),
      customerSizeCode:
          int.parse(sharedPref!.getString('user_customerSizeCode') ?? ''),
      callback: sharedPref!.getString('user_callback'),
      parentCustomerId: sharedPref!.getString('user_parentCustomerId'),
      transactionCurrencyId:
          sharedPref!.getString('user_transactionCurrencyId'),
      id: sharedPref!.getString('user_id'),
      company: sharedPref!.getString('user_company'),
      country: sharedPref!.getString('user_country'),
      department: sharedPref!.getString('user_department'),
      lastName: sharedPref!.getString('user_lastName'),
      firstName: sharedPref!.getString('user_firstName'),
      password: sharedPref!.getString('user_password'),
      crNumber: int.parse(sharedPref!.getString('user_crNumber') ?? ''),
      cprNumber: int.parse(sharedPref!.getString('user_cprNumber') ?? ''),
      businessPhone: sharedPref!.getString('user_businessPhone'),
      mobilePhone: sharedPref!.getString('user_mobilePhone'),
      account: Account(
        name: sharedPref!.getString('user_accountName'),
        id: sharedPref!.getString('user_accountId'),
        primaryContactId: sharedPref!.getString('user_accountPrimaryContactId'),
        accountStatus:
            int.parse(sharedPref!.getString('user_accountStatus') ?? ''),
        ownerId: sharedPref!.getString('user_ownerId'),
        emailAddress: sharedPref!.getString('user_emailAddress1'),
        crNumber:
            int.parse(sharedPref!.getString('user_accountCrNumber') ?? ''),
        accountType: int.parse(sharedPref!.getString('user_accountType') ?? ''),
        cbrNumber: sharedPref!.getString('user_accountCbrNumber'),
        transactionCurrencyId:
            sharedPref!.getString('user_accountTransactionCurrencyId'),
      ),
    );
  }
}
