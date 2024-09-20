/*import 'package:flutter/material.dart';
import 'add_expense_screen.dart';
import '../db/database_helper.dart';
import '../models/expense.dart';

/*class HomeScreen extends StatefulWidget {
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
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Total Gasto Hoje: R\$ $_totalExpenseDay',
          style: TextStyle(fontSize: 20)),
      Text('Total Gasto no Mês: R\$ $_totalExpenseMonth',
          style: TextStyle(fontSize: 20)),
      Text('Total Gasto no Ano: R\$ $_totalExpenseYear',
          style: TextStyle(fontSize: 20)),
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
}*/

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Declaração das variáveis de total por dia, mês e ano
  double _totalExpenseDay = 0.0;
  double _totalExpenseMonth = 0.0;
  double _totalExpenseYear = 0.0;

  List<Expense> _expenses = [];  // Lista de despesas (simulação)

  @override
  void initState() {
    super.initState();
    _loadExpenses();  // Simulação de carregamento de despesas e cálculo
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
  // Simula o carregamento de despesas e calcula os totais
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
    // Simulação de lista de despesas. Substituir por chamada de banco de dados
    


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
              'Total Gasto: R\$ $_loadExpenses',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          
        ),

        Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Total Gasto Hoje: R\$ $_totalExpenseDay',
          style: TextStyle(fontSize: 20)),
      Text('Total Gasto no Mês: R\$ $_totalExpenseMonth',
          style: TextStyle(fontSize: 20)),
      Text('Total Gasto no Ano: R\$ $_totalExpenseYear',
          style: TextStyle(fontSize: 20)),
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


// Classe de exemplo para despesas
class Expense {
  final double amount;
  final DateTime date;
  final String description;

  Expense({required this.amount, required this.date, required this.description});
}*/