import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_user_app/models/github_user_model.dart';
import 'package:github_user_app/services/api_services.dart';
import 'package:github_user_app/widgets/info_row.dart';
import 'package:github_user_app/widgets/stats_row.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentUserName = "neptechpal";
  GithubUser currentUser = GithubUser();
  final TextEditingController _searchController = TextEditingController();

  getUsercurrentUser(String userName) async {
    currentUser = await ApiServices().getGithubUserData(userName);
    setState(() {});
  }

  @override
  void initState() {
    getUsercurrentUser(currentUserName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 43, 72),
        body: SingleChildScrollView(
          child: Column(
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
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                          width: MediaQuery.of(context).size.width - 60,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey.shade400,
                                )),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              getUsercurrentUser(_searchController.text);
                              _searchController.clear();
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: SizedBox(
                            width: double.maxFinite,
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage(
                                        currentUser.avatar == null
                                            ? "https://avatars.githubusercontent.com/u/44658790"
                                            : currentUser.avatar!,
                                      ),
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            currentUser.name == null
                                                ? ""
                                                : currentUser.name!,
                                            style: const TextStyle(
                                                color: Colors.indigo,
                                                fontSize: 20),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(currentUser.userName ?? ""),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                              "Joined ${currentUser.joinDate}"),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Text(currentUser.bio == null
                            ? " This profile has no bio"
                            : currentUser.bio!),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                StatsColumn(
                                  statTitle: "Repos",
                                  statValue: currentUser.publicRepos.toString(),
                                ),
                                StatsColumn(
                                  statTitle: "Followers",
                                  statValue: currentUser.followers.toString(),
                                ),
                                StatsColumn(
                                  statTitle: "Following",
                                  statValue: currentUser.following.toString(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // location
                        InfoRow(
                          leadingIcon: const Icon(FontAwesomeIcons.map),
                          info: currentUser.location == null
                              ? "Not available"
                              : currentUser.location!,
                        ),

                        InfoRow(
                          leadingIcon: const Icon(FontAwesomeIcons.link),
                          info: currentUser.blog == null
                              ? "Not available"
                              : currentUser.blog!,
                        ),
                        InfoRow(
                          leadingIcon: const Icon(FontAwesomeIcons.twitter),
                          info: currentUser.twitter == null
                              ? "Not available"
                              : currentUser.twitter!,
                        ),

                        InfoRow(
                          leadingIcon: const Icon(FontAwesomeIcons.city),
                          info: currentUser.organization == null
                              ? "Not available"
                              : currentUser.organization!,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
