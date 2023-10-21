import 'package:flutter/material.dart';


Widget loadingIndicator( {circleColor = Colors.white}){
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red),
    ),
  );
}