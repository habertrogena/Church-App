class ChatModel {
  // details which will be included in the ticket.
  //this class will hold data and provide methods to manipulate it.
  final String category; // a string value representing the current chat
  final String description;

  final String tenantId; // currently logged in user.
  String? ticketStatus =
      'open'; // a string value that represents the status of the ticket
  final String? landlordId; // lanlords id linked to the current logged in user
  final List<String>? respondandId; // an array of strings that maps to ids
  DateTime? dateTime = DateTime.now(); // date and time the ticket was raised.

  //

  ChatModel({
    required this.category,
    required this.description,
    required this.tenantId,
    this.landlordId,
    this.respondandId,
    this.ticketStatus,
    this.dateTime,
  });
  // craate a named constructor fromJson
  factory ChatModel.fromJson(Map json) {
    return ChatModel(
        category: json['category'],
        description: json['description'],
        tenantId: json['tenant_id'] ?? '',
        ticketStatus: json['ticketStatus'],
        landlordId: json['landlord_id'],
        respondandId: json['respondandId'],
        dateTime: DateTime.parse(json["dateTime"]));
  }

  // create a method that returns ToJson
  Map<String, dynamic> toJson() => {
        "category": category,
        "description": description,
        "tenant_id": tenantId,
        "ticketStatus": ticketStatus,
        "landlord_id": landlordId,
        "respondandId": respondandId ?? [],
        "dateTime": DateTime.now().toString()
      };

  //
}
