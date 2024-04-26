import 'package:flutter/material.dart';

void logger(dynamic message, [String? hint]) {
  debugPrint("\n***** ${hint ?? "LOGGER"} *****");
  debugPrint(message.toString());
  debugPrint("***** ${hint ?? "LOGGER"} *****\n");
}
