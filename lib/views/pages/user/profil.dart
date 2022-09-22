import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserProfil extends StatefulWidget {
  final User user;
  const UserProfil({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfil> createState() => _UserProfilState();
}

class _UserProfilState extends State<UserProfil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff3b5998),
            title: const Text("User Infos"),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 350,
                      height: 40,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ))),
                      child: Text(
                        widget.user.name,
                        style: const TextStyle(fontSize: 16, height: 1.4),
                      )),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 350,
                      height: 40,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ))),
                      child: Text(
                        widget.user.email,
                        style: const TextStyle(fontSize: 16, height: 1.4),
                      )),
                  const Text(
                    "Date de création",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 350,
                      height: 40,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ))),
                      child: Text(
                        widget.user.createdAt.toString(),
                        style: const TextStyle(fontSize: 16, height: 1.4),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  _signUpLabel(context, widget.user, const Color(0xff3b5998)),
                ],
              )),
            ),
          )),
    );
  }
}

Widget _signUpLabel(BuildContext context, User user, Color color) {
  return AnimatedButton(
    icon: const IconData(0xe692, fontFamily: 'MaterialIcons'),
    text: "Update profile",
    color: const Color(0xff3b5998),
    pressEvent: () {
      final _formKey = GlobalKey<FormState>();
      late AwesomeDialog dialog;
      final TextEditingController _emailController = TextEditingController();
      final TextEditingController _userNameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();
      final TextEditingController _passwordConfirmController =
          TextEditingController();
      dialog = AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.WARNING,
        keyboardAware: true,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  "Update",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Text(
                  "Leave the fields you don't want to update empty *",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    controller: _userNameController,
                    autofocus: true,
                    minLines: 1,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username can not be empty";
                      } else if (!RegExp(r"^[^0-9]+$").hasMatch(value)) {
                        return "Incorrect username";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: user.name,
                      border: InputBorder.none,
                      labelText: AppLocalizations.of(context)!.name,
                      prefixIcon: const Icon(Icons.text_fields),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    minLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email field can not be empty";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Your email doesn't match the email standart";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Email',
                      hintText: user.email,
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    controller: _passwordController,
                    autofocus: true,
                    obscureText: true,
                    minLines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password field can not be empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: AppLocalizations.of(context)!.password,
                      prefixIcon: const Icon(Icons.password),
                    ),
                  ),
                ),
                FlutterPwValidator(
                  controller: _passwordController,
                  minLength: 8,
                  width: 400,
                  height: 50,
                  onSuccess: () {
                    return "Password is matched";
                  },
                  onFail: () {
                    return "NOT MATCHED";
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    controller: _passwordConfirmController,
                    autofocus: true,
                    obscureText: true,
                    minLines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password field can not be empty";
                      } else if (value != _passwordController.text) {
                        return "Passwords do not match";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: AppLocalizations.of(context)!.confirmPassword,
                      prefixIcon: const Icon(Icons.password),
                    ),
                  ),
                ),
                FlutterPwValidator(
                  controller: _passwordConfirmController,
                  minLength: 8,
                  width: 400,
                  height: 50,
                  onSuccess: () {
                    return "Password is matched";
                  },
                  onFail: () {
                    return "NOT MATCHED";
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                AnimatedButton(
                  isFixedHeight: false,
                  text: 'OK',
                  pressEvent: () async {
                    if (_formKey.currentState!.validate()) {
                      Statut statut;
                      try {
                        statut = await createUser(
                          _userNameController.text,
                          _emailController.text,
                          _passwordController.text,
                        );
                        if (statut.error != null && statut.error!.isNotEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.RIGHSLIDE,
                            headerAnimationLoop: true,
                            title: 'Error',
                            desc: statut.error,
                            btnOkOnPress: () {},
                            btnOkColor: Colors.red,
                          ).show();
                        } else if (statut.error == null &&
                            statut.success!.isNotEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            headerAnimationLoop: true,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'INFO',
                            desc: statut.success,
                            btnOkOnPress: () {
                              Navigator.of(context).pop();
                            },
                          ).show();
                        }
                      } catch (e) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.RIGHSLIDE,
                          headerAnimationLoop: true,
                          title: 'Error',
                          desc: e.toString(),
                          btnOkOnPress: () {},
                          btnOkColor: Colors.red,
                        ).show();
                      }
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        headerAnimationLoop: true,
                        title: 'Error',
                        desc: 'Try again !',
                        btnOkOnPress: () {},
                        btnOkColor: Colors.red,
                      ).show();
                    }
                  },
                ),
                AnimatedButton(
                  isFixedHeight: false,
                  text: 'Cancel',
                  color: Colors.red,
                  pressEvent: () {
                    dialog.dismiss();
                  },
                )
              ],
            ),
          ),
        ),
      )..show();
    },
  );
}
