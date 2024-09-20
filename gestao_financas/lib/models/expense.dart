class Expense {
  int? id;
  String description;
  double amount;
  DateTime date;

  Expense({this.id, required this.description, required this.amount, required this.date});

  // Convertendo um objeto para um mapa para armazenar no banco de dados
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  // Convertendo um mapa para um objeto Expense
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      description: map['description'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
    );
  }
}
