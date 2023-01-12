import 'package:flutter/material.dart';
import 'package:suitmedia_test/constant.dart';
import 'package:suitmedia_test/third_page.dart';

class SecondPage extends StatefulWidget {
  final String name;
  const SecondPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String selectedName = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Second Screen",
          style: TextStyle(
            color: MyColor.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF554AF0),
          ),
          splashRadius: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 12,
                color: MyColor.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 18,
                color: MyColor.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  (selectedName == "") ? "Selected User Name" : selectedName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ThirdPage(),
                ),
              ).then((value) {
                if (value != null) {
                  selectedName = value[0];
                  setState(() {});
                  return;
                }
                selectedName = "";
                setState(() {});
              }),
              style: MyColor.buttonStyle(size),
              child: const Text(
                "Choose a User",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
