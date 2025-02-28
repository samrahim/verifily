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
  TextEditingController email = TextEditingController();
  String? selectedValue;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double scaleFactor = screenWidth(context: context) / 360;
    return Form(
      key: formState,
      child: SafeArea(
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
                    validator: (value) {
                      if (value == null || value.length < 3) {
                        return "Full name is required";
                      }
                      return null;
                    },
                    controller: fullName,
                    decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red.shade300, width: 1.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red.shade300, width: 1.5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
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
                    controller: email,
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
                      if (formState.currentState!.validate()) {
                        BlocProvider.of<AuthBlocBloc>(context).add(
                            RegisterWithFullNameEvent(
                                fullName: fullName.text, email: email.text));
                      } else {
                        null;
                      }
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
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 3),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Powered by ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color.fromARGB(255, 237, 207, 242)),
                          child: const Text(
                            "Verifili",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: ClipRect(
                            child: Image.asset(
                                "images/88f44814-6194-4ddc-a1c6-a597ed472ca1.jpg"),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
