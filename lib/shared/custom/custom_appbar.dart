import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../pages/configuracoes_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final int quantidade;
  final Function? reset;
  final String text;
  const CustomAppBar(
      {Key? key,
      this.quantidade = 0,
      required this.reset,
      required this.text,
      this.color = Colors.purple})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return quantidade == 0
        ? AppBar(
            centerTitle: true,
            title: Text(text),
            backgroundColor: color,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return ConfiguracoesPage();
                    })));
                  },
                  icon: Icon(Icons.notes_sharp))
            ],
          )
        : AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return ConfiguracoesPage();
                    })));
                  },
                  icon: Icon(Icons.account_tree))
            ],
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back), onPressed: () => reset!()),
            title: Text('${quantidade} selecionadas'),
            backgroundColor: Colors.blueGrey[50],
            elevation: 1,
            iconTheme: IconThemeData(color: Colors.black87),
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
