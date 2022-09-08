import 'dart:convert';

import 'package:grift_shop/data/constants/constants.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  String get inCaps {
    if (isEmpty) {
      return '';
    }

    if (length < 2) {
      return this[0].toUpperCase();
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get capitalizeFirstOfEach {
    if (isEmpty) {
      return '';
    }
    return toLowerCase().split(' ').map((str) => str.inCaps).join(' ');
  }

  String get trimAll {
    if (isEmpty) {
      return '';
    }
    return replaceAll(RegExp(r'\s+'), '');
  }

  String get sanitizeNumberWithoutIndia {
    var mobile = trimAll;
    mobile = mobile.replaceAll('-', '');
    var perfectMobile = RegExp(r'^\+(?:[0-9]●?){6,14}[0-9]$');
    return perfectMobile.hasMatch(mobile) ? mobile.substring(3) : mobile;
  }

  String get removeSpecialCharacter {
    if (isEmpty) {
      return '';
    }
    return replaceAll(RegExp(r'(?:_|[^\w\s])+'), ' ');
  }

  String get base64Encode {
    var stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(this);
  }

  String get base64Decode {
    var stringToBase64 = utf8.fuse(base64);
    return stringToBase64.decode(this);
  }

  String get formatAccountNumber {
    if (length > 5) {
      return substring(
        length - 6,
        length,
      ).replaceAll('*', 'X');
    }
    return replaceAll('*', 'X');
  }

  String get removeCurrencyFormatter {
    return replaceAll('₹', '').replaceAll(',', '').trimAll;
  }

  Color toColor({Color? defaultColor}) {
    var hexColor = toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    var colorInt = int.tryParse(hexColor, radix: 16);

    if (colorInt == null) {
      return defaultColor ?? AppColors.blanceBrightPurple;
    }

    return Color(colorInt);
  }
}
