// ignore_for_file: prefer_const_constructors, unnecessary_import, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mukrata_sau_app/views/show_pay_bill_ui.dart';

class CalculatePayBillUI extends StatefulWidget {
  const CalculatePayBillUI({super.key});

  @override
  State<CalculatePayBillUI> createState() => _CalculatePayBillUIState();
}

class _CalculatePayBillUIState extends State<CalculatePayBillUI> {
  //ตัวแปรเก็บรายการ DropDown
  List<String> _memberTyper = [
    'ไม่เป็นสมาชิก',
    'สมาชิก Silver Member ลด 5%',
    'สมาชิก Gold Member ลด 10%',
    'สมาชิก Platinum Member ลด 20',
  ];

  //ตัวแปร
  String _memberTypeSelected = 'ไม่เป็นสมาชิก';

  File? _imageFromCamera;

  Future getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() {
      _imageFromCamera = File(image.path);
    });
  }

  //สร้างตัวแปนเก็บสถานผู้ใหญ่ และเด็กว่าเลือกไม่เลือก
  bool adultStatus = false;
  bool babyStatus = false;

  //ตัวแปนสำหรับ radio
  int waterStatuse = 1;

  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController babyCtrl = TextEditingController(text: '0');
  TextEditingController cokeCtrl = TextEditingController(text: '0');
  TextEditingController pureCtrl = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 50.0,
            right: 50.0,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                GestureDetector(
                  onTap: () {
                    //เปิดกล้อง
                    getImageFromCamera();
                  },
                  child: _imageFromCamera == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          width: 140.0,
                          height: 140.0,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          _imageFromCamera!,
                          width: 140.0,
                          height: 140.0,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: adultStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          adultStatus = adultStatus == true ? false : true;
                        });
                      },
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน',
                    ),
                    Expanded(
                      child: TextField(
                        controller: adultCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      '   คน',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: babyStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          babyStatus = babyStatus == true ? false : true;
                        });
                      },
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน',
                    ),
                    Expanded(
                      child: TextField(
                        controller: babyCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      '   คน',
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุปเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: waterStatuse,
                      onChanged: (paramValue) {
                        setState(() {
                          waterStatuse = paramValue!;
                        });
                      },
                    ),
                    Text(
                      'รับ 25 บาท/หัว',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: waterStatuse,
                      onChanged: (paramValue) {
                        waterStatuse = paramValue!;
                      },
                    ),
                    Text(
                      'ไม่รับ',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '             โค้ด 20 บาท/ขวด จำนวน',
                    ),
                    Expanded(
                      child: TextField(
                        controller: cokeCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      '   ขวด',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '             น้ำเปล่า 15 บาท/ขวด จำนวน',
                    ),
                    Expanded(
                      child: TextField(
                        controller: pureCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      '   ขวด',
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownButton(
                  items: _memberTyper
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                            ),
                          ))
                      .toList(),
                  onChanged: (paramValue) {
                    setState(() {
                      _memberTypeSelected = paramValue!;
                    });
                  },
                  value: _memberTypeSelected,
                  isExpanded: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          //คิดผู้ใหญ่
                          double adultPay = adultStatus == false
                              ? 0
                              : (int.parse(adultCtrl.text) * 299);

                          //คิดเด็ก
                          double babyPay = babyStatus == false
                              ? 0
                              : (int.parse(babyCtrl.text) * 69);

                          //คิดน้ำดื่มบุฟเฟต์
                          double waterPay = waterStatuse == 1
                              ? (int.parse(adultCtrl.text) +
                                      int.parse(babyCtrl.text)) *
                                  25
                              : 0;
                          //คิดโค้ต
                          double cockPay = int.parse(cokeCtrl.text) * 20;
                          //คิดน้ำเปล่า
                          double purePay = int.parse(pureCtrl.text) * 15;
                          //คำนวฯเงินที่ต้องจ่ายพร้อมส่วนลด
                          //คำนวณเงินรวมก่อนลด
                          double totalPay =
                              adultPay + babyPay + waterPay + cockPay + purePay;
                          //ส่วนลด
                          if (_memberTypeSelected == 'ไม่เป็นสมาชิก') {
                            totalPay = totalPay;
                          } else if (_memberTypeSelected ==
                              'สมาชิก Silver Member ลด 5%') {
                            totalPay = totalPay - (totalPay * 5 / 100);
                          } else if (_memberTypeSelected ==
                              'สมาชิก Gold Member ลด 10%') {
                            totalPay = totalPay - (totalPay * 10 / 100);
                          } else {
                            totalPay = totalPay - (totalPay * 20 / 100);
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowPayBillUI(
                                adult: adultCtrl.text,
                                baby: babyCtrl.text,
                                water: waterStatuse,
                                coke: cokeCtrl.text,
                                pure: pureCtrl.text,
                                memberTyper: _memberTypeSelected,
                                totalPay: totalPay,
                                imageFile: _imageFromCamera,
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          FontAwesomeIcons.calculator,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวนเงิน',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: Size(
                            double.infinity,
                            55.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: Size(
                            double.infinity,
                            55.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
