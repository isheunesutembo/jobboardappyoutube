

import 'package:fpdart/fpdart.dart';
import 'package:jobboardapp/util/failure.dart';

typedef FutureEither<T>=Future<Either<AppFailure,T>>;
typedef FutureVoid=FutureEither<void>;