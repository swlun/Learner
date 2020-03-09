class ActivitiesData {
  static final getData = [
    {
      
    }
  ];
}

class Item {
  final String key;
  String name;

  Item.fromJson(this.key, Map data) {
    if( name == null) {
      name = '';
    }
  }
  
}

class FirebaseSync {
  
}