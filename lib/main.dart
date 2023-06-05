import 'package:flutter/material.dart';
import 'const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    double Dwidth = MediaQuery.of(context).size.width;
    double Dheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookmark Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {





  @override
  Widget build(BuildContext context) {
    var items = ['Java', 'Cse', 'Se'];
    // List<bool> numberTruthList = [true, false, true, true, true, true];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Bookmark Manager'),
        ),
        body: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Const.appBarTitle,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showMyDialog('title', 'ok');
                    },
                    child: Text('Add Bookmarks'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 130,
                                width: 200,
                                color: Const.backgroundColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                    itemCount: 3,
                                    itemBuilder: (context, i) {
                                      return Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(numberTruthList[i].toString()),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: Text('Details'))
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 130,
                                width: 200,
                                color: Const.backgroundColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                    itemCount: 3,
                                    itemBuilder: (context, i) {
                                      //if(numberTruthList[i]){
                                      return Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(numberTruthList1[i].toString()),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: Text('Details'))
                                          ],
                                        ),
                                      );
                                      // }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          color: Const.backgroundColor,
                         // alignment: Alignment.centerLeft,
                          child: const Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Title JavaScript'),
                              Text('URL www.xyz.com'),
                              Text('Category A'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Future<void> showMyDialog(String titile, String id) async {
    titleController.text = titile.toString();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Title"),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: urlController,
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
                TextField(
                  controller: urlController,
                  decoration: const InputDecoration(hintText: 'URL'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      hint: Text('Category'),
                      items: <String>['A', 'B', 'C', 'D'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                    TextButton(
                        onPressed: () {
                          addNewCategory();
                        },
                        child: Icon(Icons.add))
                  ],
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Save"),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  Future<void> addNewCategory() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add New Category"),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: urlController,
                  decoration: const InputDecoration(hintText: 'Category Name'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Add"),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
