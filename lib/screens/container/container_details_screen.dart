import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaira/widget/customerbackground.dart';
import 'package:uuid/uuid.dart';

class ContainerDetailScreen extends StatefulWidget {
  static const routeName = '/ContainerDetailScreen';

  const ContainerDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ContainerDetailScreenState createState() => _ContainerDetailScreenState();
}

class _ContainerDetailScreenState extends State<ContainerDetailScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _slugController = TextEditingController();
  final TextEditingController _customerController = TextEditingController();
  final TextEditingController _customerTelController = TextEditingController();
  bool _isAddingContainer = false;
  int _selectedCityID = 0;
  int _selectedContTypeID = 0;
  int _selectedStatus = 0; // 0: Inactif, 1: Actif

  List<Map<String, dynamic>> _cityData = [];
  List<Map<String, dynamic>> _contTypeData = [];

  @override
  void initState() {
    super.initState();
    _fetchCityAndContType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CustomBackgroundContainer(
              title: 'Ajouter un Conteneur',
              leadingIcon: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: Color.fromARGB(255, 1, 1, 37),
                ),
              ),
              height: 600,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                              labelText: 'Nom du Conteneur'),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        child: TextField(
                          controller: _slugController,
                          decoration: const InputDecoration(labelText: 'Slug'),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        child: TextField(
                          controller: _customerController,
                          decoration:
                              const InputDecoration(labelText: 'Client'),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        child: TextField(
                          controller: _customerTelController,
                          decoration: const InputDecoration(
                              labelText: 'Téléphone du Client'),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        child: DropdownButtonFormField<int>(
                          value: _selectedCityID,
                          onChanged: (value) {
                            setState(() {
                              _selectedCityID = value!;
                            });
                          },
                          items: _cityData.map((city) {
                            return DropdownMenuItem<int>(
                              value: city['id'],
                              child: Text(city['name']),
                            );
                          }).toList(),
                          decoration: const InputDecoration(labelText: 'Ville'),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        child: DropdownButtonFormField<int>(
                          value: _selectedContTypeID,
                          onChanged: (value) {
                            setState(() {
                              _selectedContTypeID = value!;
                            });
                          },
                          items: _contTypeData.map((contType) {
                            return DropdownMenuItem<int>(
                              value: contType['id'],
                              child: Text(contType['name']),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                              labelText: 'Type de conteneur'),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                        child: DropdownButtonFormField<int>(
                          value: _selectedStatus,
                          onChanged: (value) {
                            setState(() {
                              _selectedStatus = value!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<int>(
                              value: 0,
                              child: Text('Inactif'),
                            ),
                            DropdownMenuItem<int>(
                              value: 1,
                              child: Text('Actif'),
                            ),
                          ],
                          decoration:
                              const InputDecoration(labelText: 'Statut'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _isAddingContainer ? null : _addContainer,
                        child: _isAddingContainer
                            ? const CircularProgressIndicator()
                            : const Text('Ajouter'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchCityAndContType() async {
    final cityResponse =
        await http.get(Uri.parse('https://votre-api-url/cities'));
    final contTypeResponse =
        await http.get(Uri.parse('https://votre-api-url/contTypes'));

    if (cityResponse.statusCode == 200 && contTypeResponse.statusCode == 200) {
      _cityData =
          List<Map<String, dynamic>>.from(json.decode(cityResponse.body));
      _contTypeData =
          List<Map<String, dynamic>>.from(json.decode(contTypeResponse.body));

      setState(() {
        if (_cityData.isNotEmpty) _selectedCityID = _cityData[0]['id'];
        if (_contTypeData.isNotEmpty)
          _selectedContTypeID = _contTypeData[0]['id'];
      });
    }
  }

  void _addContainer() async {
    setState(() {
      _isAddingContainer = true;
    });

    final containerName = _nameController.text.trim();
    final containerSlug = _slugController.text.trim();
    final customer = _customerController.text.trim();
    final customerTel = _customerTelController.text.trim();
    final containerId = _generateContainerId();
    final createdAt = DateTime.now().toIso8601String();

    if (containerName.isNotEmpty &&
        containerSlug.isNotEmpty &&
        customer.isNotEmpty &&
        customerTel.isNotEmpty) {
      final response = await http.post(
        Uri.parse('https://votre-api-url/containers'),
        body: json.encode({
          'id': containerId,
          'name': containerName,
          'slug': containerSlug,
          'customer': customer,
          'customerTel': customerTel,
          'cityID': _selectedCityID,
          'contTypeID': _selectedContTypeID,
          'status': _selectedStatus,
          'created_at': createdAt,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: 'Conteneur ajouté avec succès',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Échec de l\'ajout du conteneur')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
    }

    setState(() {
      _isAddingContainer = false;
    });
  }

  String _generateContainerId() {
    const uuid = Uuid();
    return uuid.v4();
  }
}
