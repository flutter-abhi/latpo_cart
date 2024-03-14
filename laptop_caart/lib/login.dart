import 'package:flutter/material.dart';
import 'package:laptop_caart/createAcc.dart';
import 'package:laptop_caart/homePage.dart';
import 'data2.dart';

// form key for only this page
final _formKey = GlobalKey<FormState>();

// for cheking pass is correct or not
// user index ha findUser function gheun yetoy
bool passchek(String value) {
  if (userindex > -1) {
    if (userList[userindex].pass == value) {
      return true;
    }
  }
  return false;
}

void dataget() async {
  await creatingDatabase();
  userList = await getData();
}

///
///
///
///

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    //database create & list of user get
    dataget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade300,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100, right: 15, left: 15, bottom: 20),
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
                        // avtar image
                        Image.network(
                          "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                          height: 90,
                          width: 90,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        ///            //      //userName//
                        //
                        TextFormField(
                          controller: userNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Plese Enter Username";
                            } else if (value.contains('@')) {
                              return "Dont use @ ";
                            } else if (!findUser(value)) {
                              return " User not Found ";
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
                        // pass chek
                        TextFormField(
                          obscureText: displayPass,
                          obscuringCharacter: '*',
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Plese Enter password";
                            } else if (!passchek(value)) {
                              return "Incorrect password";
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
                            label: const Text("Enter user Password"),
                            hintText: "Enter user Password",
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
                              GestureDetector(
                                child: const Text("Create Account"),
                                onTap: () {
                                  userNameController.clear();
                                  passwordController.clear();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const CreateAcc();
                                  }));
                                },
                              ),
                              const Spacer(),
                              GestureDetector(
                                child: const Text("Forgot password"),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  backgroundColor: Colors.green.shade400,
                                  content: const Text("Login sucsseful"),
                                ),
                              );
                              //next page
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (builder) {
                                return Laptops();
                              }));

                              //login sucssesful zalyavar ethe
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red.shade400,
                                  content: const Text(
                                    "Login Fail (:",
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
                              "Login",
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
