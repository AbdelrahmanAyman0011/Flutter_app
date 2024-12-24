import 'package:flutter/material.dart'; // a package that contains pre-built widgets
import '/constant.dart';
// Use this widget whenever you want a custom-styled button in your app. w b8yr bs l text l 3yzah yzhr 
class CustomButton extends StatelessWidget {
  // b3ml define l new widget esmo custom button 3aml extend l stateless widget y3ny l UI static l7d ma a3ml rebuild tany
  CustomButton(
      {super.key,
      this.onTap,
      required this.text}); // onTap dy function byt3mlha call lma l user bydos 3la el button
  // this.text da l text el hyzhar 3la l button (required y3ny lazm yb2a 3leh text)
  final VoidCallback? onTap; // a function that doesn't return anything
  final String text; // hold l text el hyzhar
  @override
  Widget build(BuildContext context) {
    // method bst3mlha m3 ay widget to build el UI l 5as beha
    return GestureDetector(
      // bt3ml detect lw l user 3ml tap 3 l button
      onTap: onTap, // call l function
      child: Container(
        // box that can hold other widgets h7ot fyh l styling bta3 l button
        decoration: BoxDecoration(
          color: kTextPrimary, // color mt3rf f constant.dart
          borderRadius: BorderRadius.circular(8),  
        ),
        width: double.infinity, // l button hyakhod l width bta3 l screen 
        height: 60,
        child: Center( // l text f nos l button
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
