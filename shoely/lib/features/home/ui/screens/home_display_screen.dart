import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:priority_soft/features/home/ui/screens/home_detail_screen.dart';
import 'package:priority_soft/features/home/ui/widgets/home_display_widget.dart';
import 'package:priority_soft/service/database.dart';

class HomeDisplayScreen extends StatefulWidget {
  final String selestedBrandName;
  const HomeDisplayScreen({super.key, required this.selestedBrandName});

  @override
  State<HomeDisplayScreen> createState() => _HomeDisplayScreenState();
}

class _HomeDisplayScreenState extends State<HomeDisplayScreen> {
  Stream<QuerySnapshot>? _productStream = DatabaseMethods().getAllProdducts();

  @override
  void initState() {
    _updateProductStream(widget.selestedBrandName);
    super.initState();
  }

  @override
  void didUpdateWidget(HomeDisplayScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selestedBrandName != oldWidget.selestedBrandName) {
      _updateProductStream(widget.selestedBrandName);
    }
  }

  void _updateProductStream(String brandName) {
    if (brandName.toLowerCase() == "all") {
      _productStream = DatabaseMethods().getAllProdducts();
    } else {
      _productStream =
          DatabaseMethods().getAllProdductsByBrand(brandName.toLowerCase());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _productStream != null
        ? StreamBuilder<QuerySnapshot>(
            stream: _productStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeDetailScreen(
                                id: snapshot.data!.docs[index].id),
                          ));
                        },
                        child: HomeDisplayWidget(
                          productName: snapshot.data!.docs[index]['title'],
                          price: snapshot.data!.docs[index]['price'],
                          id: snapshot.data!.docs[index].id,
                          rate: '3',
                          review: '3',
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 17,
                      childAspectRatio: 0.65,
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        : const Center(child: CircularProgressIndicator());
  }
}
