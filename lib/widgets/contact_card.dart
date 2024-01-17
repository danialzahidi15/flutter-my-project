import 'package:flutter/material.dart';
import 'package:flutter_danthocode/features/contact/controller/contact_controller.dart';
import 'package:flutter_danthocode/widgets/error_text.dart';
import 'package:flutter_danthocode/widgets/loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactCard extends ConsumerWidget {
  final String id;
  const ContactCard({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(getUserDataProvider(id)).when(
            data: (contact) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(contact.avatar),
                      radius: 64,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '${contact.firstName} ${contact.lastName}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    color: Colors.grey[300],
                    width: double.infinity,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 40,
                        ),
                        Text(contact.email)
                      ],
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => ErrorText(text: error.toString()),
            loading: () => const Loading(),
          ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 12),
      //       child: CircleAvatar(
      //         backgroundImage: NetworkImage('https://reqres.in/img/faces/2-image.jpg'),
      //         radius: 64,
      //       ),
      //     ),
      //     SizedBox(
      //       width: double.infinity,
      //       child: Text(
      //         'Janet Weaver',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //         ),
      //       ),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.symmetric(vertical: 12),
      //       color: Colors.grey[300],
      //       width: double.infinity,
      //       child: Column(
      //         children: [
      //           const Icon(
      //             Icons.email_outlined,
      //             size: 40,
      //           ),
      //           Text('janet.weaver@reqres.in')
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
