class StoreItem {
  String imageUrl;
  String name;
  String prefecture;
  String price;
  String time;
  int ratingCount;
  double rating;

  StoreItem(
      {this.imageUrl,
      this.name,
      this.prefecture,
      this.price,
      this.time,
      this.rating,
      this.ratingCount,
    });
}

List<StoreItem> experiences = [
  StoreItem(
    imageUrl: 'assets/Icon/client1.jpeg', 
    name: "飯とおかず 酒と肴 花",
    prefecture: "[兵庫] 神戸 三ノ宮",
    price: "10,000",
    time: "9:00~15:00",
    rating: 4.99,
    ratingCount: 2
  ),
  StoreItem(
    imageUrl: 'assets/Icon/client2.jpeg', 
    name: "Magie",
    prefecture: "[兵庫] 神戸 三ノ宮",
    price: "10,000",
    time: "9:00~15:00",
    rating: 4.99,
    ratingCount: 2
  ),
  // StoreItem(
  //   imageUrl: 'assets/Icon/client3.png', 
  //   name: "MAGIE's 風",
  //   prefecture: "[兵庫] 神戸 三ノ宮",
  //   price: "10,000",
  //   rating: 4.99,
  //   ratingCount: 1
  // ),
];
