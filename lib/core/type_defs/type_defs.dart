import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../errors/failures/failures.dart';

typedef RvfUnit = Future<Unit>;
typedef RvfEither<T> = Future<Either<Failure, T>>;
typedef RvfEitherUnit = Future<Either<Failure, Unit>>;
typedef RvEither<R> = Either<Failure, R>;

typedef RvStream<T> = Stream<T>;
typedef Rvf<T> = Future<T>;
typedef RvfList<T> = Future<List<T>>;

typedef RvBuilder<S> = Widget Function(BuildContext context, S state);
typedef RvBuildWhen<S> = bool Function(S previous, S current);

typedef RvMapString = Map<String, dynamic>;
typedef RvfEitherList<T> = RvfEither<List<T>>;
typedef RvList<T> = List<T>;
typedef RvStreamEither<T> = Stream<Either<Failure, T>>;
typedef RvStreamEitherList<T> = RvStreamEither<List<T>>;
typedef RvStreamList<T> = RvStream<List<T>>;

typedef OnTap<T> = void Function(T value);
