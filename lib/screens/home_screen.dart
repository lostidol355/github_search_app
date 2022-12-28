import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_user_app/models/github_user_model.dart';
import 'package:github_user_app/services/api_services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentUserName = "lostidol355";
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 29, 43, 72),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: ApiServices().getGithubUserData(currentUserName),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      GithubUser data = snapshot.data as GithubUser;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Devfinder",
                                    style: GoogleFonts.spaceMono(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                                Row(
                                  children: const [
                                    Text(
                                      "Light",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Icon(
                                        FontAwesomeIcons.lightbulb,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      child: TextField(
                                        controller: _searchController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Search",
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade400),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Colors.grey.shade400,
                                            )),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            currentUserName =
                                                _searchController.text;
                                          });
                                        },
                                        child: const Icon(Icons.search)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 400,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(
                                                data.avatar!,
                                                
                                              ),
                                        )),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            Text(data.userName!),
                                            Text(data.location == null
                                                ? ""
                                                : data.location!),
                                            Text(data.bio == null
                                                ? ""
                                                : data.bio!),
                                          ],
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return const CircularProgressIndicator();
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
