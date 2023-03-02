import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ntlm/ntlm.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final recoverFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final recoverEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisible = true.obs;

  login() async{
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState?.save();
      var client = NTLMClient(
        domain: 'blive',
        workstation: "LAPTOP",
        username: emailController.text,
       password: passwordController.text,
      );

     var response = await client.get(Uri.parse('http://d365.blive.me/bar/api/data/v9.1/leads')) ;
     print(response.body);
    }
  }
}
