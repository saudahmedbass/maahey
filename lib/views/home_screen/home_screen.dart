import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:maahey/models/brewery_model.dart';
import 'package:maahey/services/customFirebase.dart';
import 'package:maahey/views/brewery_details/brewery_details.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BreweryModel> breweryModel = [];

  @override
  void initState() {
    // TODO: implement initState

    getApiData();

    super.initState();
  }

  Future<void> getApiData() async {
    getxyz(
        url: 'https://api.openbrewerydb.org/breweries',
        onSuccess: (val) {
          setState(() {
            jsonDecode(val).forEach((e) {
              breweryModel.add(BreweryModel.fromJson(e));
            });
          });
        },
        onError: (val) {
          print(val.toString());
        });

    setState(() {});

    log(breweryModel.toString());
  }

  Future getxyz(
      {String? url,
      Function(String)? onSuccess,
      Function(String)? onError,
      var header}) async {
    try {
      print("this is get Url: $url");
      // print("this is header: ${jsonEncode(MyHeaders.header())}");
      var response = await http
          .get(Uri.parse(url!), headers: header)
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw Exception("Request Time Out");
      });
      print(response.statusCode);
      log(response.body);
      if (response.statusCode == 200) {
        onSuccess!(response.body);
      } else if (response.statusCode == 204) {
        onError!(response.body);
      } else if (response.statusCode == 404) {
        onError!(response.body);
      } else {
        print("i am in error  ${response.body}");
        onError!(response.body);
      }
    } catch (e) {
      print("i am in error catch ${e.toString()}");
      onError!(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CustomFirebase>().signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: breweryModel.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView.builder(
                itemCount: breweryModel.length,
                itemBuilder: (BuildContext context, int i) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => brewery_details(
                            breweryModel: breweryModel[i],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      color: Colors.amber[100],
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Wrap(
                        children: [
                          Text(
                            breweryModel[i].name.toString(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
