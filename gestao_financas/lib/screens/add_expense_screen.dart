import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/expense.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  String _description = '';
  double _amount = 0.0;
  DateTime _selectedDate = DateTime.now();

  void _saveExpense() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Expense newExpense = Expense(
        description: _description,
        amount: _amount,
        date: _selectedDate,
      );
      await DatabaseHelper().insertExpense(newExpense);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Despesa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => _description = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe uma descrição';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _amount = double.parse(value!),
                validator: (value) {
                  if (value!.isEmpty || double.tryParse(value) == null) {
                    return 'Informe um valor válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Salvar Despesa'),
                onPressed: _saveExpense,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
