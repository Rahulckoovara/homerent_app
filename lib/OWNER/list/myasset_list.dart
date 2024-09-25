import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MyAssetList extends StatelessWidget {
  final RxList<dynamic> assetData;
  final Function(String) onTap;
  const MyAssetList(this.assetData, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListView.builder(
        itemCount: assetData.length,
        itemBuilder: (context, index) {
          final asset = assetData[index];
          return GestureDetector(
            onTap: () {
              final assetId = asset['_id']
                  .toString(); 
              onTap(assetId);
            },
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 9),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color.fromRGBO(242, 242, 242, 1),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.098),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: const CircleAvatar(),
                  title: Column(
                    children: [
                      Text("${asset['assetname']}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("${asset['location']}"),
                    ],
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                )),
          );
        },
      ),
    );
  }
}
