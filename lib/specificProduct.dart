class ProductListing{
  double itemPrice;
  double itemSalePrice;
  int itemQuantity;
  String itemName;

  ProductListing(this.itemName, this.itemPrice, this.itemSalePrice, this.itemQuantity);


  bool isSold(){
    bool soldProduct = false;
    if(itemSalePrice != null){
      soldProduct = true;
    }

    return soldProduct;
  }


  void setName(String name){

  }

  void setItemPrice(double num){

  }

  void setItemSalePrice(double num){

  }
  void setItemQuantity(int num){

  }

  String getName(){
    return itemName;
  }

  double getItemPrice(){
    return itemPrice;
  }

  double getItemSalePrice(){
    return itemSalePrice;
  }

  int getItemQuantity(){
    return itemQuantity;
  }
}