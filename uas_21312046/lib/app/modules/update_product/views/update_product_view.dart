import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/update_product_controller.dart';

class UpdateProductView extends GetView<UpdateProductController> {
  const UpdateProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menyimpan Get.arguments dalam variabel untuk memeriksa tipe datanya.
    final arguments = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data?.data() as Map<String, dynamic>?; // Ubah sesuai dengan nama field yang sesuai di Firestore

            return Padding(
              padding: EdgeInsets.all(8),
              child: _buildForm(context, data, arguments), // Mengirimkan data dan arguments ke _buildForm.
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context, Map<String, dynamic>? data, String id) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: controller.cNama,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: "Nama Product"),
            initialValue: data?['name'], // Menggunakan nilai awal dari Firestore
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller.cHarga,
            autocorrect: false,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Harga Product"),
            initialValue: data?['price'], // Menggunakan nilai awal dari Firestore
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              controller.updateProduct(
                controller.cNama.text,
                controller.cHarga.text,
                controller.cJenisKelamin.text,
                controller.cAlamat.text,
                controller.cProgramStudi.text,
                controller.cNPM.text,
                id,
              );
            },
            child: Text("Ubah"),
          ),
        ],
      ),
    );
  }
}
