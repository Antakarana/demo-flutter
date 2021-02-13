import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:save_my_assets/views/utils/functions/AppBar.dart';

class QRCode extends StatefulWidget {
  QRCode({Key key}) : super(key: key);

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  GlobalKey qrKey = GlobalKey();
  Barcode qrText;
  QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("QR Kod"),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                borderRadius: 10.0,
                borderColor: Colors.red,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            child: Center(
              child: (qrText != null)
                  ? Text('Kare kod sonucu: ${qrText.code}')
                  : Text('Bir kare kod tara'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
