import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:maidmatch_app/comp/custom_button.dart';
import 'package:maidmatch_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../utils/app_styles.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "256", 
    countryCode: "UG", 
    e164Sc: 0, 
    geographic: true, 
    level: 1, 
    name: "Uganda", 
    example: "Uganda", 
    displayName: "Uganda",
    displayNameNoCountryCode: "UG",
    e164Key: "",
     );

  @override
  Widget build(BuildContext context) {
    phoneController.selection =TextSelection.fromPosition(
      TextPosition(offset:phoneController.text.length, ),
    );
    return Scaffold(
      backgroundColor: Styles.backgColor,
      body: ListView(  
          padding: const EdgeInsets.symmetric(horizontal:25 , vertical: 45),
            children: [
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
              Text("Registration", style: Styles.headlineStyle2,textAlign: TextAlign.center, ),
              Gap(10),
              Text("Add your Phone Number we will send you a Verification Code", style: Styles.headlineStyle4,
              textAlign: TextAlign.center, ),
              Gap(50),
              TextFormField(
                cursorColor: Colors.orangeAccent,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                controller: phoneController ,
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter phone number",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.black26,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme:const CountryListThemeData(
                            bottomSheetHeight: 500,
                          ),
                          onSelect:(value){
                          setState(() {
                            selectedCountry = value;
                          });
                        });
                      },
                      child: Text("${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                      style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),)
                    ),
                  ),
                  suffixIcon: phoneController.text.length > 8 ? Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.greenAccent,
 
                    ),
                    child: const Icon(Icons.done, color: Colors.white, size: 20,),
                  ) : null,
                ),
              ),
              Gap(50),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: customButton(text: "Login", 
                onPressed: () => sendPhoneNumber()
                ),
              ),
            ],
          ),
           );
  }
 void sendPhoneNumber(){
  final ap = Provider.of<AuthProvider>(context, listen: false);
  String phoneNumber = phoneController.text.trim();
  ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
 }

}