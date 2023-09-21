import 'package:bareeq/app/models/account_model.dart';
import 'package:bareeq/app/models/contact_model.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../helper/cash_helper.dart';

class SessionServices extends GetxService {
  final currentUser = Contact().obs;

  bool hasSession() {
    return sharedPref!.containsKey('user_id') ? true : false;
  }

  setSessionData({required Contact user}) async {
    CashHelper.saveData(key: 'user_fullName', value: user.fullName);
    CashHelper.saveData(key: 'user_email', value: user.emailAddress);
    CashHelper.saveData(key: 'user_job_title', value: user.jobTile);
    CashHelper.saveData(
        key: 'user_parentCustomerId', value: user.accountCustomerId);

    CashHelper.saveData(key: 'user_id', value: user.id);
    CashHelper.saveData(key: 'user_company', value: user.company);
    CashHelper.saveData(key: 'user_country', value: user.country);
    CashHelper.saveData(key: 'user_lastName', value: user.lastName);
    CashHelper.saveData(key: 'user_firstName', value: user.firstName);
    CashHelper.saveData(key: 'user_password', value: user.password);
    CashHelper.saveData(key: 'user_crNumber', value: user.crNumber);
    CashHelper.saveData(key: 'user_cprNumber', value: user.cprNumber);
    CashHelper.saveData(key: 'user_businessPhone', value: user.businessPhone);
    CashHelper.saveData(key: 'user_mobilePhone', value: user.mobilePhone);
    CashHelper.saveData(key: 'user_accountName', value: user.account?.name);
    CashHelper.saveData(key: 'user_accountId', value: user.account?.id);
    CashHelper.saveData(key: 'user_currency', value: user.currency);
    CashHelper.saveData(
        key: 'user_accountPrimaryContactId',
        value: user.account?.primaryContactId);
    CashHelper.saveData(
        key: 'user_accountStatus', value: user.account?.accountStatus);
    CashHelper.saveData(key: 'user_ownerId', value: user.account?.ownerId);
    CashHelper.saveData(
        key: 'user_emailAddress1', value: user.account?.emailAddress);
    CashHelper.saveData(
        key: 'user_accountCrNumber', value: user.account?.crNumber);
    CashHelper.saveData(
        key: 'user_accountType', value: user.account?.accountType);
    CashHelper.saveData(
        key: 'user_accountCbrNumber', value: user.account?.cbrNumber);

    Get.log(
        '======================== user data is saved Successfully ========================');
  }

  getSessionUser() async {
    currentUser.value = Contact(
        fullName: CashHelper.getData(key: 'user_fullName'),
        jobTile: CashHelper.getData(key: 'user_job_title'),
        emailAddress: CashHelper.getData(key: 'user_email'),
        accountCustomerId: CashHelper.getData(key: 'user_parentCustomerId'),
        id: CashHelper.getData(key: 'user_id'),
        company: CashHelper.getData(key: 'user_company'),
        country: CashHelper.getData(key: 'user_country'),
        lastName: CashHelper.getData(key: 'user_lastName'),
        firstName: CashHelper.getData(key: 'user_firstName'),
        password: CashHelper.getData(key: 'user_password'),
        currency: CashHelper.getData(key: 'user_currency'),
        crNumber: CashHelper.getData(key: 'user_crNumber'),
        cprNumber: CashHelper.getData(key: 'user_cprNumber'),
        businessPhone: CashHelper.getData(key: 'user_businessPhone'),
        mobilePhone: CashHelper.getData(key: 'user_mobilePhone'),
        account: Account(
          name: CashHelper.getData(key: 'user_accountName'),
          id: CashHelper.getData(key: 'user_accountId'),
          primaryContactId:
              CashHelper.getData(key: 'user_accountPrimaryContactId'),
          accountStatus: CashHelper.getData(key: 'user_accountStatus'),
          ownerId: CashHelper.getData(key: 'user_ownerId'),
          emailAddress: CashHelper.getData(key: 'user_emailAddress1'),
          crNumber: CashHelper.getData(key: 'user_accountCrNumber'),
          accountType: CashHelper.getData(key: 'user_accountType'),
          cbrNumber: CashHelper.getData(key: 'user_accountCbrNumber'),
        ));
    Get.log(
        '======================== user data is get Successfully ========================');
    return currentUser;
  }
}
