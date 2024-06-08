import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
class IntroductionView extends StatelessWidget {
const IntroductionView({ super.key });

  get listPagesViewModel => [
    PageViewModel(
      title: "Scan Your Phone",
      body: "Detect and remove viruses, malware, and other malicious software before they can harm your device.",
      image: Center(child: Image.asset("assets/images/scan.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Update Your Apps",
      body: "Keep your apps up to date to protect your device from security vulnerabilities.",
      image: Center(child: Image.asset("assets/images/update.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Generate Strong keys",
      body: "Use strong, unique passwords to protect your accounts from unauthorized access.",
      image: Center(child: Image.asset("assets/images/generate_key.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
  
  ];

  @override
  Widget build(BuildContext context){
    return IntroductionScreen(
  pages: listPagesViewModel,
  showNextButton: false,
  done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600) ),
  onDone: () {
    context.go('/');
    // On button pressed
  },
);
  }
}