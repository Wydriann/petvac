import 'package:flutter/material.dart';
import 'package:petvac/app/models/pettipos_model.dart';
import 'package:petvac/app/modules/pettipos/pettipos_bloc.dart';
import 'package:petvac/app/utils/main_drawer.dart';

import 'pettipos_edit_page.dart';

class PetTiposPage extends StatefulWidget {
  final String title;

  static const String route = '/petTipos';


  const PetTiposPage({Key key, this.title = "Tipos de Pets"}) : super(key: key);

  @override
  _PetTiposPageState createState() => _PetTiposPageState();
}

class _PetTiposPageState extends State<PetTiposPage> {
  var _bloc = PetTiposBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var _petTipos = PetTipos()..nome = "";

          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => PetTiposEditPage(_petTipos)),
          );
        },
      ),
      body: Container(
        child: StreamBuilder<List<PetTipos>> (
          stream: _bloc.getPetTipos,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator(); 

            return Container(
              child: ListView(
                children: snapshot.data.map((_petTipo) {
                  return Dismissible (
                    key: Key(_petTipo.documentId()),
                    onDismissed: (direction){
                      _bloc.delete(_petTipo.documentId());
                    },
                    child: ListTile(
                    title: Text(_petTipo.nome),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => PetTiposEditPage(_petTipo),
                          ),
                       );
                    },
                    ),
                 );
                }).toList(),
              ),
            );
          }
        ),
      ),
    );
  }
}
