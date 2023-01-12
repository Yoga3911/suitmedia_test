import 'package:flutter/material.dart';
import 'package:suitmedia_test/constant.dart';
import 'package:suitmedia_test/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late TextEditingController name;
  late TextEditingController palindrome;

  @override
  void initState() {
    name = TextEditingController();
    palindrome = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    palindrome.dispose();
    super.dispose();
  }

  AlertDialog myAlert(String msg) {
    return AlertDialog(
      title: const Text("Checker"),
      content: Text(msg),
    );
  }

  bool checkPalindrome(String text) {
    text = text.replaceAll(" ", "");
    String temp = "";
    for (int i = text.length; i > 0; i--) {
      temp += text[i - 1];
    }

    palindrome.text = temp;
    if (text == temp) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/bg.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(96, 255, 255, 255),
                    child: Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Name",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: palindrome,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Palindrome",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (checkPalindrome(name.text)) {
                        showDialog(
                          context: context,
                          builder: (_) => myAlert("isPalindrome"),
                        );
                        return;
                      }
                      showDialog(
                        context: context,
                        builder: (_) => myAlert("not palindrome"),
                      );
                    },
                    style: MyColor.buttonStyle(size),
                    child: const Text("CHECK"),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SecondPage(name: name.text),
                      ),
                    ),
                    style: MyColor.buttonStyle(size),
                    child: const Text("NEXT"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
