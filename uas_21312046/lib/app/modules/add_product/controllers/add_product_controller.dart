import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cNPM;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cProgramStudi;
  late TextEditingController cJenisKelamin;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(
    String npm,
    String nama,
    String alamat,
    String programStudi,
    String jenisKelamin,
  ) async {
    CollectionReference products = firestore.collection('products');

    try {
      await products.add({
        "npm": npm,
        "name": nama,
        "alamat": alamat,
        "program_studi": programStudi,
        "jenis_kelamin": jenisKelamin,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data product",
        onConfirm: () {
          cNPM.clear();
          cNama.clear();
          cAlamat.clear();
          cProgramStudi.clear();
          cJenisKelamin.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNPM = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    cProgramStudi = TextEditingController();
    cJenisKelamin = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNPM.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cProgramStudi.dispose();
    cJenisKelamin.dispose();
    super.onClose();
  }
}