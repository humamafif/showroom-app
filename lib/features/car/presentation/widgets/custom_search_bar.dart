import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showroom/core/constant/color.dart';
import 'package:showroom/features/car/presentation/bloc/car_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CustomSearchBar extends StatefulWidget {
  final String initialText;

  const CustomSearchBar({
    super.key,
    this.initialText = '',
  });

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final _debounce = BehaviorSubject<String>();
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialText);
    _debounce.debounceTime(const Duration(milliseconds: 500)).listen((query) {
      if (query.isEmpty || query == "") {
        context.read<CarBloc>().add(CarEventGetCars());
      } else {
        context.read<CarBloc>().add(CarEventGetCarByName(name: query));
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        _debounce.add(value);
      },
      cursorColor: ShowroomColors.accentBlack,
      controller: _searchController,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          size: 28,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ShowroomColors.accentBlack,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(35),
        ),
        focusColor: ShowroomColors.secondaryColor,
        hintText: "Search",
        hoverColor: Colors.amber,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
