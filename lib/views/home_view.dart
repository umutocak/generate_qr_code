import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../view_models/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text("Generate QR Code", style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Qr içeriğini giriniz'),
                onChanged: (value) {
                  Provider.of<HomeViewModel>(context, listen: false).onChangeTextValue(value);
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 5,),
            Visibility(
              visible: context.watch<HomeViewModel>().textValue.isEmpty ? false : true,
              child: QrImage(data: context.watch<HomeViewModel>().textValue, version: QrVersions.auto, size: 200.0),
            ),
            Visibility(
              visible: context.watch<HomeViewModel>().textValue.isEmpty ? true : false,
              child: const Text(
                "QR İçeriğini girdiğinizde qr code burada gözükecektir",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
