// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:kaira/models/city_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:kaira/screens/city_details_screen.dart';

// class CityListScreen extends StatefulWidget {
//   const CityListScreen({super.key});

//   @override
//   State<CityListScreen> createState() => _CityListScreenState();
// }

// class _CityListScreenState extends State<CityListScreen> {
//   late Future<List<City>>
//       _cityListFuture; // Déclarer le Future pour récupérer les villes

//   @override
//   void initState() {
//     super.initState();
//     _cityListFuture = fetchCities(); // Initialiser le Future dans initState
//   }

//   Future<List<City>> fetchCities() async {
//     final response = await http.get(Uri.parse('https://votre-api-url/cities'));
//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body)['data'];
//       return responseData.map((json) => City.fromJson(json)).toList();
//     } else {
//       throw Exception('Impossible de charger les villes');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Liste des Villes')),
//       body: FutureBuilder<List<City>>(
//         future: _cityListFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Erreur: ${snapshot.error}'));
//           } else {
//             final cities = snapshot.data!;
//             return ListView.builder(
//               itemCount: cities.length,
//               itemBuilder: (context, index) {
//                 final city = cities[index];
//                 return ListTile(
//                   title: Text(city.name),
//                   subtitle: Text(city.slug),
//                 );
//               },
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const CityDetailScreen()),
//           ).then((_) {
//             setState(() {
//               _cityListFuture = fetchCities();
//             });
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

//..................bebut.................................

// import 'package:flutter/material.dart';
// import 'package:kaira/models/city_model.dart';
// import 'package:kaira/screens/city/city_details_screen.dart';
// import 'package:kaira/screens/city/cityscreen.dart';

// class CityListScreen extends StatefulWidget {
//   const CityListScreen({Key? key}) : super(key: key);

//   @override
//   State<CityListScreen> createState() => _CityListScreenState();
// }

// class _CityListScreenState extends State<CityListScreen> {
//   final List<City> _cities = [
//     City(name: 'City 1', slug: 'city_1', createdAt: '2024-02-06', id: 1),
//     City(name: 'City 2', slug: 'city_2', createdAt: '2024-02-07', id: 2),
//     // Ajoutez d'autres villes fictives si nécessaire
//   ];

//   void deleteCity(int id) {
//     // Code pour supprimer la ville avec l'ID spécifié
//     setState(() {
//       // Mettez à jour la liste des villes après la suppression
//       _cities.removeWhere((city) => city.id == id);
//     });
//   }

//   void updateCity(int id, String newName, String newSlug, String newCreatedAt) {
//     setState(() {
//       // Recherchez la ville avec l'ID spécifié dans la liste
//       for (int i = 0; i < _cities.length; i++) {
//         if (_cities[i].id == id) {
//           // Mettez à jour les détails de la ville
//           _cities[i] = City(
//             id: id,
//             name: newName,
//             slug: newSlug,
//             createdAt: newCreatedAt,
//           );
//           break; // Arrêtez la boucle une fois la mise à jour effectuée
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Liste des Villes'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               if (_cities.isEmpty) {
//                 // Si la liste est vide, ne rien faire
//                 return;
//               } else if (_cities.length == 1) {
//                 // S'il y a un seul élément dans la liste, afficher un message de confirmation pour cet élément uniquement
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Supprimer cette ville ?'),
//                       content: const Text(
//                           'Êtes-vous sûr de vouloir supprimer cette ville ?'),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context)
//                                 .pop(); // Fermer la boîte de dialogue
//                           },
//                           child: const Text('Annuler'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             setState(() {
//                               _cities
//                                   .clear(); // Supprimer toutes les villes de la liste
//                             });
//                             Navigator.of(context)
//                                 .pop(); // Fermer la boîte de dialogue
//                           },
//                           child: const Text('Confirmer'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               } else {
//                 // S'il y a plus d'un élément dans la liste, afficher un message de confirmation pour toutes les villes
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Supprimer toutes les villes ?'),
//                       content: const Text(
//                           'Êtes-vous sûr de vouloir supprimer toutes les villes ?'),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context)
//                                 .pop(); // Fermer la boîte de dialogue
//                           },
//                           child: const Text('Annuler'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             setState(() {
//                               _cities
//                                   .clear(); // Supprimer toutes les villes de la liste
//                             });
//                             Navigator.of(context)
//                                 .pop(); // Fermer la boîte de dialogue
//                           },
//                           child: const Text('Confirmer'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               }
//             },
//             icon: const Icon(Icons.delete),
//             color: Colors.red,
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4,
//           crossAxisSpacing: 4.0,
//           mainAxisSpacing: 4.0,
//         ),
//         itemCount: _cities.length,
//         itemBuilder: (context, index) {
//           final city = _cities[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => CityDetailScreenn(
//                           city: city,
//                           onDelete:
//                               deleteCity, // Passer la fonction de suppression
//                           onUpdate: updateCity,
//                         )),
//               );
//             },
//             child: Card(
//               color: Colors.black26,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(city.name, style: Theme.of(context).textTheme.headline6),
//                   Text(city.slug),
//                   IconButton(
//                     onPressed: () {
//                       deleteCity(city.id);
//                     },
//                     icon: const Icon(Icons.delete),
//                     color: Colors.red,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final newCity = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const CityDetailScreen()),
//           );
//           if (newCity != null) {
//             setState(() {
//               _cities.add(newCity);
//             });
//           }
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

//............fin.........................

import 'package:flutter/material.dart';
import 'package:kaira/models/city_model.dart';
import 'package:kaira/screens/city/city_details_screen.dart';
import 'package:kaira/screens/city/cityscreen.dart';
import 'package:kaira/screens/colors.dart';
import 'package:kaira/widget/button.dart';
import 'package:kaira/widget/curveimage.dart';
import 'package:kaira/widget/custom_text_container.dart';
import 'package:kaira/widget/mainbackground.dart';

