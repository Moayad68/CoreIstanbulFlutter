import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/facilities_provider.dart';

class FacilitiesPage extends StatefulWidget {
  const FacilitiesPage({super.key});

  @override
  State<FacilitiesPage> createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage> {
  @override
  Widget build(BuildContext context) {
     Provider<FacilityProvider> facility_provider;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.20,
          child: ListTile(
            title: Text("Welcome Moayad"),
            subtitle: Text('data'),
            leading: Icon(Icons.account_circle),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          color: Color.fromARGB(255, 255, 213, 151),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                  //  Text(facility_provider.fasilityList[index].officetype),
                    Text("16 office"),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 3, // proveder.list.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("https://www.freepik.com/free-photo/group-diverse-people-having-business-meeting_2894621.htm#query=MEETING&position=0&from_view=search&track=sph"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("userName"),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Office Type"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Available"),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              )),
            ],
          ),
        )
      ],
    ));
  }
}
