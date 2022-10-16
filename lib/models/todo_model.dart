class Todo {
  int? id;
  final String title;
  DateTime creationDate;
  bool isChecked;

  // create the constructor
  Todo({
    this.id,
    required this.title,
    required this.creationDate,
    required this.isChecked,
  });

  // to save this data in database we need to convert it to a map
  // let's create a function for that
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate
          .toString(), // sqflite database doesn't support the datetime type so we will save it as Text.
      'isChecked': isChecked
          ? 1
          : 0, // it doesn't support the boolean either, so we save that as integer.
    };
  }

  // this function is for debugging only
  @override
  String toString() {
    return 'Todo(id : $id, title : $title, creationDate : $creationDate, isChecked : $isChecked)';
  }
}
