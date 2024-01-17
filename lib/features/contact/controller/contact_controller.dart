import 'dart:math';

import 'package:flutter_danthocode/constant/asset_constant.dart';
import 'package:flutter_danthocode/features/contact/repository/contact_repository.dart';
import 'package:flutter_danthocode/models/contact/contact_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactControllerProvider = StateNotifierProvider((ref) {
  final contactRepository = ref.watch(contactRepositoryProvider);
  return ContactController(contactRepository: contactRepository);
});

final getAllUserProvider = FutureProvider((ref) {
  final contactController = ref.watch(contactControllerProvider.notifier);
  return contactController.getAllUser();
});

final getUserDataProvider = FutureProvider.family((ref, String id) async {
  final contactController = ref.watch(contactControllerProvider.notifier);
  return contactController.getUserData(id);
});

final deleteContactProvider = FutureProvider.family((ref, String id) async {
  final contactController = ref.watch(contactControllerProvider.notifier);
  return contactController.deleteContact(id);
});

class ContactController extends StateNotifier<bool> {
  final ContactRepository _contactRepository;
  ContactController({required ContactRepository contactRepository})
      : _contactRepository = contactRepository,
        super(false);

  Future<List<ContactModel>> getAllUser() async {
    final res = _contactRepository.getAllUser();
    return res;
  }

  Future<ContactModel> getUserData(String id) async {
    return _contactRepository.getUserData(id);
  }

  Future<ContactModel> addContact({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    return _contactRepository.addContact(firstName, lastName, email);
  }

  void deleteContact(String id) async {
    return _contactRepository.deleteContact(id);
  }

  void updateContact(String id, String firstName, String lastName, String email) async {
    return _contactRepository.updateContact(id, firstName, lastName, email);
  }
}
