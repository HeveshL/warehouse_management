import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_management/models/product.dart';
import 'package:warehouse_management/screens/new_product_page.dart';
import 'package:warehouse_management/utils/color_palette.dart';
import 'package:warehouse_management/widgets/product_card.dart';

class SearchProductInGroupPage extends StatefulWidget {
  final String? name;
  const SearchProductInGroupPage({Key? key, this.name}) : super(key: key);

  @override
  State<SearchProductInGroupPage> createState() =>
      _SearchProductInGroupPageState();
}

class _SearchProductInGroupPageState extends State<SearchProductInGroupPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FocusNode? inputFieldNode;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    inputFieldNode = FocusNode();
  }

  @override
  void dispose() {
    inputFieldNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.pacificBlue,
        child: SafeArea(
          child: Container(
            color: ColorPalette.aquaHaze,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 15,
                  ),
                  width: double.infinity,
                  height: 90,
                  decoration: const BoxDecoration(
                    color: ColorPalette.pacificBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.chevron_left_rounded,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Expanded(
                        child: TextFormField(
                          focusNode: inputFieldNode,
                          autofocus: true,
                          initialValue: searchQuery,
                          onFieldSubmitted: (value) {
                            setState(() {
                              searchQuery = value;
                              FocusScope.of(context)
                                  .requestFocus(inputFieldNode);
                            });
                          },
                          textInputAction: TextInputAction.search,
                          key: UniqueKey(),
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 24,
                            color: ColorPalette.timberGreen,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Product Name",
                            filled: true,
                            fillColor: Colors.transparent,
                            hintStyle: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 24,
                              color: ColorPalette.timberGreen.withOpacity(0.58),
                            ),
                          ),
                          cursorColor: ColorPalette.timberGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Expanded(
                            child: searchQuery.isEmpty
                                ? const SizedBox()
                                : StreamBuilder(
                                    stream: _firestore
                                        .collection("products")
                                        .where("group", isEqualTo: widget.name)
                                        .where(
                                          'name',
                                          isGreaterThanOrEqualTo: searchQuery,
                                          isLessThan: searchQuery.substring(
                                                0,
                                                searchQuery.length - 1,
                                              ) +
                                              String.fromCharCode(
                                                searchQuery.codeUnitAt(
                                                      searchQuery.length - 1,
                                                    ) +
                                                    1,
                                              ),
                                        )
                                        .orderBy('name')
                                        .snapshots(),
                                    builder: (
                                      BuildContext context,
                                      AsyncSnapshot<
                                              QuerySnapshot<
                                                  Map<String, dynamic>>>
                                          snapshot,
                                    ) {
                                      if (!snapshot.hasData) {
                                        return const Center(
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: CircularProgressIndicator(
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      }
                                      return ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ProductCard(
                                            product: Product.fromMap(
                                              snapshot.data!.docs[index].data(),
                                            ),
                                            docID: snapshot.data!.docs[index].id,
                                          );
                                        },
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
