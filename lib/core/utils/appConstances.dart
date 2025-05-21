import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:hive/hive.dart";

final box = Hive.box("theme");
final boxHistory = Hive.box("history");

SizedBox largeSpace = SizedBox(height: 32.h);
SizedBox mediumSpace = SizedBox(height: 20.h);
SizedBox smallSpace = SizedBox(height: 12.h);
SizedBox xsmallSpace = SizedBox(width: 8.h);
const Color scaffoldBackgroundLight = Color(0xFFFFFFFF);
const Color scaffoldBackgroundBlack = Color(0xff1a237e);
