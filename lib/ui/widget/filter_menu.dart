import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:rick_and_morty/core/enum/character_gender.dart';
import 'package:rick_and_morty/core/enum/character_status.dart';
import 'package:rick_and_morty/l10n/generated/l10n.dart';

class FilterMenu extends StatelessWidget {
  
  final CharacterStatus? status;
  final CharacterGender? gender;
  final Function updateStatusFilter;
  final Function updateGenderFilter;

  const FilterMenu({super.key, this.status, this.gender, required this.updateStatusFilter, required this.updateGenderFilter});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return AlertDialog(
      title: Text(tr.filter_menu_title),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Filter on status
          Row(
            children: [
              Text(tr.filter_menu_status),
              Expanded(child: Container()),
              // Clear button
              ElevatedButton(
                onPressed: () => updateStatusFilter.call(null),
                child: Text(tr.clear_button)
              )
            ]
          ),
          const SizedBox(height: 15),
          // All status options
          RadioGroup<CharacterStatus?>.builder(
            groupValue: status,
            onChanged: (value) => updateStatusFilter.call(value),
            items: CharacterStatus.values,
            itemBuilder: (item) => RadioButtonBuilder(
              item!.name,
            )
          ),
          const SizedBox(height: 15),
          // Filter on gender
          Row(
            children: [
              Text(tr.filter_menu_gender),
              Expanded(child: Container()),
              // Clear button
              ElevatedButton(
                onPressed: () => updateGenderFilter.call(null),
                child: Text(tr.clear_button)
              )
            ]
          ),
          const SizedBox(height: 15),
          // All gender options
          RadioGroup<CharacterGender?>.builder(
            groupValue: gender,
            onChanged: (value) => updateGenderFilter.call(value),
            items: CharacterGender.values,
            itemBuilder: (item) => RadioButtonBuilder(
              item!.name,
            )
          )
        ]
      ),
      // Alert dialog action buttons
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(tr.filter_button)
        )
      ]
    );
  }

}