import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/utils/constants.dart';
import 'package:flutter_recipe_app/widget/fooditem_display.dart';
import 'package:flutter_recipe_app/widget/my_icon_button.dart';
import 'package:iconsax/iconsax.dart';

class ViewAllItems extends StatefulWidget {
  const ViewAllItems({super.key});

  @override
  State<ViewAllItems> createState() => _ViewAllItemsState();
}

class _ViewAllItemsState extends State<ViewAllItems> {
  final CollectionReference completeApp =
  FirebaseFirestore.instance.collection("complete-flutter-app");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          const SizedBox(width: 15),
          MyIconButton(
            icon: Icons.arrow_back_ios_new,
            pressed: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          const Text(
            "Quick & Easy",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          MyIconButton(
            icon: Iconsax.notification,
            pressed: () {},
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: StreamBuilder(
        stream: completeApp.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return GridView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                streamSnapshot.data!.docs[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodItemsDisplay(documentSnapshot: documentSnapshot),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.star1,
                          color: Colors.amberAccent,
                        ),
                        Text(
                          documentSnapshot['rating'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("/5"),

                        Text(
                          "${documentSnapshot['reviews']} Reviews", // Removed toString() as it's not needed
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }

          // Handle loading state
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Handle error state
          if (streamSnapshot.hasError) {
            return Center(
              child: Text("Error: ${streamSnapshot.error}"),
            );
          }

          return const Center(
            child: Text("No items available"),
          );
        },
      ),
    );
  }
}