class CityListScreen extends StatefulWidget {
  const CityListScreen({super.key});

  @override
  State<CityListScreen> createState() => _CityListScreenState();
}

class _CityListScreenState extends State<CityListScreen> {
  final List<City> _cities = [
    City(name: 'City 1', slug: 'city_1', createdAt: '2024-02-06', id: 1),
    City(name: 'City 2', slug: 'city_2', createdAt: '2024-02-07', id: 2),
    City(name: 'City 1', slug: 'city_1', createdAt: '2024-02-06', id: 1),
    City(name: 'City 2', slug: 'city_2', createdAt: '2024-02-07', id: 2),

    // Ajoutez d'autres villes fictives si nécessaire
  ];

  void deleteCity(int id) {
    // Code pour supprimer la ville avec l'ID spécifié
    setState(() {
      // Mettez à jour la liste des villes après la suppression
      _cities.removeWhere((city) => city.id == id);
    });
  }

  void updateCity(int id, String newName, String newSlug, String newCreatedAt) {
    setState(() {
      // Recherchez la ville avec l'ID spécifié dans la liste
      for (int i = 0; i < _cities.length; i++) {
        if (_cities[i].id == id) {
          // Mettez à jour les détails de la ville
          _cities[i] = City(
            id: id,
            name: newName,
            slug: newSlug,
            createdAt: newCreatedAt,
          );
          break; // Arrêtez la boucle une fois la mise à jour effectuée
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColor.backGroundColor,
        body: Container(
          height: h,
          child: Stack(
            children: [
              _headSection(),
              _listBills(),
            ],
          ),
        ));
  }

  _headSection() {
    return Container(
      height: 310,
      child: Stack(
        children: [
          const MainBackground(
            bottomPosition: 10,
            leftPosition: 0,
            height: 300,
            imagePath: "images/background.png",
          ),
          CurveImageContainer(
            leftPosition: 0,
            rightPosition: -2,
            bottomPosition: 10,
            height: MediaQuery.of(context).size.height * 0.1,
            imagePath: "images/curve.png",
          ),
          _buttonContainer(),
          const CustomTextContainer(
            text: "Liste des Villes",
            leftPosition: 0,
            topPosition: 110,
            color: Color(0xFF293952),
          ),
          const CustomTextContainer(
            text: "Liste des Villes",
            leftPosition: 20,
            topPosition: 80,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  _buttonContainer() {
    return Positioned(
      right: 40,
      bottom: 0,
      child: GestureDetector(
          onTap: () {
            showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    height: MediaQuery.of(context).size.height - 240,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            child: Container(
                              color: Color(0xFFeef1f4).withOpacity(0.7),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 300,
                            )),
                        Positioned(
                            top: 7,
                            right: 32,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 20),
                              width: 80,
                              height: 250,
                              decoration: BoxDecoration(
                                  color: AppColor.mainColor,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppButtons(
                                    icon: Icons.cancel,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  AppButtons(
                                      icon: Icons.add,
                                      iconColor: AppColor.mainColor,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.white,
                                      onTap: () async {
                                        final newCity = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CityDetailScreen()),
                                        );
                                        if (newCity != null) {
                                          setState(() {
                                            _cities.add(newCity);
                                          });
                                        }
                                      },
                                      text: "Ajouter"),
                                  AppButtons(
                                    icon: Icons.delete,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      if (_cities.isEmpty) {
                                        // Si la liste est vide, ne rien faire
                                        return;
                                      } else if (_cities.length == 1) {
                                        // S'il y a un seul élément dans la liste, afficher un message de confirmation pour cet élément uniquement
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Supprimer cette ville ?'),
                                              content: const Text(
                                                  'Êtes-vous sûr de vouloir supprimer cette ville ?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Fermer la boîte de dialogue
                                                  },
                                                  child: const Text('Annuler'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _cities
                                                          .clear(); // Supprimer toutes les villes de la liste
                                                    });
                                                    Navigator.of(context)
                                                        .pop(); // Fermer la boîte de dialogue
                                                  },
                                                  child:
                                                      const Text('Confirmer'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      } else {
                                        // S'il y a plus d'un élément dans la liste, afficher un message de confirmation pour toutes les villes
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Supprimer toutes les villes ?'),
                                              content: const Text(
                                                  'Êtes-vous sûr de vouloir supprimer toutes les villes ?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Fermer la boîte de dialogue
                                                  },
                                                  child: const Text('Annuler'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      _cities
                                                          .clear(); // Supprimer toutes les villes de la liste
                                                    });
                                                    Navigator.of(context)
                                                        .pop(); // Fermer la boîte de dialogue
                                                  },
                                                  child:
                                                      const Text('Confirmer'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    text: "Supprimer",
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("images/lines.png")),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(0, 1),
                      color: const Color(0xFF11324d).withOpacity(0.2))
                ]),
          )),
    );
  }

  _listBills() {
    return Positioned(
        top: 320,
        left: 0,
        right: 0,
        bottom: 0,
        child: MediaQuery.removePadding(
          context: context,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: _cities.length,
            itemBuilder: (context, index) {
              final city = _cities[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CityDetailScreenn(
                              city: city,
                              onDelete:
                                  deleteCity, // Passer la fonction de suppression
                              onUpdate: updateCity,
                            )),
                  );
                },
                child: Card(
                  color: Colors.black26,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(city.name,
                          style: Theme.of(context).textTheme.headline6),
                      Text(city.slug),
                      IconButton(
                        onPressed: () {
                          deleteCity(city.id);
                        },
                        icon: const Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
