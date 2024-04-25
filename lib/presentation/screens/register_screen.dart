import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:verifily/blocs/auth/auth_bloc_bloc.dart';
import 'package:verifily/outils/width_height.dart';
import 'package:verifily/const.dart';
import 'package:verifily/presentation/screens/select_document_type_screen.dart';
import 'package:verifily/presentation/widgets/inkwellveri.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullName = TextEditingController();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    double scaleFactor = screenWidth(context: context) / 360;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
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
                          BorderSide(color: Colors.grey.shade300, width: 1.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    hintText: "Full name",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight(context: context) / 22),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 1.5),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    hintText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight(context: context) / 18),
                InkVerification(
                  function: () {
                    BlocProvider.of<AuthBlocBloc>(context).add(
                        RegisterWithFullNameEvent(fullName: fullName.text));
                  },
                  isContinue: true,
                  title: "START",
                  widht: screenWidth(context: context),
                ),
                BlocListener<AuthBlocBloc, AuthBlocState>(
                  listener: (context, state) {
                    if (state is RegisterCustomerSuccess) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SelectDocumentTypeScreen()));
                    }
                  },
                  child: const SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
