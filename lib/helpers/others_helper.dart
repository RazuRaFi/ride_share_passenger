


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../utils/app_colors.dart';

class OtherHelper {
  static RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp passRegExp = RegExp(r'(?=.*[a-z])(?=.*[0-9])');

  static String? validator(value) {
    if (value.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  static String? emailValidator(
      value,
      ) {
    if (value!.isEmpty) {
      return "This field is required".tr;
    } else if (!emailRegexp.hasMatch(value)) {
      return "Enter valid email".tr;
    } else {
      return null;
    }
  }

  static String? passwordValidator(value) {
    if (value.isEmpty) {
      return "This field is required".tr;
    } else if (value.length < 8) {
      return "Password must be 8 characters & contain both \nalphabets and numerics"
          .tr;
    } else if (!passRegExp.hasMatch(value)) {
      return "Password must be 8 characters & contain both \nalphabets and numerics"
          .tr;
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(value, passwordController) {
    if (value.isEmpty) {
      return "This field is required".tr;
    } else if (value != passwordController.text) {
      return "The password does not match".tr;
    } else {
      return null;
    }
  }

  static Future<String> openDatePicker(
      TextEditingController controller,
      ) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme:  const ColorScheme.light(
              primary: AppColors.white,
            ),
          ),
          child: child!),
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = "${picked.year}/${picked.month}/${picked.day}";
      return picked.toIso8601String();
    }

    return "";
  }

  static Future<String?> openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (getImages == null) return null;

    if (kDebugMode) {
      print(getImages.path);
    }

    return getImages.path;
  }

  static Future<String?> openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
    await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (getImages == null) return null;

    if (kDebugMode) {
      print(getImages.path);
    }

    return getImages.path;
  }


  static Future<String?> getVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
    await picker.pickVideo(source: ImageSource.gallery);
    if (getImages == null) return null;

    if (kDebugMode) {
      print(getImages.path);
    }

    return getImages.path;
  }

  //Pick Image from Camera


  static Future<String> openTimePicker(TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      controller.text =
      "${picked.hour} : ${picked.minute < 10 ? "0${picked.minute}" : picked.minute}";
      return "${picked.hour}:${picked.minute < 10 ? "0${picked.minute}" : picked.minute}";
    }
    return '';
  }

  static String formatDateTime(String dateStr, String timeStr) {
    try {
      DateTime dateTime = DateTime.parse(dateStr);
      String formattedDate = DateFormat('d MMM yyyy').format(dateTime);
      return '$formattedDate, $timeStr';
    } catch (e) {
      return '';
    }
  }


  static String formatDate(String dateTimeStr) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeStr);
      return DateFormat('d MMM yyyy, h:mm a').format(dateTime);
    } catch (e) {
      return '';
    }
  }

  static String formatDateAgo(String dateTimeStr) {
    try {
      DateTime dateTime = DateTime.parse(dateTimeStr);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inSeconds < 60) {
        return '${difference.inSeconds} seconds ago';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} minutes ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours} hours ago';
      } else if (difference.inDays == 1) {
        return 'Yesterday';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays < 30) {
        return '${(difference.inDays / 7).floor()} weeks ago';
      } else {
        return DateFormat('d MMM yyyy, h:mm a').format(dateTime); // fallback
      }
    } catch (e) {
      return '';
    }
  }
}
