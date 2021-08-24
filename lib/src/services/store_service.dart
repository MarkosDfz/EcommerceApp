
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:store/src/models/store_model.dart';
import 'package:store/src/models/category_model.dart';

final _urlApi = '';
// final _urlApi = 'http://192.168.1.5:1337';
// final _urlApi = 'http://10.0.2.2:1337';

class StoreService with ChangeNotifier {

  // Constructor
  StoreService() {
    getStores();
    getProducts();
    getFavorites();
    getCategories();
  }

  // Data Type
  Store _store;
  int _qtyProd = 1;
  Product _product;
  int _tabIndex = 0;
  bool _isBtnProd = false;
  List<Store> _stores = [];
  List<Store> _favStores = [];
  List<Product> _favProds = [];
  List<Product> _products = [];
  List<Category> _categories = [];

  // Getters
  Store get store => this._store;
  int get qtyProd => this._qtyProd;
  int get tabIndex => this._tabIndex;
  Product get product => this._product;
  bool get isBtnProd => this._isBtnProd;
  List<Store> get stores => this._stores;
  List<Product> get products => this._products;
  List<Store> get favStores => this._favStores;
  List<Product> get favProds => this._favProds;
  List<Category> get categories => this._categories;

  // Setters
  set tabIndex( int value ) {
    this._tabIndex = value;
    notifyListeners();
  }

  set qtyProd( int value ) {
    this._qtyProd = value;
    notifyListeners();
  }

  set isBtnProd( bool value ) {
    this._isBtnProd = value;
    notifyListeners();
  }

  set product( Product prod ) {
    this._product = prod;
    notifyListeners();
  }

  set store( Store st ) {
    this._store = st;
    notifyListeners();
  }

  // Functions
  void getStores() async {

    final url = '$_urlApi/stores';

    final resp = await http.get( url );

    final storeResp = storeFromJson( resp.body );

    this._stores.addAll( storeResp );

    notifyListeners();

  }

  void getProducts() async {

    final url = '$_urlApi/products';

    final resp = await http.get( url );

    final prodResp = productFromJson( resp.body );

    this._products.addAll( prodResp );

    notifyListeners();

  }

  void getFavorites() async {

    final url = '$_urlApi/favorite-stores/1';
    final url2 = '$_urlApi/favorite-prods/1';

    final resp = await http.get( url );
    final resp2 = await http.get( url2 );

    final decodeData = json.decode( resp.body );
    final decodeData2 = json.decode( resp2.body );

    final s = json.encode( decodeData['stores'] );
    final s1 = json.encode( decodeData2['products'] );

    final favStoreResp = storeFromJson( s );
    final favProdResp = productFromJson( s1 );

    this._favStores.addAll( favStoreResp );
    this._favProds.addAll( favProdResp );

    notifyListeners();

  }

  void getCategories() async {

    final url = '$_urlApi/categories';

    final resp = await http.get( url );

    final categoryResp = categoryFromJson( resp.body );

    this._categories.addAll( categoryResp );

    notifyListeners();

  }

}