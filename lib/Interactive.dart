// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class interactivePage extends StatefulWidget {
  const interactivePage({super.key});

  @override
  State<interactivePage> createState() => _interactivePage();
}

class _interactivePage extends State<interactivePage> {
  bool isDarkMode = false;

  //declaration IBM
  String result = '';

  // Fonction date calcul age

  //Create datetime variable
  String myAge = '';

  //Variable ImagePicker
  String? path;

  DateTime dateTime = DateTime.now();

  pickDob() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1990),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate != null) {
        calculateAge(pickedDate);
      }
    });
  }

  calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    // int months = (age.inDays % 365) ~/ 30;
    // int days = ((age.inDays % 365) % 30) ;
    setState(() {
      // myAge = '$years years, $months months and $days days';
      myAge = '$years ans';
    });
  }

  //calcul BMI

  calculBmi(double taille, double poids) {
    // double result =
    double finalresult = poids / (taille * taille / 1000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  //Icon pdc
  Widget camerapdc() => InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: ((builder) => bottomSheetpdc()),
          );
        },
        child: Icon(
          Icons.camera_alt,
          color: Colors.teal,
          size: 35.0,
        ),
      );

  //Icon pdp
  Widget camerapdp() => InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: ((builder) => bottomSheetpdp()),
          );
        },
        child: Icon(
          Icons.camera_alt,
          color: Colors.black,
          size: 28.0,
        ),
      );

  //bouton mampandeh ilay icon pdc
  Widget bottomSheetpdc() {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 50,
      ),
      child: Column(children: <Widget>[
        Text(
          "Choisir photo de Couverture",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.camera),
                label: Text(
                  "Prendre une photo",
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.image),
                label: Text(
                  "Importer une photo",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        )
      ]),
    );
  }

  //bouton mampandeh ilay icon pdp
  Widget bottomSheetpdp() {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 50,
      ),
      child: Column(children: <Widget>[
        Text(
          "Choisir photo de profil",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Column(
          children: [
            ElevatedButton.icon(
                onPressed: () {
                  cheminimage();
                },
                icon: Icon(Icons.camera),
                label: Text("Camera")),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.image),
                label: Text("Gallery")),
          ],
        )
      ]),
    );
  }

  //Photo de couverture
  Widget photocouverture() => Container(
        color: Colors.grey,
        child: Image.asset(
          'assets/image1.jpg',
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      );

  //Photo de profile
  Widget photoprofile() => Row(
        children: [
          Container(
            width: 150,
            height: 150,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              child: Image.asset(
                'assets/image2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // camerapdc()
        ],
      );

  //ImagePicker
  //Maka ilay image anaty gallery
  Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.gallery);
  }

  //Maka ny chemin an'ilay image
  Future<void> cheminimage() async {
    final PickedFile = await pickImage();
    if (PickedFile != null) {
      setState(() {
        path = PickedFile.path;
      });
    }
  }

  //Radio
  String? valeurs = '';

  //create variable ho an'ilay slide
  double currentvalue = 0;

  //Variable ho an'ilay checkbox
  bool? isCheckedflutter = false;
  bool? isCheckedreact = false;
  bool? isCheckedsymfony = false;

  //Declarer variable ho an'ilay iaffichena azy
  String? nom;
  String? prenom;
  String? Sexe;
  int? Taille;
  int? poids;
  String? Technologie;
  DateTime? ddn;
  String? Loisirs;

  //declarer variable ho sotomin'ilay boutton valider
  var namectrl = TextEditingController();
  var surnamectrl = TextEditingController();
  var loisirctrl = TextEditingController();
  var poidsctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //Ato no mi-afficher rehefa avy clikena ny boutton

          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  child: photocouverture(),
                  margin: EdgeInsets.only(bottom: 70),
                ),
                Container(
                  child: camerapdc(),
                  margin: EdgeInsets.all(160),
                ),
                Positioned(
                  top: 130,
                  child: Container(child: photoprofile()),
                ),
                Container(
                  child: camerapdp(),
                  margin: EdgeInsets.all(90),
                ),
              ],
            ),
            Card(
              color: Color.fromARGB(255, 221, 217, 217),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(children: [
                  Row(
                    children: [
                      //Nampiasa TextField

                      Text('nom: '),
                      Text('${namectrl.text}' ' ' 'et  '),
                      Text('prénom: '),
                      Text('${surnamectrl.text}'),
                    ],
                  ),

                  //Nampiasa radio

                  Row(
                    children: [
                      Text('Sexe: '),
                      Text('${valeurs}'),
                    ],
                  ),

                  //Taille nampiasa slide

                  Row(
                    children: [
                      Text('Taille: '),
                      Text('${currentvalue}' 'cm'),
                    ],
                  ),

                  //DDN nampiasa DatePicker

                  Row(
                    children: [
                      Text('Age : '),
                      Text(myAge),
                    ],
                  ),

                  //Nampiasa checkbox
                  //Techno
                  Row(
                    children: [
                      Text('Liste des Technologies : '),

                      //Mi-afficher zavatra maromaro

                      Visibility(
                        child: Text('flutter , '),
                        visible: isCheckedflutter ?? false,
                      ),
                      Visibility(
                        child: Text('React , '),
                        visible: isCheckedreact ?? false,
                      ),
                      Visibility(
                        child: Text('Symfony  '),
                        visible: isCheckedsymfony ?? false,
                      ),
                    ],
                  ),

                  //Mi_afficher ny loisir
                  Row(
                    children: [
                      Text('Loisir: '),
                      Text('${loisirctrl.text}'),
                    ],
                  ),

                  //Mi_afficher ny BMI
                  Row(
                    children: [
                      Text('BMI : '),
                      Text(result),
                    ],
                  ),
                ]),
              ),
            ),
            Divider(
              color: Color.fromARGB(255, 186, 65, 65),
            ),
            Card(
                color: Color.fromARGB(255, 221, 217, 217),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(children: [
                    Row(
                      children: [
                        Text('Nom :  '),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            controller: namectrl,
                            decoration: InputDecoration(hintText: 'nom'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Prenom :  '),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            controller: surnamectrl,
                            decoration: InputDecoration(hintText: 'prenom'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Sexe : "),
                        Row(
                          children: [
                            Radio(
                              value: 'Masculin',
                              groupValue: valeurs,
                              onChanged: (value) {
                                setState(() {
                                  valeurs = value;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Masculin"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 'Feminin',
                              groupValue: valeurs,
                              onChanged: (value) {
                                setState(() {
                                  valeurs = value;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("Feminin"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Taille : '),
                        //  Text(currentvalue.toString(), style: TextStyle(fontSize: 35),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Slider(
                              value: currentvalue,
                              min: 0,
                              max: 250,
                              divisions: 10,
                              label: currentvalue.toString(),
                              activeColor: Colors.green,
                              thumbColor: Colors.brown,
                              inactiveColor: Colors.blueGrey,
                              onChanged: (value) {
                                setState(() {
                                  currentvalue = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Poids :  '),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            controller: poidsctrl,
                            decoration: InputDecoration(hintText: 'Poids'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Technologie : '),
                        Row(
                          children: [
                            Text('Flutter'),
                            Checkbox(
                                value: isCheckedflutter,
                                activeColor: Colors.black,
                                onChanged: (newBool) {
                                  setState(() {
                                    isCheckedflutter = true;
                                  });
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            Text('React'),
                            Checkbox(
                                value: isCheckedreact,
                                activeColor: Colors.black,
                                onChanged: (newBool) {
                                  setState(() {
                                    isCheckedreact = true;
                                  });
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Symfony'),
                            Checkbox(
                                value: isCheckedsymfony,
                                activeColor: Colors.blueGrey,
                                onChanged: (newBool) {
                                  setState(() {
                                    isCheckedsymfony = newBool;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('DDN: '),

                        ElevatedButton(
                          onPressed: () => pickDob(),
                          child: const Text('ddn'),
                        ),
                        // Text(dateTime.year.toString(),style: TextStyle(fontSize: 15),),
                        Text(
                          dateTime.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Loisirs :  '),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            controller: loisirctrl,
                            decoration: InputDecoration(hintText: 'Loisirs'),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () =>

                          //calcul BMI
                          //String avadika value io @poids

                          calculBmi(
                              currentvalue, double.parse(poidsctrl.value.text)),
                      child: const Text(
                        'Valider',
                      ),
                    ),
                  ]),
                )),
          ],
        ),
      ),
      backgroundColor: (isDarkMode == true
          ? Colors.white
          : const Color.fromARGB(255, 216, 215, 215)),
    );
  }
}
