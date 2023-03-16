import 'package:flutter/material.dart';
import 'package:manicure_appointment/pages/master_page.dart';


const List<Map> masterList = [
  {
    'name': 'Виолетта Дудит',
    'address': 'ул.Пушкина д.Колотушкина, кв1',
    'reviews' : 856,
    'stars': 4,
    'like': true,
    'works': [
      'https://n1s1.hsmedia.ru/24/4a/27/244a27f8dbc1db162131de58415c26ca/480x600_1_d6ea0f43c61073652f4625ea8d16b345@1080x1349_0xac120003_7166556151662121640.jpeg',
      'https://www.acvarel-salon.ru/assets/cache_image/upload/786/0/1559720137-manikur-gel_205x205_27e.jpg',
      'https://www.acvarel-salon.ru/assets/cache_image/upload/898/0/1573032316-french-t_205x205_27e.jpg',
      'https://www.acvarel-salon.ru/assets/cache_image/upload/898/903/1573032438-dizain-t_205x205_27e.jpg',
      'https://www.acvarel-salon.ru/assets/cache_image/upload/898/903/1573032438-dizain-t_205x205_27e.jpg',
      'https://www.acvarel-salon.ru/assets/cache_image/upload/786/906/1573032981-zarina-melnik_205x205_27e.jpg',
      'https://www.acvarel-salon.ru/assets/cache_image/upload/901/0/1591016283-manik-lera_205x205_27e.jpg',
      'https://www.acvarel-salon.ru/assets/cache_image/upload/44/228/1457960296-rabota-1_205x205_27e.jpg',
      'https://www.acvarel-salon.ru/assets/cache_image/upload/880/881/1563520768-fursova_205x205_27e.jpg',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
      'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
    ],
    'services': [
      'педикюр', 'маникюр'
    ],
    'text_of_reviews': [
      'Всё круто', 'Дерьмо'
    ]
  },
  {
    'name': 'Мастер 2',
    'address': 'ул.Крансовка, д4',
    'reviews' : 856,
    'stars': 0,
    'like': false,
    'works': [
      "https://i.dummyjson.com/data/products/4/1.jpg",
      "https://i.dummyjson.com/data/products/4/2.jpg",
      "https://i.dummyjson.com/data/products/4/3.jpg",
      "https://i.dummyjson.com/data/products/4/4.jpg",
      "https://i.dummyjson.com/data/products/4/thumbnail.jpg"
    ],
    'services': [
      'педикюр', 'маникюр'
    ],
    'text_of_reviews': [
      'Всё круто', 'Дерьмо'
    ]
  },
  {
    'name': 'Мастер 3',
    'address': 'ул.Крансовка, д5',
    'reviews' : 856,
    'stars': 3,
    'like': true,
    'works': [
      "https://i.dummyjson.com/data/products/1/1.jpg",
      "https://i.dummyjson.com/data/products/1/2.jpg",
      "https://i.dummyjson.com/data/products/1/3.jpg",
      "https://i.dummyjson.com/data/products/1/4.jpg",
      "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
    ],
    'services': [
      'педикюр', 'маникюр'
    ],
    'text_of_reviews': [
      'Всё круто', 'Дерьмо'
    ]
  },
  {
    'name': 'Мастре 4',
    'address': 'ул.Крансовка, д6',
    'reviews' : 856,
    'stars': 2,
    'like': false,
    'works': [
      "https://i.dummyjson.com/data/products/2/1.jpg",
      "https://i.dummyjson.com/data/products/2/2.jpg",
      "https://i.dummyjson.com/data/products/2/3.jpg",
      "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
    ],
    'services': [
      'педикюр', 'маникюр'
    ],
    'text_of_reviews': [
      'Всё круто', 'Дерьмо'
    ]
  },
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Мастера'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.separated(
              itemCount: masterList.length,//количество мастеров
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  key: Key(masterList[index]['name'].toString()),
                  child: Card(
                    child: ElevatedButton(
                      child: Text(masterList[index]['name'].toString()),
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            '/master',
                            arguments: MasterPage(masterList[index]['name'].toString())
                        );
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
          )
      );
  }
}
