import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.delete,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function delete;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  @override
  void initState() {
    const availableColor = [
      Colors.blue,
      Colors.green,
      Colors.redAccent,
      Colors.amberAccent
    ];
    _bgColor = availableColor[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30.0,
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('\৳${widget.userTransaction.amount} '),
            ),
          ),
        ),
        title: Text(
          widget.userTransaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.userTransaction.date)),
        trailing: MediaQuery.of(context).size.width > 300
            ? TextButton.icon(
                onPressed: () {
                  widget.delete(widget.userTransaction.id);
                },
                style:
                    TextButton.styleFrom(primary: Theme.of(context).errorColor),
                icon: Icon(Icons.delete),
                label: const Text('delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  widget.delete(widget.userTransaction.id);
                },
              ),
      ),
    );
  }
}
