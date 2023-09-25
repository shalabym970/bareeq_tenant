import 'package:bareeq/app/models/contact_model.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import '../../../../common/strings/error_strings.dart';
import '../../../../common/widgets/ui.dart';
import '../../../repositories/profile_repo.dart';
import '../../../routes/app_routes.dart';
import '../../../services/check_internet_connection_service.dart';
import '../../../services/general_services.dart';

class OtpController extends GetxController {
  final loadingSendingOtp = false.obs;
  final otpController = OtpFieldController();
  final connectionController = Get.find<InternetConnectionController>();
  final profileRepo = ProfileRepo();
  final _contact = Contact().obs;
  String? previousOtp;
  Contact contact = Get.arguments;
  final endTime = (DateTime.now().millisecondsSinceEpoch + 1000 * 90).obs;

  @override
  onInit() {
    previousOtp = contact.otp;
    Get.log('========== previous otp : $previousOtp ==========');
    super.onInit();
  }

  resendOtp() async {
    try {
      loadingSendingOtp.value = true;
      int randomNumber;
      randomNumber = GeneralServices.generateOtp();
      _contact.value = Contact(
          otp: randomNumber.toString(), resetPassword: true, id: contact.id);
      await profileRepo
          .updateProfile(request: _contact.value)
          .then((value) => previousOtp = randomNumber.toString());
      endTime.value = DateTime.now().millisecondsSinceEpoch + 1000 * 90;
    } catch (e) {
      loadingSendingOtp.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.failedToResendOtp));
    } finally {
      loadingSendingOtp.value = false;
    }
  }

  verificationOtp({required String pin}) async {
    try {
      if (pin == previousOtp) {
        loadingSendingOtp.value = true;
        Get.toNamed(Routes.changePassword,arguments: contact);
      } else {
        Ui.showToast(content: ErrorStrings.wrongOtp, error: true);
      }
    } catch (e) {
      loadingSendingOtp.value = false;
      Get.showSnackbar(
          Ui.errorSnackBar(message: ErrorStrings.failedToResendOtp));
    } finally {
      loadingSendingOtp.value = false;
    }
  }
}
