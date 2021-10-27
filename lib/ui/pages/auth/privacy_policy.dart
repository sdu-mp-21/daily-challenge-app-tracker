import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange.shade300,),
      body: Container(
        margin: const EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 30),
        child:RichText(
      text: const TextSpan(
        style: TextStyle(color: Colors.black,
            fontSize: 14.0,
            fontFamily: 'Indies'),
        children: <TextSpan> [
          TextSpan(text: 'Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: '\nKati & Lima built the 21 Days Challenge app as an Ad Supported app. This SERVICE is provided by Kati & Lima at no cost and is intended for use as is. This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service. If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this vacy Policy. The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at 21 Days Challenge unless otherwise defined in this Privacy Policy.'),
          TextSpan(text: '\nInformation Collection and Use\n', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: 'For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to Crashes, Counters. The information that I request will be retained on your device and is not collected by me in any way.'),
          TextSpan(text: '\nLog Data\n', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: 'I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log'
        'Data. This Log Data may include information such as your'
        'device Internet Protocol ("IP") address, device name,'
          'operating system version, the configuration of the app'
          'when utilizing my Service, the time and date of your use'
          'of the Service, and other statistics.'),
          TextSpan(text: '\nPrivacy Policy\n', style: TextStyle(fontWeight: FontWeight.bold)),




        ]
      )

        )
    ),
    );
  }


}



