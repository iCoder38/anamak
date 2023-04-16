import 'package:anamak_two/classes/phone_number_verification/opt_verification/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberValidationScreen extends StatefulWidget {
  const PhoneNumberValidationScreen({super.key});

  @override
  State<PhoneNumberValidationScreen> createState() =>
      _PhoneNumberValidationScreenState();
}

class _PhoneNumberValidationScreenState
    extends State<PhoneNumberValidationScreen> {
  //
  TextEditingController countryController = TextEditingController();
  //

  var saveEnteredPhoneNumber = '';

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();

    //
    // funcPhoneNumberFirebaseAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Phone Number',
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/phone_number_verification.png',
                width: 400,
                height: 400,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Please enter your phone number to login. why?",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  if (kDebugMode) {
                    print('ok${phone.completeNumber}');
                  }
                  //
                  saveEnteredPhoneNumber = phone.completeNumber;
                  if (kDebugMode) {
                    // print(save_entered_phone_number);
                  }
                  //
                  //
                },
              ),

              /*Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        if (kDebugMode) {
                          print('ok${phone.completeNumber}');
                        }
                        //
                        // save_entered_phone_number = phone.completeNumber;
                        if (kDebugMode) {
                          // print(save_entered_phone_number);
                        }
                        //
                      },
                    ),
                  ],
                ),
              ),*/
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    // Navigator.pushNamed(context, 'verify');
                    //
                    if (kDebugMode) {
                      print('phone number is =====>$saveEnteredPhoneNumber');
                    }
                    funcValidatePhoneNumberViaFirebasePhoneAuth();
                    //
                  },
                  child: const Text(
                    "Send the code",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //
  //
  funcValidatePhoneNumberViaFirebasePhoneAuth() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: saveEnteredPhoneNumber.toString(),
      verificationCompleted: (PhoneAuthCredential credential) {
        if (kDebugMode) {
          print('VERIFICATION COMPLETE');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) {
          print('VERIFICATION FAILED');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        if (kDebugMode) {
          print('VERIFICATION ID=====> $verificationId');
          print('RESENT TOKEN =======> $resendToken');
        }
        // push to OTP SCREEN
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyVerify(
              getVerificationId: verificationId,
              resendToken: resendToken,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (kDebugMode) {
          // print('TIME OUT');
          print('VERIFICATION ID=====> $verificationId');
        }
      },
    );
  }

  //
  //
}
