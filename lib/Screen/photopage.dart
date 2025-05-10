


import 'package:dating_site/Screen/home.dart';
import 'package:dating_site/Screen/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/profileProvider.dart';
import '../Utils/color.dart';

class PhotoPage extends StatefulWidget {
  final Map<String, dynamic> profile;
  final int index;
  const PhotoPage({required this.profile, required this.index});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Padding(
        padding: const EdgeInsets.only(top:30),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Show your best self.",
                  style: Font.boldFont1),
              const SizedBox(height: 20),
              Text(
                'Upload up to six of your best photo to make a fantastic first impression. Let you personality shine.',
                style: Font.normalFont,
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<ProfileProvider>(
                builder: (context, imageProvider, child) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.all(20),
                                child: Wrap(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.photo),
                                      title: const Text("Pick from Gallery"),
                                      onTap: () {
                                        Navigator.pop(context);
                                        imageProvider.pickImageFromGallery();
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text("Take a Photo"),
                                      onTap: () {
                                        Navigator.pop(context);
                                        imageProvider.pickImageFromCamera();
                                      },
                                    ),



                                    if (imageProvider.pickedImages.isNotEmpty)
                                      ListTile(
                                        leading: const Icon(Icons.delete_forever),
                                        title: const Text("Clear All"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          imageProvider.clearAllImages();
                                        },
                                      ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 25,
                            runSpacing: 20,
                            children: List.generate(9, (index) {
                              return Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      image: index < imageProvider.pickedImages.length
                                          ? DecorationImage(
                                        image: FileImage(imageProvider.pickedImages[index]),
                                        fit: BoxFit.cover,
                                      )
                                          : null,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: index >= imageProvider.pickedImages.length
                                        ? const Icon(Icons.camera_alt, size: 30, color: Colors.white)
                                        : null,
                                  ),
                                  if (index < imageProvider.pickedImages.length)
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: GestureDetector(
                                        onTap: () {
                                          imageProvider.removeImage(index);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black54,
                                            shape: BoxShape.circle,
                                          ),
                                          padding: const EdgeInsets.all(4),
                                          child: const Icon(Icons.close, size: 16, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            }),
                          ),
                        ),

                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(profile: {}, index: widget.index,)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: login,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("FINISH", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
