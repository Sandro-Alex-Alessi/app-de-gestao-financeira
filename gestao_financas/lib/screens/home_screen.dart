import 'package:flutter/material.dart';
import 'add_expense_screen.dart';
import '../db/database_helper.dart';
import '../models/expense.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> _expenses = [];
  double _totalExpense = 0.0;
   // Declaração das variáveis de total por dia, mês e ano
  double _totalExpenseDay = 0.0;
  double _totalExpenseMonth = 0.0;
  double _totalExpenseYear = 0.0;
  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  // Calcula o total de gastos para o dia atual
double _calculateTotalForDay(List<Expense> expenses, DateTime date) {
  return expenses
      .where((expense) =>
          expense.date.year == date.year &&
          expense.date.month == date.month &&
          expense.date.day == date.day)
      .fold(0, (sum, expense) => sum + expense.amount);
      
}

// Calcula o total de gastos para o mês atual
double _calculateTotalForMonth(List<Expense> expenses, DateTime date) {
  return expenses
      .where((expense) =>
          expense.date.year == date.year && expense.date.month == date.month)
      .fold(0, (sum, expense) => sum + expense.amount);
}

// Calcula o total de gastos para o ano atual
double _calculateTotalForYear(List<Expense> expenses, DateTime date) {
  return expenses
      .where((expense) => expense.date.year == date.year)
      .fold(0, (sum, expense) => sum + expense.amount);
}


  Future<void> _loadExpenses() async {
    List<Expense> expenses = await DatabaseHelper().getExpenses();
    setState(() {
      _expenses = expenses;
      _totalExpense = expenses.fold(0, (sum, item) => sum + item.amount);
    });
  }

  void _addExpense() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddExpenseScreen()),
    );
    if (result == true) {
      _loadExpenses();
    }
  }

  void _removeExpense(int id) async {
    await DatabaseHelper().deleteExpense(id);
    _loadExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda Financeira', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.tealAccent.shade400,
      ),
      
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.tealAccent.shade400,// Cor da borda
                width: 2.0, // Largura da borda
              ),
            borderRadius: BorderRadius.circular(8.0), // Arredondamento dos cantos, se necessário
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Gasto: R\$ $_totalExpense',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          
        ),

        Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    //crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
  crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
      children: [
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.tealAccent.shade400, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Total Gasto Hoje: R\$ ${_calculateTotalForDay(_expenses, DateTime.now())}',
        style: TextStyle(fontSize: 20),
      ),
    ),
    SizedBox(height: 10),
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.tealAccent.shade400, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Total Gasto no Mês: R\$ ${_calculateTotalForMonth(_expenses, DateTime.now())}',
        style: TextStyle(fontSize: 20),
      ),
    ),
    SizedBox(height: 10),
    Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.tealAccent.shade400, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Total Gasto no Ano: R\$ ${_calculateTotalForYear(_expenses, DateTime.now())}',
        style: TextStyle(fontSize: 20),
      ),
    ),
  ],


  ),
),

          Expanded(
            child: ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                final expense = _expenses[index];
                return ListTile(
                  title: Text(expense.description),
                  subtitle: Text('R\$ ${expense.amount} - ${expense.date.toLocal().toIso8601String()}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeExpense(expense.id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExpense,
        child: Icon(Icons.add),
        backgroundColor: Colors.tealAccent.shade400,     // Cor de fundo do botão
        foregroundColor: Colors.white,      // Cor do ícone
      ),

    );
  }
}
