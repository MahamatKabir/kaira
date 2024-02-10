import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaira/widget/customer_main.dart';
import 'package:kaira/widget/customerbackground.dart';
import 'package:uuid/uuid.dart';

class CtypeDetailScreen extends StatefulWidget {
  static const routeName = '/CtypeDetailScreen';

  const CtypeDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CtypeDetailScreenState createState() => _CtypeDetailScreenState();
}

class _CtypeDetailScreenState extends State<CtypeDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _slugController = TextEditingController();
  bool _isAddingCtype = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CustomBackgroundContainer(
              title: 'Ajouter un Container',
              leadingIcon: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            Positioned(
              top: 120,
              child: CustomMainContainer(
                nameTextField: TextField(
                  controller: _nameController,
                  decoration:
                      const InputDecoration(labelText: 'Type de container'),
                ),
                slugTextField: TextField(
                  controller: _slugController,
                  decoration: const InputDecoration(labelText: 'Slug'),
                ),
                isAdding: _isAddingCtype,
                onAddPressed: _addCtype,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addCtype() async {
    setState(() {
      _isAddingCtype = true;
    });

    final ctypeName = _nameController.text.trim();
    final ctypeSlug = _slugController.text.trim();
    final ctypeId = _generateCtypeId(); // Génération automatique de l'ID
    final createdAt = DateTime.now().toIso8601String();

    if (ctypeName.isNotEmpty && ctypeSlug.isNotEmpty) {
      final response = await http.post(
        Uri.parse('https://votre-api-url/contTypes'),
        body: json.encode({
          'id': ctypeId,
          'name': ctypeName,
          'slug': ctypeSlug,
          'created_at': createdAt,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: 'Ville ajoutée avec succès',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Échec de l\'ajout de la ville')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
    }

    setState(() {
      _isAddingCtype = false;
    });
  }

  String _generateCtypeId() {
    const uuid = Uuid();
    return uuid.v4(); // Génère un UUID v4 aléatoire
  }
}
