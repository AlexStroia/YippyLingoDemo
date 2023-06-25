import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:yippy_lingo_demo/core/domain/model/network_failure.dart';

class NetworkClient {
  final String baseUrl;

  NetworkClient({required this.baseUrl});

  Future<Either<NetworkFailure, http.Response>> get({
    required String path,
    String? params,
  }) async {
    final url = Uri.https(baseUrl, params != null ? "$path/$params" : path);
    try {
      final response = await http.get(
        url,
        headers: _getHeaders(),
      );
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      return Left(NetworkFailure());
    }
  }

  Future<Either<NetworkFailure, http.Response>> post({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.https(baseUrl, path);
    try {
      final response = await http.post(
        url,
        headers: _getHeaders(),
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      return Left(NetworkFailure());
    }
  }

  Future<Either<NetworkFailure, http.Response>> put({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.https(baseUrl, path);
    try {
      final response = await http.put(
        url,
        headers: _getHeaders(),
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      return Left(NetworkFailure());
    }
  }

  Future<Either<NetworkFailure, http.Response>> delete({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.https(baseUrl, path);
    try {
      final response = await http.delete(
        url,
        headers: _getHeaders(),
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      return Left(NetworkFailure());
    }
  }

  Map<String, String> _getHeaders() => {
        'accept': '*/*',
        'Content-Type': 'application/json',
      };
}
