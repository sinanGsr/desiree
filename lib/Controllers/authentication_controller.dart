



import 'package:desiree/Services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Presentation/Authentication/register_email.dart';
import '../Presentation/Authentication/register_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();

    Rx<UserCredential?> user = Rx<UserCredential?>(null);

    RxString email = "".obs;
    RxString secondEmail = "".obs;
    RxString password = "".obs;
    RxString secondPassword = "".obs;

    RxString emailError = ''.obs;
    RxString passwordError = "".obs;


    ///For Registration
    RxString name = "".obs;
    RxString nameError = "".obs;

    RxString surname = "".obs;
    RxString surnameError = "".obs;
    RxInt date =0.obs;



    void validateEmailPasswordEmpty() {
      if ( password.isEmpty && email.isEmpty ) {
        passwordError.value = "please Input Password";
        emailError.value = "please Enter Email";
      } else if(password.isEmpty){
        passwordError.value = "please Input Password";
        emailError.value = "";
      }
      else if(email.isEmpty){
        passwordError.value = "";
        emailError.value = "please Enter Email";
      }

      else {
        Get.to(const RegisterScreen());
        print("Password Error and email");
      }
    }


    void validateEmail(){
      if (GetUtils.isEmail(email.value)) {
        emailError.value = '';
      } else {
        emailError.value = 'Invalid email format';
      }
    }

    void validateNameAndSurname(){
     if(name.isEmpty && surname.isEmpty){
       nameError.value = "please enter name";
       surnameError.value = "please enter surname";
     }
     else if(name.isEmpty){
       nameError.value = "please enter name";
       surnameError.value = "";
     }
     else if(surname.isEmpty){
       nameError.value = "";
       surnameError.value = "please enter surname";
     }
     else{
       Get.to(RegisterEmail());

     }
    }



    void setEmail(String value) {
      email.value = value;
    }

    void setPassword(String value) {
      password.value = value;
      passwordError.value = "";
    }
    void setSecondEmail(String value) {
      secondEmail.value = value;
    }
    void setSecondPassword(String value) {
      secondPassword.value = value;
    }

    void setName(String val){
      name.value = val;
      nameError.value = "";
    }
    void setSurName(String val){
      surname.value = val;
      surnameError.value = "";
    }

    void validateForTwoEmails(String first,String second){

      if(first != second ){
        emailError.value = "fields do not match";
        print('first');

      }
      else if(first.isEmpty && secondEmail.isEmpty){
        emailError.value = "fields empty";
      }
      else{
        emailError.value = "";
      }

    }


    Future<bool> signUpWithGoogle() async {
      bool funValue = false;
      await _authService.signUpWithGoogle().then((value){
        if(value !=null){
          user.value = value;
          funValue  =  true;
        }
        else{
          funValue = false;
        }
      });
      return funValue;
    }


  Future<bool> signInWithGoogle() async {
      bool funValue = false;
    await _authService.signInWithGoogle().then((value) {
      print("the value of auth service is ${value}");

      if(value !=null){
        user.value = value;
        funValue  =  true;
      }
      else{
        funValue = false;
      }

      });
      print("the value of auth service is ${funValue}");
      return funValue;



  }




}