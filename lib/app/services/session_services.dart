import 'package:Bareeq/app/models/account_model.dart';
import 'package:Bareeq/app/models/contact_model.dart';
import 'package:get/get.dart';

import '../../main.dart';

class SessionServices extends GetxService {
  final currentUser = const Contact().obs;

  bool hasSession() {
    return sharedPref!.containsKey('user_id') ? true : false;
  }

  setSessionData({required Contact user}) async {
    sharedPref!.setString('user_fullName', user.fullName.toString());
    sharedPref!.setString('user_email', user.emailAddress.toString());
    sharedPref!
        .setString('user_customerSizeCode', user.customerSizeCode.toString());
    sharedPref!.setString('user_callback', user.callback.toString());
    sharedPref!.setString('user_job_title', user.jobTile.toString());
    sharedPref!
        .setString('user_parentCustomerId', user.accountCustomerId.toString());
    sharedPref!.setString(
        'user_transactionCurrencyId', user.transactionCurrencyId.toString());
    sharedPref!.setString('user_id', user.id.toString());
    sharedPref!.setString('user_company', user.company.toString());
    sharedPref!.setString('user_country', user.country.toString());
    sharedPref!.setString('user_department', user.department.toString());
    sharedPref!.setString('user_lastName', user.lastName.toString());
    sharedPref!.setString('user_firstName', user.firstName.toString());
    sharedPref!.setString('user_password', user.password.toString());
    sharedPref!.setString('user_crNumber', user.crNumber.toString());
    sharedPref!.setString('user_cprNumber', user.cprNumber.toString());
    sharedPref!.setString('user_businessPhone', user.businessPhone.toString());
    sharedPref!.setString('user_mobilePhone', user.mobilePhone.toString());
    sharedPref!.setString('user_accountName', user.account!.name.toString());
    sharedPref!.setString('user_accountId', user.account!.id.toString());
    sharedPref!.setString('user_accountPrimaryContactId',
        user.account!.primaryContactId.toString());
    sharedPref!.setString(
        'user_accountStatus', user.account!.accountStatus.toString());
    sharedPref!.setString('user_ownerId', user.account!.ownerId!);
    sharedPref!
        .setString('user_emailAddress1', user.account!.emailAddress.toString());
    sharedPref!
        .setString('user_accountCrNumber', user.account!.crNumber.toString());
    sharedPref!
        .setString('user_accountType', user.account!.accountType.toString());
    sharedPref!
        .setString('user_accountCbrNumber', user.account!.cbrNumber.toString());
    sharedPref!.setString('user_accountTransactionCurrencyId',
        user.account!.transactionCurrencyId.toString());

    Get.log(
        '======================== user data is saved Successfully ========================');
  }

  getSessionUser() async {
    currentUser.value = Contact(
      fullName: sharedPref!.getString('user_fullName'),
      jobTile: sharedPref!.getString('user_job_title'),
      emailAddress: sharedPref!.getString('user_email'),
      customerSizeCode: sharedPref!.getString('user_customerSizeCode') != null
          ? int.parse(sharedPref!.getString('user_customerSizeCode')!)
          : 0,
      callback: sharedPref!.getString('user_callback'),
      accountCustomerId: sharedPref!.getString('user_parentCustomerId'),
      transactionCurrencyId:
          sharedPref!.getString('user_transactionCurrencyId'),
      id: sharedPref!.getString('user_id'),
      company: sharedPref!.getString('user_company'),
      country: sharedPref!.getString('user_country'),
      department: sharedPref!.getString('user_department'),
      lastName: sharedPref!.getString('user_lastName'),
      firstName: sharedPref!.getString('user_firstName'),
      password: sharedPref!.getString('user_password'),
      crNumber: sharedPref!.getString('user_crNumber') != null
          ? int.parse(sharedPref!.getString('user_crNumber')!)
          : 0,
      cprNumber: sharedPref!.getString('user_cprNumber') != null
          ? int.parse(sharedPref!.getString('user_cprNumber')!)
          : 0,
      businessPhone: sharedPref!.getString('user_businessPhone'),
      mobilePhone: sharedPref!.getString('user_mobilePhone'),
      account: Account(
        name: sharedPref!.getString('user_accountName'),
        id: sharedPref!.getString('user_accountId'),
        primaryContactId: sharedPref!.getString('user_accountPrimaryContactId'),
        accountStatus: sharedPref!.getString('user_accountStatus') != 'null'
            ? int.parse(sharedPref!.getString('user_accountStatus')!)
            : 0,
        ownerId: sharedPref!.getString('user_ownerId'),
        emailAddress: sharedPref!.getString('user_emailAddress1'),
        crNumber: sharedPref!.getString('user_accountCrNumber') != 'null'
            ? int.parse(sharedPref!.getString('user_accountCrNumber')!)
            : 0,
        accountType: sharedPref!.getString('user_accountType') != 'null'
            ? int.parse(sharedPref!.getString('user_accountType')!)
            : 0,
        cbrNumber: sharedPref!.getString('user_accountCbrNumber'),
        transactionCurrencyId:
            sharedPref!.getString('user_accountTransactionCurrencyId'),
      ),
    );
    Get.log('=========== Current user : ${currentUser.value.id} ==========');
    Get.log(
        '=========== account user : ${currentUser.value.accountCustomerId} ==========');
  }
}
//gvDPPl5e
