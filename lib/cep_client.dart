// ignore: unused_import
import 'src/cep_client_stub.dart'
    if (dart.library.io) 'src/cep_client_io.dart'
    if (dart.library.html) 'src/cep_client_web.dart';

// exporta a implementação correta
export 'src/cep_client_stub.dart'
    if (dart.library.io) 'src/cep_client_io.dart'
    if (dart.library.html) 'src/cep_client_web.dart';

export 'cep_result.dart';
