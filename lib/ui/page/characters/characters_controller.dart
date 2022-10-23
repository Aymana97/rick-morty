import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/constants.dart';
import 'package:rick_and_morty/core/enum/character_gender.dart';
import 'package:rick_and_morty/core/enum/character_status.dart';
import 'package:rick_and_morty/domain/entity/api_response.dart';
import 'package:rick_and_morty/domain/entity/character.dart';
import 'package:rick_and_morty/domain/usecase/get_all_characters_usecase.dart';
import 'package:rick_and_morty/ui/widget/filter_menu.dart';

@injectable
class CharactersPageController {

  final GetAllCharactersUseCase _getAllCharactersUseCase;

  CharactersPageController(this._getAllCharactersUseCase);

  final Rx<APIResponse?> _apiResponse = Rx<APIResponse?>(null);
  List<Character> get characters => _apiResponse.value != null ? _apiResponse.value!.results : [];
  bool get previous => _apiResponse.value != null ? _apiResponse.value!.info.prev != null : false;
  bool get next => _apiResponse.value != null ? _apiResponse.value!.info.next != null : false;
  int get nbCharacters => _apiResponse.value != null ? _apiResponse.value!.info.count : 0;
  
  final Rx<CharacterStatus?> _status = Rx<CharacterStatus?>(null);
  CharacterStatus? get status => _status.value;

  final Rx<CharacterGender?> _gender = Rx<CharacterGender?>(null);
  CharacterGender? get gender => _gender.value;

  bool get anyFilters => _status.value != null || _gender.value != null;
  bool get bothFilters => _status.value != null && _gender.value != null;

  bool filtersChanged = false;

  final ScrollController scrollController = ScrollController();

  // Init controller
  init() async {
    _apiResponse.value = await _getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams(charactersAPI));
    _apiResponse.refresh();
  }

  // Get Previous page if exists
  getPreviousPage() async {
    if (previous) {
      _apiResponse.value = await _getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams(_apiResponse.value!.info.prev!));
      _apiResponse.refresh();
      scrollToTop(); 
    }
  }

  // Get Next page if exists
  getNextPage() async {
    if (next) {
      _apiResponse.value = await _getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams(_apiResponse.value!.info.next!));
      _apiResponse.refresh();
      scrollToTop(); 
    }
  }

  // Scroll to head of list
  scrollToTop() {
    scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  // Update status filter
  updateStatus(CharacterStatus? status) {
    _status.value = status;
    _status.refresh();
    filtersChanged = true;
  }

  // Update gender filter
  updateGender(CharacterGender? gender) {
    _gender.value = gender;
    _gender.refresh();
    filtersChanged = true;
  }

  // Open Filter Menu
  openFilterMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(() => FilterMenu(
          status: status,
          gender: gender,
          updateStatusFilter: (CharacterStatus? status) => updateStatus(status),
          updateGenderFilter: (CharacterGender? gender) => updateGender(gender)
        ));
      }
    ).then((_) => filterCharacters());
  }

  // Filter characters after filters changed
  filterCharacters() async {
    if (filtersChanged) {
      // Prepare url parameters
      var anyFilter = anyFilters ? "?" : "";
      var bothFilter = bothFilters ? "&" : "";
      var statusFilter = (status != null) ? "status=${status!.name}" : "";
      var genderFilter = (gender != null) ? "gender=${gender!.name}" : "";

      // Make API call with filters
      _apiResponse.value = await _getAllCharactersUseCase.perform(
        GetAllCharactersUseCaseParams(
          "$charactersAPI$anyFilter$statusFilter$bothFilter$genderFilter"
        )
      );
      _apiResponse.refresh();
      filtersChanged = false;
    }
  }

  // Get filters
  String getFilters() {
    var limiter = bothFilters ? " - " : "";
    var statusName = status != null ? status!.name : "";
    var genderName = gender != null ? gender!.name : "";
    return anyFilters ? "$statusName$limiter$genderName" : "Aucun";
  }

}