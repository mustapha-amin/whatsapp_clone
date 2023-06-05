class Message {
  Enum? status;
  String? body;

  Message({this.status, this.body});
}

enum status { incoming, outgoing }
