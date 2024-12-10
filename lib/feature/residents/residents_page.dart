import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:woodscenter/feature/residents/bloc/residents_page_bloc.dart';
import 'package:woodscenter/feature/residents/widget/woods_drop_down.dart';
import 'package:woodscenter/main.dart';

import '../../core/sources/woodscenter/response/resident_dto.dart';

class ResidentsPage extends HookWidget {
  const ResidentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResidentsPageBloc(getIt.get()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Scaffold(
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: ResidentTypeDropdownMenu(),
              ),
              BlocSelector<ResidentsPageBloc, ResidentsPageState, List<ResidentItemDto>>(
                selector: (state) => state.filteredResidents,
                builder: (context, residents) {
                  return Expanded(child: ResidentItemList(residents: residents));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResidentTypeDropdownMenu extends HookWidget {
  const ResidentTypeDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const residentTypes = ResidentType.values;

    return WoodsDropDown(
      items: residentTypes.map((residentType) => WoodsDropDownEntry<ResidentType>(title: residentType.name.tr(), value: residentType)).toList(),
      initialSelected: ResidentType.all,
      onSelectedItemChanged: (selected) {
        context.read<ResidentsPageBloc>().add(ResidentsPageEvent.filterResidents(type: selected));
      },
    );
  }
}

class ResidentItemList extends HookWidget {
  final List<ResidentItemDto> residents;

  const ResidentItemList({required this.residents, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      physics: const BouncingScrollPhysics(),
      itemCount: residents.length,
      itemBuilder: (context, index) {
        final resident = residents[index];
        return ResidentItem(residentItem: resident);
      },
    );
  }
}

class ResidentItem extends HookWidget {
  const ResidentItem({required this.residentItem, super.key});

  final ResidentItemDto residentItem;

  String get name => residentItem.name ?? "";

  String get logo => residentItem.logo ?? "";

  String get type => residentItem.type?.name.tr() ?? "";

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black.withOpacity(0.3),
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: CachedNetworkImage(
                height: 206,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: logo,
                placeholder: (context, url) => const Column(
                  children: [CircularProgressIndicator()],
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(type,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
      ),
    );
  }
}
