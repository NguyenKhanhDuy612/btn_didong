
import 'package:flutter/material.dart';

ValidateString(String? value) {
  return value ==""|| value!.isEmpty ? "Bạn chưa nhập dữ liệu" : null;
}

ValidatePassCfm(String? value, String pass) {
  return value != pass || value!.isEmpty ? "Password không khớp" : null;
}