  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tranarc/screens/mobile/product/models/Product.dart';
import 'package:tranarc/screens/mobile/product/screens/edit_product/provider_models/ProductDetails.dart';
import 'components/body.dart';

class EditProductScreen extends StatelessWidget {
  final Product productToEdit;

  const EditProductScreen({Key key, this.productToEdit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetails(),
      child: Scaffold(
        appBar: AppBar(),
        body: Body(
          productToEdit: productToEdit,
        ),
      ),
    );
  }
}
