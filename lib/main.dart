import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basics',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Profile(),
    );
  }
}

class Profile extends StatelessWidget{
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
     return Scaffold(
         appBar: AppBar(
             title: const Text(
                 "Basics",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
             ),
             backgroundColor: Theme.of(context).primaryColor,
         ),
       body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      fromAsset(path: "images/maldives.jpg", size: size, height: 200),
                      const Padding(
                          padding: EdgeInsets.only(top: 130),
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 70,
                              foregroundImage: AssetImage("images/andrea.jpg"),
                            ),
                          )
                      )
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Anna Chambon",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                        const Text(
                          "Une vie menée par les rêves et les chats !",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(child: buttonContainer(text: "Modifier le profil")),
                            buttonContainer(icon: Icons.border_color)
                          ],
                        ),
                        const Divider(thickness: 2,),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    "A propos de moi",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                      Icons.house
                                  ),
                                  Text(
                                      "Paris, France"
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                      Icons.work
                                  ),
                                  Text(
                                      "Développeur web"
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                      Icons.favorite
                                  ),
                                  Text(
                                      "En couple"
                                  )
                                ],
                              ),]
                            ,)
                          ,)
                      ],
                    ),
                  ),
                  const Divider(height: 30),
                  const Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("Amis", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20)
                          ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset("images/andrea.jpg",fit: BoxFit.cover,height: 110,width: 110)
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset("images/andrea.jpg",fit: BoxFit.cover,height: 110,width: 110)
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset("images/andrea.jpg",fit: BoxFit.cover,height: 110,width: 110)
                      )
                    ],
                  ),
                  const Divider(height: 30),
                  articleFace(
                      size: size,
                      authorName: "Anna Chambon",
                      lastTime: "Il y a 5 heures",
                      comment: "J'adore ton image",
                      numberLikes: "35",
                      numberComments: "12"
                  ),
                  articleFace(
                      size: size,
                      authorName: "Anna Chambon",
                      lastTime: "Il y a 20 heures",
                      comment: "J'adore ton image",
                      numberLikes: "35",
                      numberComments: "12"
                  ),
                  articleFace(
                      size: size,
                      authorName: "Anna Chambon",
                      lastTime: "Il y a 1 jour",
                      comment: "J'adore ton image",
                      numberLikes: "35",
                      numberComments: "12"
                  ),
                ],
              )
          ),
       ),


     );
  }
  ///Bouton factice
  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue
      ),
      height: 50,
      child: (icon == null)
          ? Center(child: Text(text ?? "", style: const TextStyle(color: Colors.white)))
          : Icon(icon, color: Colors.white,),
    );
  }
  ///Retourne une image provenant des assets
  Image fromAsset({required String path, required size, required double? height }){
    return Image.asset(
      path,
      fit: BoxFit.cover,
      height: height,
      width: size.width,
    );
  }
  ///Affichage d'un article
  Card articleFace({
        required size,
        required String authorName,
        required String lastTime,
        required String comment,
        required String numberLikes,
        required String numberComments
  }) {
     return Card(
       margin: const EdgeInsets.all(10),
       child: Column(
         children: [
           Row(
             children: [
               const Padding(
                  padding: EdgeInsets.all(2),
                  child: CircleAvatar(
                    radius: 25,
                    foregroundImage: AssetImage("images/andrea.jpg"),
                  )
               ),
               Text(authorName),
               const Spacer(),
               Text(lastTime),
             ],
           ),
           Stack(
               children: [
                 fromAsset(path: "images/maldives.jpg", size: size, height: 200)
               ]
           ),
           Text(comment),
           Padding(
               padding: const EdgeInsets.all(2),
               child: Row(
                 mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   const Icon(Icons.favorite),
                   Text("$numberLikes likes"),
                   const Icon(Icons.message),
                   Text("$numberComments Commentaires")
                 ],
               ),
           )
         ],
       ),
     );
  }

}
