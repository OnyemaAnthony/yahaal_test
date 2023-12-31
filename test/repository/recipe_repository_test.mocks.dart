// Mocks generated by Mockito 5.4.2 from annotations
// in yahaal_test/test/repository/recipe_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dartz/dartz.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:yahaal_test/models/recipe.dart' as _i2;
import 'package:yahaal_test/models/recipe_info.dart' as _i3;
import 'package:yahaal_test/repository/recipe/recipe_repository.dart' as _i7;
import 'package:yahaal_test/services/recipe/recipe_service.dart' as _i5;
import 'package:yahaal_test/utils/api_request_failure.dart' as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRecipe_0 extends _i1.SmartFake implements _i2.Recipe {
  _FakeRecipe_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRecipeInfo_1 extends _i1.SmartFake implements _i3.RecipeInfo {
  _FakeRecipeInfo_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_2<L, R> extends _i1.SmartFake implements _i4.Either<L, R> {
  _FakeEither_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RecipeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRecipeService extends _i1.Mock implements _i5.RecipeService {
  MockRecipeService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Recipe> fetchRecipes() => (super.noSuchMethod(
        Invocation.method(
          #fetchRecipes,
          [],
        ),
        returnValue: _i6.Future<_i2.Recipe>.value(_FakeRecipe_0(
          this,
          Invocation.method(
            #fetchRecipes,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Recipe>);
  @override
  _i6.Future<_i2.Recipe> findRecipeByName(String? name) => (super.noSuchMethod(
        Invocation.method(
          #findRecipeByName,
          [name],
        ),
        returnValue: _i6.Future<_i2.Recipe>.value(_FakeRecipe_0(
          this,
          Invocation.method(
            #findRecipeByName,
            [name],
          ),
        )),
      ) as _i6.Future<_i2.Recipe>);
  @override
  _i6.Future<_i3.RecipeInfo> findRecipeById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #findRecipeById,
          [id],
        ),
        returnValue: _i6.Future<_i3.RecipeInfo>.value(_FakeRecipeInfo_1(
          this,
          Invocation.method(
            #findRecipeById,
            [id],
          ),
        )),
      ) as _i6.Future<_i3.RecipeInfo>);
  @override
  _i6.Future<void> saveFavouriteRecipe(_i2.Results? recipe) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFavouriteRecipe,
          [recipe],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<_i2.Recipe> fetchFavouriteRecipe() => (super.noSuchMethod(
        Invocation.method(
          #fetchFavouriteRecipe,
          [],
        ),
        returnValue: _i6.Future<_i2.Recipe>.value(_FakeRecipe_0(
          this,
          Invocation.method(
            #fetchFavouriteRecipe,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Recipe>);
}

/// A class which mocks [RecipeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRecipeRepository extends _i1.Mock implements _i7.RecipeRepository {
  MockRecipeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i2.Recipe>> fetchRecipes() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchRecipes,
          [],
        ),
        returnValue:
            _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i2.Recipe>>.value(
                _FakeEither_2<_i8.ApiRequestFailure, _i2.Recipe>(
          this,
          Invocation.method(
            #fetchRecipes,
            [],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i2.Recipe>>);
  @override
  _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i2.Recipe>> findRecipeByName(
          String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #findRecipeByName,
          [name],
        ),
        returnValue:
            _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i2.Recipe>>.value(
                _FakeEither_2<_i8.ApiRequestFailure, _i2.Recipe>(
          this,
          Invocation.method(
            #findRecipeByName,
            [name],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i2.Recipe>>);
  @override
  _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i3.RecipeInfo>> findRecipeById(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #findRecipeById,
          [id],
        ),
        returnValue:
            _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i3.RecipeInfo>>.value(
                _FakeEither_2<_i8.ApiRequestFailure, _i3.RecipeInfo>(
          this,
          Invocation.method(
            #findRecipeById,
            [id],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i3.RecipeInfo>>);
  @override
  _i6.Future<_i4.Either<_i8.ApiRequestFailure, void>> saveFavouriteRecipe(
          _i2.Results? recipe) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFavouriteRecipe,
          [recipe],
        ),
        returnValue: _i6.Future<_i4.Either<_i8.ApiRequestFailure, void>>.value(
            _FakeEither_2<_i8.ApiRequestFailure, void>(
          this,
          Invocation.method(
            #saveFavouriteRecipe,
            [recipe],
          ),
        )),
      ) as _i6.Future<_i4.Either<_i8.ApiRequestFailure, void>>);
  @override
  _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i2.Recipe>>
      fetchFavouriteRecipe() => (super.noSuchMethod(
            Invocation.method(
              #fetchFavouriteRecipe,
              [],
            ),
            returnValue:
                _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i2.Recipe>>.value(
                    _FakeEither_2<_i8.ApiRequestFailure, _i2.Recipe>(
              this,
              Invocation.method(
                #fetchFavouriteRecipe,
                [],
              ),
            )),
          ) as _i6.Future<_i4.Either<_i8.ApiRequestFailure, _i2.Recipe>>);
}
