import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petvac/app/models/pettipos_model.dart';
import 'package:petvac/app/modules/pettipos/pettipos_bloc.dart';


class PetTiposEditPage extends StatefulWidget {
  final PetTipos petTipos;


  PetTiposEditPage(this.petTipos);




  @override
  State<StatefulWidget> createState() => _PetTiposEditPageState();
}



class _PetTiposEditPageState extends State<PetTiposEditPage> {
  TextEditingController _nomeController;
  final _bloc = PetTiposBloc();

  @override
  void initState() {
    _bloc.setPetTipos(widget.petTipos);

    _nomeController = TextEditingController(text: widget.petTipos.nome);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edição Tipos de Pet'),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: <Widget>[
                Container(
                  child: TextField(
                    decoration: InputDecoration(labelText: "Nome"),
                    controller: _nomeController,
                    onChanged: _bloc.setNome,
                  ),
                ),
                RaisedButton(
                  child: Text('Salvar'), 
                  onPressed: (){
                    if (_bloc.insertOrUpdate()) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),

          
        ),
    );
  }
}

