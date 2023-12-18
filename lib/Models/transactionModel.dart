class TransactionModel{
  String id;
  String title;
  String transactionType;
  String category;
  String amount;
  DateTime addedTime;
  TransactionModel(this.id,this.title,this.transactionType,this.category,this.amount,this.addedTime);
}

class SalesData {
  SalesData(this.year,this.type, this.sales);
  final String year;
  String type;
  final double sales;
}