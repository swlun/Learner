class Activities {
  final String date;
  final String description;
  final String location;
  final String time;
  final String userId;
  final List<String> tag;
  final String price;

  Activities({this.date, this.description, this.location, this.time, this.userId, this.tag, this.price});

  Activities.fromMap(Map snapshot) :
    date= snapshot['date'] ?? '',
    description = snapshot['description'] ?? '',
    location = snapshot['location'] ?? '',
    time = snapshot['time'] ?? '',
    userId = snapshot['userId'] ?? '',
    tag = snapshot['tag'] ?? '',
    price = snapshot['price'] ?? false;
      
  toJson() {
    return {
      "date": date,
      "description": description,
      "location": location,
      "time": time,
      "userId": userId,
      "tag": tag,
      "price": price,
    };
  }
}