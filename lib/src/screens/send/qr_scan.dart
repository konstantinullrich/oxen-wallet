import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oxen_wallet/palette.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

typedef OnQRScanSuccess = void Function(String);

class QRScanPage extends BasePage {
  @override
  bool get isModalBackButton => true;

  bool get resizeToAvoidBottomPadding => false;

  @override
  Widget body(BuildContext context) => QRScanBody();
}

class QRScanBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QRScanBodyState();
}

class QRScanBodyState extends State<QRScanBody> {
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 600.0;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: OxenPalette.teal,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea),
              )),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        child: IconButton(
                          iconSize: 18,
                          splashRadius: 20,
                          onPressed: () async {
                            await controller?.toggleFlash();
                          },
                          icon: Icon(Icons.flash_on_sharp),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: IconButton(
                          iconSize: 18,
                          splashRadius: 20,
                          onPressed: () async {
                            if (controller != null) {
                              if (Platform.isAndroid) {
                                await controller.pauseCamera();
                              }
                              await controller.resumeCamera();
                            }
                          },
                          icon: Icon(Icons.camera),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    await controller.resumeCamera();
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      Navigator.of(context).pop(scanData.code);
    });
  }

  @override
  void deactivate() {
    // controller.stopCamera();
    controller.dispose();
    super.deactivate();
  }
}
