import 'package:flutter/material.dart';
import 'package:flutter_danthocode/features/contact/controller/contact_controller.dart';
import 'package:flutter_danthocode/features/contact/screen/add_user_screen.dart';
import 'package:flutter_danthocode/widgets/contact_card.dart';
import 'package:flutter_danthocode/widgets/error_text.dart';
import 'package:flutter_danthocode/widgets/loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  void refreshContacts() {
    ref.read(getAllUserProvider).whenData((contacts) async {
      ref.refresh(getAllUserProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'Search',
                suffixIcon: const Icon(Icons.search_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          ref.watch(getAllUserProvider).when(
              data: (data) {
                if (data.isNotEmpty) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final contact = data[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(contact.avatar),
                            ),
                            title: Text(
                              '${contact.firstName} ${contact.lastName}',
                            ),
                            subtitle: Text(contact.email),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                ref.read(contactControllerProvider.notifier).deleteContact(contact.id);
                              },
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ContactCard(
                                    id: contact.id,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  );
                }
                return const ErrorText(text: 'No Contact Added');
              },
              error: (error, stackTrace) => ErrorText(
                    text: error.toString(),
                  ),
              loading: () => const Loading()),
        ],
      ),
      floatingActionButton: GestureDetector(
        child: const CircleAvatar(
          radius: 28,
          child: Icon(Icons.add),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const AddContactScreen(),
            ),
          );
        },
      ),
    );
  }
}
