import 'package:flutter/material.dart';

class CustomMainContainer extends StatelessWidget {
  final Widget nameTextField;
  final Widget slugTextField;
  final bool isAdding;
  final VoidCallback onAddPressed;

  const CustomMainContainer({
    Key? key,
    required this.nameTextField,
    required this.slugTextField,
    required this.isAdding,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 550,
      width: 340,
      child: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: const Color(0xffC5C5C5),
              ),
            ),
            child: nameTextField,
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: const Color(0xffC5C5C5),
              ),
            ),
            child: slugTextField,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: isAdding ? null : onAddPressed,
            child: isAdding
                ? const CircularProgressIndicator()
                : const Text(
                    'Ajouter',
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        ],
      ),
    );
  }
}
