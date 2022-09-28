import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiCall {
  final String baseUrl = 'https://63330a7aa54a0e83d25ea723.mockapi.io/api/v1';

  // get request
  Future<dynamic> getData(String path) async {
    final url = Uri.parse(baseUrl + path);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        Get.snackbar('Error', ' unable to load data',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } catch (err) {
      Get.snackbar('Error', err.toString());
    }
  }

  // post request
  Future<dynamic> postData(
    String path,
    dynamic load,
  ) async {
    final url = Uri.parse(baseUrl + path);
    try {
      final response = await http.post(
        url,
        body: jsonEncode(load),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        Get.snackbar('Error', ' unable to load data',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } catch (err) {
      Get.snackbar('Error', err.toString());
    }
  }

  // put request
  Future<dynamic> putData(String path, dynamic load) async {
    // final reqLoad = {'id': load};
    final url = Uri.parse(baseUrl + path);
    try {
      final response = await http.put(
        url,
        body: jsonEncode(load),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        Get.snackbar('Error', ' unable to load data',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } catch (err) {
      Get.snackbar('Error', err.toString());
    }
  }
}
