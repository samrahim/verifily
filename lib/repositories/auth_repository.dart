import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:verifily/const.dart';

class AuthRepository {
  String currentCustomerId = '';
  Future<Response> registerCostumer({required String fullname}) async {
    print("func start work");
    final body = {"full_name": fullname};
    final response = await http.post(
      Uri.parse(
        "$baseUrl/customers/create",
      ),
      body: json.encode(body),
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json'
      },
      encoding: Encoding.getByName("utf-8"),
    );

    return response;
  }

  Future<int> sendFrontAndBackId(
      {required String customerId,
      required String frontId,
      required String backId}) async {
    var url = Uri.parse('$baseUrl/onboarding/$customerId/ocr');

    var request = http.MultipartRequest('POST', url);

    request.headers.addAll({
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    request.fields['type'] = 'idcard';

    request.files.add(await http.MultipartFile.fromPath('fornt_ID', frontId));
    request.files.add(await http.MultipartFile.fromPath('back_ID', backId));

    final response = await request.send();

    return response.statusCode;
  }

  Future<int> sendSelfiImageRequest(
      {required String customerId, required String faceImagePath}) async {
    var url = Uri.parse('$baseUrl/onboarding/$customerId/face_match');

    var request = http.MultipartRequest('POST', url);

    request.headers.addAll({
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    request.files.add(await http.MultipartFile.fromPath(
      'Image',
      faceImagePath,
    ));
    var response = await request.send();
    return response.statusCode;
  }

  sendInspectionRequest({required String customerId}) async {
    final String url = '$baseUrl/onboarding/$customerId/ispection';

    await http.post(
      Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }
}