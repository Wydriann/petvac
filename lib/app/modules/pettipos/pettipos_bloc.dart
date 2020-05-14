import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:petvac/app/app_module.dart';
import 'package:petvac/app/models/pettipos_model.dart';
import 'package:petvac/app/modules/pettipos/pettipos_page.dart';
import 'package:petvac/app/modules/pettipos/pettipos_repository.dart';
import 'package:rxdart/rxdart.dart';

class PetTiposBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<PettiposRepository>();

  String _documentId;
  String _nome;

  PetTiposBloc () {
    _nomeController.listen((value) => _nome = value);
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream;
  void setNome(String value) => _nomeController.sink.add(value);

  Observable<List<PetTipos>> get getPetTipos => _repository.getAll;

  void delete(String _documentId) => _repository.delete(_documentId);

  void setPetTipos(PetTipos petTipos) {
    _documentId = petTipos.documentId();
    setNome(petTipos.nome);
      }
 @override
  void dispose() {
    super.dispose();
  }

  bool insertOrUpdate() {
    var _petTipos = PetTipos() ..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(_petTipos); 
    } else { 
      _repository.update(_documentId, _petTipos);
    }

    return true;


  }
}
