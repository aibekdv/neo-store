import 'package:flutter/material.dart';
import 'package:neo_store/config/config.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final FocusNode _focus = FocusNode();

  bool isFilledInput = false;

  @override
  void initState() {
    _searchController.addListener(changeFilledValue);
    _focus.addListener(changeFilledValue);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(changeFilledValue);
    _focus.removeListener(changeFilledValue);
    _searchController.dispose();
    _focus.dispose();
    super.dispose();
  }

  changeFilledValue() {
    isFilledInput = _searchController.text.isNotEmpty || _focus.hasFocus;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      focusNode: _focus,
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          "assets/images/search.png",
                          width: 24,
                          height: 24,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            print("filter clicked");
                          },
                          child: Image.asset(
                            "assets/images/filter.png",
                            width: 24,
                            height: 24,
                          ),
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        fillColor: AppColors.greyBgColor,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 16,
                        ),
                        constraints: const BoxConstraints(minHeight: 56),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 6),
                  if (!isFilledInput)
                    InkWell(
                      onTap: () {
                        openCamera(context);
                      },
                      borderRadius: BorderRadius.circular(50),
                      child: ClipOval(
                        child: Container(
                          width: 44,
                          height: 44,
                          color: AppColors.greyBgColor,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  if (isFilledInput)
                    const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0x4C12121D),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: isFilledInput
                    ? ListView()
                    : ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            debugPrint("Item ${++index} clicked");
                          },
                          child: SizedBox(
                            height: 44,
                            child: Center(
                              child: Text(
                                'Jordan ${++index}',
                                style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
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
