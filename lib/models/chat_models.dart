class ChatModel {
  final String message;
  final int index;
  const ChatModel({required this.message, required this.index});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        message: json['message'],
        index: json['index'],
      );
}
