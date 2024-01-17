import 'dart:convert';

import 'package:flutter_danthocode/models/contact/contact_model.dart';
import 'package:flutter_danthocode/widgets/error_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final contactRepositoryProvider = Provider((ref) {
  return ContactRepository();
});

class ContactRepository {
  String baseUrl = 'https://reqres.in/api/users';

  Future<List<ContactModel>> getAllUser() async {
    var res = await http.get(Uri.parse(baseUrl));

    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body)['data'];
      return data.map((e) => ContactModel.fromMap(e)).toList();
    } else {
      throw Exception('No contacts');
    }
  }

  Future<ContactModel> getUserData(String id) async {
    var res = await http.get(Uri.parse('$baseUrl/$id'));

    if (res.statusCode == 200) {
      return ContactModel.fromMap(jsonDecode(res.body)['data'] as Map<String, dynamic>);
    } else {
      throw Exception('Some unexpected error occurs');
    }
  }

  Future<ContactModel> addContact(String firstName, String lastName, String email) async {
    try {
      var res = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
        }),
      );

      if (res.statusCode == 201) {
        return ContactModel.fromMap(jsonDecode(res.body) as Map<String, dynamic>);
      } else {
        print(res.statusCode.toString());
        throw Exception('Failed load data with status code ${res.statusCode}');
      }
    } catch (e) {
      print('Error adding contact: $e');
      throw ErrorText(text: e.toString());
    }
  }

  Future<void> deleteContact(String id) async {
    var res = await http.delete(
      Uri.parse('$baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 204) {
      // return ContactModel.fromMap(jsonDecode(res.body)['data'] as Map<String, dynamic>);
      print('Contact successfully deleted');
    } else {
      throw Exception('Failed to delete contact');
    }
  }

  Future<void> updateContact(String id, String firstName, String lastName, String email) async {
    var res = await http.put(Uri.parse('$baseUrl/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
        }));

    if (res.statusCode != 200) {
      throw Exception('Failed to update contact');
    }
  }
}
