import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rice_quality_scaning_app/screens/theme.dart';

import '../widgets/custome_rectangle.dart';

class ScaningPage extends StatefulWidget {
  const ScaningPage({Key? key}) : super(key: key);

  @override
  State<ScaningPage> createState() => _ScaningPageState();
}

class _ScaningPageState extends State<ScaningPage> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }

      final imageTemprorary = File(image.path);
      setState(() {
        this.image = imageTemprorary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: kprimeColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Image.asset('assets/images/arrow_back.png'),
            ),
          ),
          Text(
            'Result\nScanning',
            style: whiteStyle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: () {
              pickImage();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: kprimeColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Image.asset('assets/images/camera.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageContent() {
    return Container(
      margin: const EdgeInsets.only(
        top: 25,
        bottom: 5,
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.all(10),
      height: 300,
      decoration: BoxDecoration(
        color: kprimeColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(4.0, 4.0),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            offset: const Offset(-4.0, -4.0),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    image!,
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              : Text(
                  "Tidak Ada Gambar",
                  style: whiteStyle.copyWith(fontWeight: medium),
                ),
        ],
      ),
    );
  }

  Widget resultContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          CustomeRectangle(
            title: 'Beras putih',
            text: 'warna putih merupakan parameter\nuntuk kualitas terbaik',
            persen: 85,
          ),
          CustomeRectangle(
            title: 'Beras kuning',
            text:
                'warna kuning merupakan parameter\nuntuk kualitas kurang baik',
            persen: 13,
          ),
          CustomeRectangle(
            title: 'Beras hitam',
            text: 'warna hitam merupakan parameter\nuntuk kualitas tidak bagus',
            persen: 0.1,
          ),
          CustomeRectangle(
            title: 'Beras patah',
            text:
                'warna kuning merupakan parameter\nuntuk kualitas kurang baik',
            persen: 1.9,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimeColor,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            imageContent(),
            resultContent(),
          ],
        ),
      ),
    );
  }
}
