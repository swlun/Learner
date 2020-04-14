class Activities {
  final String id;
  final String address;
  final String date;
  final String description;
  final String endTime;
  final String location;
  final String price;
  final String startTime;
  final String subject;
  final String tag;
  final String title;

  Activities({this.id, this.address, this.date, this.description, this.endTime, this.location, this.price, this.startTime, this.subject, this.tag, this.title});

  Activities.fromMap(Map snapshot, String docId) :
    id = docId ?? '',
    address = snapshot['address'] ?? '',
    date = snapshot['date'] ?? '',
    description = snapshot['description'] ?? '',
    endTime = snapshot['endTime'],
    location = snapshot['location'] ?? '',
    price = snapshot['price'] ?? '',
    startTime = snapshot['startTime'] ?? '',
    subject = snapshot['subject'] ?? '',
    tag = snapshot['tag'] ?? '',
    title = snapshot['title'] ?? '';
      
  toJson() {
    return {
      "id": id,
      "address": address,
      "date": date,
      "description": description,
      "endTime": endTime,
      "location": location,
      "price": price,
      "startTime": startTime,
      "subject": subject,
      "tag": tag,
      "title": title,
    };
  }
}