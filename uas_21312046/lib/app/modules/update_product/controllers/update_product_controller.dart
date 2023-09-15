import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cHarga;
  late TextEditingController cJenisKelamin;
  late TextEditingController cAlamat; // Tambahkan TextEditingController untuk Alamat
  late TextEditingController cProgramStudi; // Tambahkan TextEditingController untuk Program Studi
  late TextEditingController cNPM; // Tambahkan TextEditingController untuk NPM

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async{
    DocumentReference docRef = firestore.collection("products").doc(id);

    return docRef.get();
  }

  void updateProduct(
    String nama,
    String harga,
    String jenisKelamin,
    String alamat, // Tambahkan ini
    String programStudi, // Tambahkan ini
    String npm, // Tambahkan ini
    String id,
  ) async {
    DocumentReference productById = firestore.collection("products").doc(id);
    try {
      await productById.update({
        "name" : nama,
        "price" : harga,
        "jenis_kelamin" : jenisKelamin,
        "alamat" : alamat, // Tambahkan ini
        "program_studi" : programStudi, // Tambahkan ini
        "npm" : npm, // Tambahkan ini
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data product.",
        onConfirm: () {
          cNama.clear();
          cHarga.clear();
          cJenisKelamin.clear();
          cAlamat.clear(); // Clear field Alamat
          cProgramStudi.clear(); // Clear field Program Studi
          cNPM.clear(); // Clear field NPM
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );

    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal Menambahkan Product.",
      );
    }
  }

  @override
  void onInit(){
    cNama = TextEditingController();
    cHarga = TextEditingController();
    cJenisKelamin = TextEditingController();
    cAlamat = TextEditingController(); // Inisialisasi TextEditingController untuk Alamat
    cProgramStudi = TextEditingController(); // Inisialisasi TextEditingController untuk Program Studi
    cNPM = TextEditingController(); // Inisialisasi TextEditingController untuk NPM
    super.onInit();
  }

  @override
  void onClose() {
    cNama.dispose();
    cHarga.dispose();
    cJenisKelamin.dispose();
    cAlamat.dispose(); // Dispose TextEditingController untuk Alamat
    cProgramStudi.dispose(); // Dispose TextEditingController untuk Program Studi
    cNPM.dispose(); // Dispose TextEditingController untuk NPM
    super.onClose();
  }
}
