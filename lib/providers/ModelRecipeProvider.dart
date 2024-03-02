


import 'package:flutter/cupertino.dart';
import 'package:minip/Api/Server.dart';
import 'package:minip/model/ModelRecipe.dart';

class ModelRecipeProvider extends ChangeNotifier{
  late List<ModelRecipe> lsitofbooks;

  bool loadingState = false;
  getALLRecipe(List<ModelRecipe> listofModelCLASS) async {
    loadingState = true;
    lsitofbooks = (await getApiReqRecipe(listofModelCLASS));
    loadingState = false;
    notifyListeners();
  }
}