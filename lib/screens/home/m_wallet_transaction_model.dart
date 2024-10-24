class WalletTransactionModel {
  final String id;
  final String userId;
  final String imageUrl;
  final String walletTitle;
  final String createdAt;
  final String walletDescription;
  final int amount;
  final List<EachWalletTransactionModel> cashTransaction;

  WalletTransactionModel(
      {required this.id,
      required this.cashTransaction,
      required this.walletTitle,
      required this.userId,
      required this.createdAt,
      required this.amount,
      required this.imageUrl,
      required this.walletDescription});

  factory WalletTransactionModel.fromJson(
      {required Map<String, dynamic> json}) {
    List<EachWalletTransactionModel> list = [];
    for (var r in json["cashTransaction"]) {
      list.add(EachWalletTransactionModel.fromJson(json: r));
    }
    return WalletTransactionModel(
        cashTransaction: list,
        walletDescription: json['walletDescription'] ?? "",
        id: json["id"] ?? "",
        walletTitle: json["walletTitle"] ?? "",
        amount: json["amount"] ?? 0,
        userId: json["userId"] ?? "",
        createdAt: json["createdAt"] ?? "",
        imageUrl: json["imageUrl"] ?? "");
  }
}

class EachWalletTransactionModel {
  // {
  // "id": "62fb88f8-2131-4e6e-938f-6591bfc8761d",
  // "amount": 100000,
  // "cashCategory": {
  // "name": "Shopping"
  // },
  // "createdAt": "2024-10-09T03:09:38.387Z",
  // "description": "De Tine Ya Dr",
  // "title": "Ko Ny Ko Toe",
  // "transactionImageUrl": "https://www.looper.com/img/gallery/is-mr-bean-an-alien-a-very-wild-and-believable-fan-theory-explained/intro-1707931922.jpg",
  // "type": "INCOME"
  // }

  final String id;
  final int amount;
  final String name;
  final String createdAt;
  final String description;
  final String title;
  final String transactionImageUrl;
  final String type;

  EachWalletTransactionModel(
      {required this.createdAt,
      required this.amount,
      required this.type,
      required this.id,
      required this.title,
      required this.transactionImageUrl,
      required this.description,
      required this.name});

  factory EachWalletTransactionModel.fromJson(
      {required Map<String, dynamic> json}) {
    return EachWalletTransactionModel(
        createdAt: json["createdAt"] ?? "",
        amount: json["amount"] ?? 0,
        type: json["type"] ?? "",
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        transactionImageUrl: json["transactionImageUrl"] ?? "",
        description: json["description"] ?? "",
        name: json["cashCategory"]["name"] ?? "");
  }
}

// "data": {
// "amount": 100000,
// "id": "1188d1d2-0215-42dc-b85d-df070ad8d72b",
// "userId": "995fcde1-e95e-4057-9c75-767058c7b567",
// "imageUrl": "https://play-lh.googleusercontent.com/ErPz7wvjl-tmKkfsTDtxz4XepVocji0Mo0k9Somq7ydxA7y49JHU9EnGMUGDUY9Nveq-=w240-h480-rw",
// "walletTitle": "CB Pay",
// "walletDescription": "CB Pay",
// "createdAt": "2024-10-08T16:10:29.507Z",
// "updatedAt": "2024-10-08T16:10:29.507Z",
// "cashTransaction": [
// {
// "id": "62fb88f8-2131-4e6e-938f-6591bfc8761d",
// "amount": 100000,
// "cashCategory": {
// "name": "Shopping"
// },
// "createdAt": "2024-10-09T03:09:38.387Z",
// "description": "De Tine Ya Dr",
// "title": "Ko Ny Ko Toe",
// "transactionImageUrl": "https://www.looper.com/img/gallery/is-mr-bean-an-alien-a-very-wild-and-believable-fan-theory-explained/intro-1707931922.jpg",
// "type": "INCOME"
// }
// ]
// }
