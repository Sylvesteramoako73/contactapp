import 'package:contactapp/contact_model.dart';
import 'package:contactapp/contact_details_view.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_details_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> data = [
    {
      "name": "Cullen Ashley",
      "phone": "866-6863",
      "email": "pulvinar@protonmail.net",
      "country": "Brazil",
      "region": "Istanbul"
    },
    {
      "name": "Grady Olsen",
      "phone": "1-963-615-5146",
      "email": "ad.litora@yahoo.com",
      "country": "Turkey",
      "region": "Munster"
    },
    {
      "name": "Brenda Duke",
      "phone": "481-0724",
      "email": "ullamcorper.magna@aol.com",
      "country": "Austria",
      "region": "Pernambuco"
    },
    {
      "name": "frelina May",
      "phone": "0254761342",
      "email": "helinamvhim@gmail.com",
      "country": "Ghana",
      "region": "Tarkwa"
    },
    {
      "name": "Priscilla Gyan",
      "phone": "glowman@gmail.com",
      "email": "hannamangyan@gmail.com",
      "country": "Ghana",
      "region": "Koforidua"
    },
    {
      "name": "Authority",
      "phone": "0267186523",
      "email": "authorityman@gmail.com",
      "country": "Ghana",
      "region": "Eastern Region"
    },
    {
      "name": "Bernard Quayson",
      "phone": "0244764312",
      "email": "donec@aol.gh",
      "country": "Guinea",
      "region": "Kayseri"
    },
    {
      "name": "Solomon Kwofie",
      "phone": "0245671832",
      "email": "not available ",
      "country": "Ghana",
      "region": "Sekondi"
    },
    {
      "name": "Mummy",
      "phone": "0572431657",
      "email": "victoriamasai@gamail.com",
      "country": "Ghana",
      "region": "takoradi"
    },
    {
      "name": "Sis May",
      "phone": "0567278179",
      "email": "terkkwa1@gmail.com",
      "country": "Sweden",
      "region": "Ninh Thuận"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Contacts",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),
        ),
        actions: const [
          Center(
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/pic1.jpg'),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Recents",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            ListView.separated(
                //controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  ListTile(
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder:  (context){
                        return ContactDetailsView(
                          contact: Contact(name: 'Sylvester', 
                          phone: '+233 55 700 1326', 
                          email: 'sylvesteramoako73@gmail.com', 
                         country: 'Ghana', 
                          region: 'Western Region'));
                      }));
                    },
                    leading:const CircleAvatar(
                      backgroundImage: NetworkImage('https://media.istockphoto.com/photos/little-skateboarder-picture-id1283599893'),
                      radius: 25,
                    ),
                    title: const Text(
                      "Sylvester Amoako Yegoe",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    subtitle: const Text(
                      "+233 55 700 1326",
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Contacts",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
            GroupedListView<Map<String, dynamic>, String>(
              shrinkWrap: true,
              //controller: _scrollController,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, dynamic> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return  ContactDetailsView(contact: contact,);
                        }));
                      },
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage('assets/car.jpg'),
                        radius: 25,
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      subtitle: Text(
                        '${element['phone']}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name'].compareTo(item2['name']), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}