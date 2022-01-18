import 'package:flutter/material.dart';
import 'github.dart';

class UserList extends StatelessWidget {
  final List<Items> itensGit;

  const UserList({Key? key, required this.itensGit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Service'),
      ),
      body: ListView.builder(
        itemCount: itensGit.length,
        itemBuilder: (context, i) {
          return Container(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyPage(
                          watchersCount: itensGit[i].watchersCount,
                          stargazersCount: itensGit[i].stargazersCount,
                          fullName: itensGit[i].name,
                          language: itensGit[i].language,
                          forksCount: itensGit[i].forksCount,
                          contributorsUrl: itensGit[i].contributorsUrl,
                          followersUrl: itensGit[i].owner.followersUrl,
                          openIssues: itensGit[i].openIssues,
                          avatarUrl: itensGit[i].owner.avatarUrl,
                        )),
              );
            },
            child: Card(
              elevation: 10,
              child: Row(
                children: [
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    SizedBox(
                      child: Center(
                        child: Image.network(
                          itensGit[i].owner.avatarUrl,
                          height: 100.0,
                          width: 100.0,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                        ),
                        Text('${itensGit[i].stargazersCount}'),
                        Icon(Icons.alt_route_sharp),
                        Text('${itensGit[i].forksCount}'),
                      ],
                    ),
                  ]),
                  Flexible(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            itensGit[i].name,
                            style: TextStyle(
                              fontSize:
                                  20 * MediaQuery.of(context).textScaleFactor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            itensGit[i].owner.login,
                            style: TextStyle(
                              fontSize:
                                  20 * MediaQuery.of(context).textScaleFactor,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String fullName;
  final String contributorsUrl;
  final String followersUrl;
  final int stargazersCount;
  final int forksCount;
  final int openIssues;
  final String language;
  final String avatarUrl;
  final int watchersCount;

  const MyPage(
      {Key? key,
      required this.watchersCount,
      required this.forksCount,
      required this.stargazersCount,
      required this.contributorsUrl,
      required this.fullName,
      required this.language,
      required this.followersUrl,
      required this.openIssues,
      required this.avatarUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2448c6),
        body: Container(
            width: double.infinity,
            height: 400.00,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 10,
                    child: Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                fullName,
                                style: TextStyle(
                                  fontSize: 20 *
                                      MediaQuery.of(context).textScaleFactor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                language,
                                style: TextStyle(
                                  fontSize: 20 *
                                      MediaQuery.of(context).textScaleFactor,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.admin_panel_settings_outlined,
                                  ),
                                  Text('$openIssues'),
                                  Icon(Icons.add_to_photos_rounded),
                                  Text('$watchersCount'),
                                  Icon(
                                    Icons.star,
                                  ),
                                  Text('$stargazersCount'),
                                  Icon(Icons.alt_route_sharp),
                                  Text('$forksCount'),
                                ],
                              ),
                            ]),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Image.network(
                                  avatarUrl,
                                  height: 100.0,
                                  width: 100.0,
                                  alignment: Alignment.topRight,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
