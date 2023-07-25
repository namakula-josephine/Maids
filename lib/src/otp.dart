import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maidmatch_app/comp/custom_button.dart';
import 'package:maidmatch_app/provider/auth_provider.dart';
import 'package:maidmatch_app/src/setupUser.dart';
import 'package:maidmatch_app/utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading = 
    Provider.of<AuthProvider>(context, listen:true).isLoading;
  return Scaffold(
     backgroundColor: Styles.backgColor,
      body:ListView(
          padding: const EdgeInsets.symmetric(horizontal:25 , vertical: 45),
          children: [
            isLoading == true? const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrangeAccent,
              ),
            ):
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.of(context),
                child: const Icon(Icons.arrow_back),
              ),
            ),
                Container(
                width: 150,
                height: 100,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 255, 255)
                ),
                child: Image.asset("assets/logo.jpg",
                height: 100,
                ),
              ),
              Gap(30),
              Text("Verification", style: Styles.headlineStyle2,textAlign: TextAlign.center, ),
              Gap(10),
              Text("Enter the OTP code send to your number", style: Styles.headlineStyle4,
              textAlign: TextAlign.center, ),
              Gap(50),
              Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orangeAccent)
                  ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),

                ),
              onCompleted: (value){
                setState(() {
                 otpCode = value; 
                });
              },
              ),

              Gap(50),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: customButton(
                  text: "Verify", 
                  onPressed: () {
                    if(otpCode != null){
                      verifyotp(context, otpCode!);
                    }else{
                      showSnackBar(context, "Enter 6-Digit code");
                    }
                  }),
              ),

              Gap(20),
              const Text("Didn't receive any code ? ", style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
              textAlign:TextAlign.center,),
              Gap(15),
              const Text("Resend new code", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
              textAlign:TextAlign.center,),
            
          ],

          )
    );
  }

  void verifyotp(BuildContext context, String userOtp){
    final ap = Provider.of<AuthProvider>(context, listen:false);
    ap.verifyOtp(
      context: context, 
      verificationId: widget.verificationId, 
      userOtp: userOtp,
       onSuccess: (){
        //check whether user exits in the db
        ap.checkExistingUser().then((value) async {
         if(value == true){
          //user exists
          
         }else{
          //new user
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) => const Userinfo()),
            (route) => false); 
         }
        });
       });
  }


}

