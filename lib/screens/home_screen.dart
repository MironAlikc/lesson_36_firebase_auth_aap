import 'package:flutter/material.dart';
import 'package:lesson_36_firebase_auth/data_model.dart';
import 'package:lesson_36_firebase_auth/datatuo_model.dart';
import 'package:lesson_36_firebase_auth/firebase_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final controllerImage = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: controllerImage,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                onPressed: () {
                  FirebaseServices().createData(
                    model: DataModel(
                      data: controller.text,
                      image: controllerImage.text,
                    ),
                  );
                  FirebaseServices().createDatatuo(
                    tuomodel: DatatuoModel(
                      title: controller.text,
                    ),
                  );
                  print(1111);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    // FirebaseServices()
                    //     .removeFromDataBase(snapshot.data?[index].id ?? '');
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 25,
                    weight: 5,
                  )),
            ),
            StreamBuilder(
                stream: FirebaseServices().getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                    snapshot.data?[index].image ?? ''),
                                Text(
                                  snapshot.data?[index].data ?? '',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                })
          ],
        ),
      ),
    );
  }
}
