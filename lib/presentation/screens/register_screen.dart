import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/presentation/const.dart';
import 'package:verifily/presentation/screens/select_document_type_screen.dart';
import 'package:verifily/presentation/widgets/inkwellveri.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  TextEditingController dateinput = TextEditingController();
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    double scaleFactor = screenWidth(context: context) / 360;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(height: screenHeight(context: context) / 20),
              Text("Tell us about yourself",
                  style: titleTextStyle(scaleFactor, Colors.black)),
              SizedBox(height: screenHeight(context: context) / 22),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  hintText: "Full name",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight(context: context) / 22),
              TextFormField(
                style: TextStyle(color: Colors.grey.shade600),
                controller: dateinput,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade600, width: 1.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade600, width: 1.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                    hintText: "Enter Date Of Birth"),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter date";
                  }
                  return null;
                },
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2040));
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() => dateinput.text = formattedDate);
                  } else {}
                },
              ),
              SizedBox(height: screenHeight(context: context) / 22),
              DropdownButtonFormField<String>(
                isExpanded: true,
                hint: const Text(
                  'Select Your Gender',
                  style: TextStyle(fontSize: 14),
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                items: genderItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  selectedValue = value.toString();
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
              SizedBox(height: screenHeight(context: context) / 22),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 1.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight(context: context) / 18),
              InkVerification(
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectDocumentTypeScreen()));
                },
                isContinue: true,
                title: "Start",
                widht: screenWidth(context: context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
