import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:ecom_mobile_flutter/models/product.dart';
import 'package:ecom_mobile_flutter/scoped_models/product_scoped.dart';
import 'package:ecom_mobile_flutter/widgets/product_list/product_card.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductsScopedModel productsModel = ProductsScopedModel();
    productsModel.getProducts();

    return new ScopedModel<ProductsScopedModel>(
      model: productsModel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "PRODUCT LIST",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: ProductsListPageBody(),
      ),
    );
  }
}

class ProductsListPageBody extends StatelessWidget {
  BuildContext context;
  ProductsScopedModel model;

  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return ScopedModelDescendant<ProductsScopedModel>(
      builder: (context, child, model) {
        this.model = model;
        return model.isLoading
            ? _buildCircularProgressIndicator()
            : _buildListView();
      },
    );
  }

  _buildCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildListView() {
    Size screenSize = MediaQuery.of(context).size;
    print('products count ' + model.productsCount.toString());
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: model.productsCount == 0
          ? Center(child: Text("No products available."))
          : ListView.builder(
              itemCount: model.productsCount + 2,
              itemBuilder: (context, index) {
                if (index == model.productsCount) {
                  if (model.hasMoreProducts) {
                    pageIndex++;
                    // model.parseProductsFromResponse(95, pageIndex);
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return Container();
                } else if (index == 0) {
                  //0th index would contain filter icons
                  return _buildFilterWidgets(screenSize);
                } else if (index % 2 == 0) {
                  //2nd, 4th, 6th.. index would contain nothing since this would
                  //be handled by the odd indexes where the row contains 2 items
                  return Container();
                } else {
                  //1st, 3rd, 5th.. index would contain a row containing 2 products

                  if (index > model.productsCount - 1) {
                    return Container();
                  }

                  print('build card ' + model.productsList[0].productName);
                  return Container();
                  // return ProductCard(
                  //   product1: model.productsList[index - 1],
                  //   product2: model.productsList[index],
                  // );
                }
              },
            ),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFilterButton("SORT"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("REFINE"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
  }
}
