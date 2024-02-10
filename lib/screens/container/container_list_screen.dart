import 'package:flutter/material.dart';
import 'package:kaira/models/container_model.dart'; // Import the Container model
import 'package:kaira/screens/colors.dart';
import 'package:kaira/screens/container/container_details_screen.dart';
import 'package:kaira/screens/container/container_update.dart';
import 'package:kaira/widget/button.dart';
import 'package:kaira/widget/curveimage.dart';
import 'package:kaira/widget/custom_text_container.dart';
import 'package:kaira/widget/mainbackground.dart';

class ContainerListScreen extends StatefulWidget {
  const ContainerListScreen({Key? key});

  @override
  State<ContainerListScreen> createState() => _ContainerListScreenState();
}

class _ContainerListScreenState extends State<ContainerListScreen> {
  final List<Containere> _containers = [
    Containere(
      id: 1,
      name: 'Container 1',
      slug: 'container_1',
      customer: 'Customer 1',
      customerTel: '1234567890',
      cityID: 1,
      contTypeID: 1,
      status: 1,
      createdAt: '2024-02-06',
    ),
    Containere(
      id: 2,
      name: 'Container 2',
      slug: 'container_2',
      customer: 'Customer 2',
      customerTel: '9876543210',
      cityID: 2,
      contTypeID: 2,
      status: 1,
      createdAt: '2024-02-07',
    ),
    // Add more Container objects if needed
  ];

  void deleteContainer(int id) {
    setState(() {
      _containers.removeWhere((container) => container.id == id);
    });
  }

  void updateContainer(
    int id,
    String newName,
    String newSlug,
    String newCustomer,
    String newCustomerTel,
    int cityID,
    int contTypeID,
    int status,
    String newCreatedAt,
  ) {
    setState(() {
      for (int i = 0; i < _containers.length; i++) {
        if (_containers[i].id == id) {
          _containers[i] = Containere(
            id: id,
            name: newName,
            slug: newSlug,
            customer: newCustomer,
            customerTel: newCustomerTel,
            cityID: cityID,
            contTypeID: contTypeID,
            status: status,
            createdAt: newCreatedAt,
            createdBy: _containers[i].createdBy,
            updatedAt: _containers[i].updatedAt,
            updatedBy: _containers[i].updatedBy,
          );
          break;
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
            _listContainers(),
            //_listcontainer()
          ],
        ),
      ),
    );
  }

  Widget _headSection() {
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
            text: "Liste des Container",
            leftPosition: 0,
            topPosition: 110,
            color: Color(0xFF293952),
          ),
          const CustomTextContainer(
            text: "Liste des Container",
            leftPosition: 20,
            topPosition: 80,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buttonContainer() {
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
                              color: const Color(0xFFeef1f4).withOpacity(0.7),
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
                                  borderRadius: BorderRadius.circular(29)),
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
                                                  const ContainerDetailScreen()),
                                        );
                                        if (newCity != null) {
                                          setState(() {
                                            _containers.add(newCity);
                                          });
                                        }
                                      },
                                      text: "creer"),
                                  AppButtons(
                                    icon: Icons.delete,
                                    iconColor: AppColor.mainColor,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    onTap: () {
                                      if (_containers.isEmpty) {
                                        // Si la liste est vide, ne rien faire
                                        return;
                                      } else if (_containers.length == 1) {
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
                                                      _containers
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
                                                      _containers
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

  Widget _listContainers() {
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
          itemCount: _containers.length,
          itemBuilder: (context, index) {
            final container = _containers[index];
            return GestureDetector(
              onTap: () {
                // Navigate to container details screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContainerUpScreen(
                      container: container,
                      onDelete: deleteContainer,
                      onUpdate: updateContainer,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          spreadRadius: 7.0,
                          blurRadius: 6.0)
                    ],
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: Card(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            container.name,
                            style: const TextStyle(
                                fontFamily: 'Varela',
                                fontSize: 20,
                                color: Color.fromARGB(255, 10, 2, 52)),
                          ),
                        ),
                        Center(child: Text(container.slug)),

                        // IconButton(
                        //   onPressed: () {
                        //     deleteContainer(container.id);
                        //   },
                        //   icon: const Icon(Icons.delete),
                        //   color: Colors.red,
                        // ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 5,
                          ),
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22),
                                  topRight: Radius.circular(22))),
                          child: const Text(
                            'ID:',
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

//   _listcontainer() {
//     return Positioned(
//       top: 320,
//       child: Container(
//         height: 130,
//         width: MediaQuery.of(context).size.width - 20,
//         decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(30),
//                 bottomRight: Radius.circular(30)),
//             boxShadow: [
//               BoxShadow(
//                   color: Color(0xFFd8dbe0),
//                   offset: Offset(1, 1),
//                   blurRadius: 20.0,
//                   spreadRadius: 10),
//             ]),
//         child: Container(
//           margin: const EdgeInsets.only(top: 10, left: 18),
//           child: Row(children: [
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(
//                             width: 3,
//                             color: Colors.grey,
//                           ),
//                           image: const DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage("images/background.png"))),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "kengne",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: AppColor.mainColor),
//                         ),
//                         Text(
//                           "id: 123457",
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: AppColor.mainColor),
//                         )
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             )
//           ]),
//         ),
//       ),
//     );
//   }
}
