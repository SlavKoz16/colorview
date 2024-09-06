import 'package:colorview/data/ad_data_repository.dart';
import 'package:colorview/presentation/ads/addView.dart';
import 'package:colorview/presentation/ads/photoView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArchiveView extends StatefulWidget {
  @override
  _archiveViewState createState() => _archiveViewState();
}

class _archiveViewState extends State<ArchiveView> {
  @override
  Widget build(BuildContext context) {
    final adDataRepository = Provider.of<AdDataRepository>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: const Color(0xFFE5E5E5),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 50,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateAdView()));
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminView()));
                  },
                  child: Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: adDataRepository.active == true ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text('Активные'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    adDataRepository.changeActive(false);
                  },
                  child: Container(
                    height: 32,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: adDataRepository.active == false ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text('Архив'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Column(
                children: List.generate(10, (index) {
                  return const AdCard();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AdCard extends StatelessWidget {
  const AdCard({super.key});

  @override
  Widget build(BuildContext context) {
    final adDataRepository = Provider.of<AdDataRepository>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Container(

        width: MediaQuery.of(context).size.width-32,
        decoration:  BoxDecoration(
          color: adDataRepository.active == false ? Colors.grey.shade300: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Заголовок",
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                "Текст",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 130,
                    height: 24,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Перейти на сайт",
                        style: TextStyle(
                            fontSize: 10, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 24,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child:  Text(
                        adDataRepository.active == false ? 'Активировать' :  "В архив",
                        style: const TextStyle(
                            fontSize: 10, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
