import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: ClayContainer(
        emboss: true,
        color: Colors.grey.shade200,
        width: MediaQuery.of(context).size.width,
        borderRadius: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Question",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: TextStyle(
                        color: Color(0xFF124150),
                        fontFamily: 'Oswald'
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: ClayContainer(
                  emboss: true,
                  color: Colors.grey.shade200,
                  height: 60,
                  width: 60,
                  borderRadius: 15,
                  child: Icon(
                    Icons.search,
                    color: Color(0xFF124150),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
