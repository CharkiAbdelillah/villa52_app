import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:villa52/models/product.dart';
import 'package:villa52/pages/base_page.dart';
import 'package:villa52/provider/products_provider.dart';
import 'package:villa52/widgets/widget_product_card.dart';
import 'package:villa52/api_service.dart';

class ProductPage extends BasePage {
  ProductPage({Key key, this.categoryId}) : super(key: key);
  int categoryId;
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends BasePageState<ProductPage> {
  int _page = 1;
  final _sortByOptions = [
    SortBy("popularity", "Popularity", "asc"),
    SortBy("modified", "Latest", "asc"),
    // SortBy("popularity", "Popularity", "asc"),
    // SortBy("popularity", "Popularity", "asc")
  ];

  @override
  void initState() {
    var productList = Provider.of<ProductProvider>(context, listen: false);
    productList.resetStreams();
    productList.setLoadingState(LoadMoreStatus.INITIAL);
    productList.fetchProducts(_page);
    super.initState();
  }

  @override
  Widget pageUI() {
    return _productsList();
    // return Text(this.widget.categoryId.toString());
  }

  Widget _productsList() {
    return new Consumer<ProductProvider>(
      builder: (context, productModel, child) {
        if (productModel.allProduct != null &&
            productModel.allProduct.length > 0 &&
            productModel.getLoadMoreStatus() != LoadMoreStatus.INITIAL) {
          return _buildList(productModel.allProduct);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildList(List<Product> items) {
    return Column(
      children: [
        _productFilters(),
        Flexible(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: items.map((Product item) {
              return ProductCard(
                data: item,
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _productFilters() {
    return Container(
      height: 51,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none),
                fillColor: Color(0xffe6e6ec),
                filled: true,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffe6e6ec),
              borderRadius: BorderRadius.circular(9.0),
            ),
            child: PopupMenuButton(
              onSelected: (sortBy) {},
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                    value: item,
                    child: Container(
                      child: Text(item.text),
                    ),
                  );
                }).toList();
              },
              icon: Icon(Icons.tune),
            ),
          ),
        ],
      ),
    );
  }
}
