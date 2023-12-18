class TransactionModel{
  String id;
  String title;
  String transactionType;
  String category;
  String amount;
  DateTime addedTime;
  String month;
  TransactionModel(this.id,this.title,this.transactionType,this.category,this.amount,this.addedTime,this.month);
}

class SalesData {
  SalesData(this.year,this.type, this.sales);
  final String year;
  String type;
  final double sales;
}