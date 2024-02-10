// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';

// class CityDetailScreen extends StatefulWidget {
//   static const routeName = '/CityDetailScreen';

//   const CityDetailScreen({super.key});
//   @override
//   _CityDetailScreenState createState() => _CityDetailScreenState();
// }

// class _CityDetailScreenState extends State<CityDetailScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _slugController = TextEditingController();
//   bool _isAddingCity = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Ajouter une Ville')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Nom de la Ville'),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _slugController,
//               decoration: const InputDecoration(labelText: 'Slug'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _isAddingCity ? null : _addCity,
//               child: _isAddingCity
//                   ? const CircularProgressIndicator()
//                   : const Text('Ajouter'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _addCity() async {
//     setState(() {
//       _isAddingCity = true;
//     });

//     final cityName = _nameController.text.trim();
//     final citySlug = _slugController.text.trim();
//     final createdAt = DateTime.now().toIso8601String();

//     if (cityName.isNotEmpty && citySlug.isNotEmpty) {
//       final response = await http.post(
//         Uri.parse('https://votre-api-url/cities'),
//         body: json.encode({
//           'name': cityName,
//           'slug': citySlug,
//           'created_at': createdAt,
//         }),
//         headers: {'Content-Type': 'application/json'},
//       );
//       if (response.statusCode == 200) {
//         Fluttertoast.showToast(
//           msg: 'Ville ajoutée avec succès',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: Colors.green,
//           textColor: Colors.white,
//         );
//         Navigator.pop(context);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Échec de l\'ajout de la ville')),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Veuillez remplir tous les champs')),
//       );
//     }

//     setState(() {
//       _isAddingCity = false;
//     });
//   }
// }
// ..................travail en local bedut.................................
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class CityDetailScreen extends StatefulWidget {
//   static const routeName = '/CityDetailScreen';

//   const CityDetailScreen({Key? key}) : super(key: key);

//   @override
//   _CityDetailScreenState createState() => _CityDetailScreenState();
// }

// class _CityDetailScreenState extends State<CityDetailScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _slugController = TextEditingController();
//   bool _isAddingCity = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Ajouter une Ville')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Nom de la Ville'),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _slugController,
//               decoration: const InputDecoration(labelText: 'Slug'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _isAddingCity ? null : _addCity,
//               child: _isAddingCity
//                   ? const CircularProgressIndicator()
//                   : const Text('Ajouter'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _addCity() async {
//     setState(() {
//       _isAddingCity = true;
//     });

//     final cityName = _nameController.text.trim();
//     final citySlug = _slugController.text.trim();
//     final createdAt = DateTime.now().toIso8601String();

//     if (cityName.isNotEmpty && citySlug.isNotEmpty) {
//       // Simuler l'ajout de la ville localement
//       // Vous pouvez ajouter la logique de sauvegarde des données dans une base de données locale ici
//       // Par exemple, vous pouvez utiliser le package 'sqflite' pour la persistance locale
//       // Dans cet exemple, nous utilisons simplement un print pour afficher les informations ajoutées
//       print('Ville ajoutée avec succès :');
//       print('Nom : $cityName');
//       print('Slug : $citySlug');
//       print('Créé le : $createdAt');

//       Fluttertoast.showToast(
//         msg: 'Ville ajoutée avec succès',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//       );
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Veuillez remplir tous les champs')),
//       );
//     }

//     setState(() {
//       _isAddingCity = false;
//     });
//   }
// }
//..................fin tr lo ...............................
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaira/widget/customer_main.dart';
import 'package:kaira/widget/customerbackground.dart';
import 'package:uuid/uuid.dart';

class CityDetailScreen extends StatefulWidget {
  static const routeName = '/CityDetailScreen';

  const CityDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CityDetailScreenState createState() => _CityDetailScreenState();
}

class _CityDetailScreenState extends State<CityDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _slugController = TextEditingController();
  bool _isAddingCity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CustomBackgroundContainer(
              title: 'Adding',
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
                      const InputDecoration(labelText: 'Nom de la Ville'),
                ),
                slugTextField: TextField(
                  controller: _slugController,
                  decoration: const InputDecoration(labelText: 'Slug'),
                ),
                isAdding: _isAddingCity,
                onAddPressed: _addCity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addCity() async {
    setState(() {
      _isAddingCity = true;
    });

    final cityName = _nameController.text.trim();
    final citySlug = _slugController.text.trim();
    final cityId = _generateCityId(); // Génération automatique de l'ID
    final createdAt = DateTime.now().toIso8601String();

    if (cityName.isNotEmpty && citySlug.isNotEmpty) {
      final response = await http.post(
        Uri.parse('https://votre-api-url/cities'),
        body: json.encode({
          'id': cityId,
          'name': cityName,
          'slug': citySlug,
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
      _isAddingCity = false;
    });
  }

  String _generateCityId() {
    const uuid = Uuid();
    return uuid.v4(); // Génère un UUID v4 aléatoire
  }
}
