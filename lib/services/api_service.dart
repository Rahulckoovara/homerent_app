import 'dart:convert';

import 'package:http/http.dart';
import 'package:tappal_app/common/storage_utils.dart';
import 'package:tappal_app/common/toast_type.dart';
import 'package:tappal_app/common/utils.dart';
import 'package:tappal_app/config/customConstants.dart';

final storageutils = Storageutils();

class APIService {
  Future<dynamic> postData({
    required String path,
    required Map<String, dynamic> inputData,
    required Function(bool) setLoadingState,
    //required bool isSessionNeedtoStore
  }) async {
    setLoadingState(true);

    final uri = Uri.parse(path);
    String? tokenNullable =
        await storageutils.read(CustomConstants.storageToken);

    try {
      final response = await post(
        uri,
        headers: getApiHeaders(tokenNullable ?? ""),
        body: jsonEncode(inputData),
      );
      //  print("wwwwwwwwwwwwwwwww$response");
      if (response.statusCode == 200) {
        print(response.statusCode);
        return jsonDecode(response.body);
        // Return success response data
      } else {
        toast('server error', 'Check after some time', ToastType.error);
      }
    } catch (e) {
      print('catchhhhhhhhError: $e');
      toast('Server erroRRRr', 'Check after some time', ToastType.error);
    } finally {
      setLoadingState(false);
    }
  }

  Future<dynamic> fetchDataWithoutQuery({
    required String path,
    required Function(bool) setLoadingState,
  }) async {
    // Set loading state to true
    setLoadingState(true);
    String? tokenNullable =
        await storageutils.read(CustomConstants.storageToken);
    try {
      var url = Uri.parse(path);
      final response = await get(
        url,
        headers: getApiHeaders(tokenNullable ?? ""),
      );
      if (response.statusCode == 200) {
        var responseBody = response.body;
        return jsonDecode(responseBody); // Return success response data
      } else {
        toast('server error', 'Check after some time', ToastType.error);
      }
    } catch (e) {
      toast('Server erroRRRr', 'Check after some time', ToastType.error);
      // Handle the error
    } finally {
      setLoadingState(false); // Set loading state to false
    }
  }
}
