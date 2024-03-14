// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:laptop_caart/data2.dart';

final _formKey = GlobalKey<FormState>();

class CreateAcc extends StatefulWidget {
  const CreateAcc({super.key});

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 228, 228),
        title: const Text(
          "Create Account",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade300,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        // (displayPass)
                        //     ? Image.network(
                        //         "https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png",
                        //         height: 90,
                        //         width: 90,
                        //       )
                        //   :
                        Image.network(
                          "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                          height: 90,
                          width: 90,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //email
                        //start
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value?.trim() == null || value!.isEmpty) {
                              return "Plese Enter the Email";
                            } else if (!value.contains("@")) {
                              return "Please Enter valid Email ";
                            } else if (value.length <= 6) {
                              return "Please Enter valid Email";
                            } else if (!value.contains(".com")) {
                              return "Email is not valid";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email_outlined),
                            // helperText: "Username",
                            label: const Text("Enter Email"),
                            hintText: "Enter Email ",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //userName//
                        //
                        TextFormField(
                          controller: userNameController,
                          validator: (value) {
                            if (value?.trim() == null || value!.isEmpty) {
                              return "Plese Enter Username";
                            } else if (!validUserName(value)) {
                              return "Dont use symbols ";
                            } else if (value.length <= 6) {
                              return "Enter the UserName gretter than 6";
                            } else if (findUser(value)) {
                              return "UserName Alredy exits";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            // helperText: "Username",
                            label: const Text("Enter user Name"),
                            hintText: "Enter user Name",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: displayPass,
                          obscuringCharacter: '*',
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Plese Enter password";
                            } else if (value.length < 6) {
                              return "Enter large password";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: (displayPass)
                                ? IconButton(
                                    icon: const Icon(
                                        Icons.visibility_off_outlined),
                                    onPressed: () {
                                      setState(() {
                                        displayPass = !displayPass;
                                      });
                                    },
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        displayPass = !displayPass;
                                      });
                                    },
                                  ),
                            label: const Text("Create user Password"),
                            hintText: "Create user Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 20, left: 10, right: 10),
                          child: Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                child: const Text("Login"),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              insert(UserModelClass(
                                  userName: userNameController.text,
                                  pass: passwordController.text,
                                  email: emailController.text));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Colors.green.shade400,
                                  content: const Text("Account Created"),
                                ),
                              );
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const Scaffold();
                              }));
                              //login sucssesful zalyavar ethe
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red.shade400,
                                  content: const Text(
                                    "Account Not Created (:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 60),
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 26),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
