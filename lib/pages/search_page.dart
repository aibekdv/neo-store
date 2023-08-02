import 'package:flutter/material.dart';
import 'package:neo_store/config/config.dart';
import 'package:neo_store/widgets/not_found_widget.dart';
import 'package:neo_store/widgets/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  final FocusNode _focus = FocusNode();

  bool isFocusedInput = false;
  bool isInputNotEmpty = false;
  bool isRowVersion = false;
  bool isSearchEmpty = true;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        value: 'jacket',
        child: Text("Jacket"),
      ),
      const DropdownMenuItem(
        value: 'boots',
        child: Text("Boots"),
      ),
      const DropdownMenuItem(
        value: 't_shirt',
        child: Text("T-Shirts"),
      ),
    ];
    return menuItems;
  }

  String selectedValue = 't_shirt';

  List<String> recentlyList = [
    "jordan1",
    "air max 90 violet",
    "nike",
  ];

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
    isFocusedInput = _focus.hasFocus;
    isInputNotEmpty = _searchController.text.isNotEmpty;
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
                          onTap: openFilterModal,
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
                  if (!isFocusedInput && !isInputNotEmpty)
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
                  if (isFocusedInput) const SizedBox(width: 10),
                  if (isFocusedInput || isInputNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _searchController.text = '';
                        _focus.unfocus();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0x4C12121D),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: isFocusedInput
                    ? _buildRecently()
                    : isInputNotEmpty
                        ? isSearchEmpty
                            ? const NotFoundWidget()
                            : _buildSearchResult()
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

  openFilterModal() {
    double mh =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final _formKey = GlobalKey<FormState>();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        minHeight: mh,
        maxHeight: mh,
      ),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: mh,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: StatefulBuilder(
            builder: (context, setState) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 44,
                          height: 4,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Center(
                        child: Text(
                          'Filter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF12121D),
                            fontSize: 16,
                            fontFamily: 'SF Pro Text',
                            fontWeight: FontWeight.w700,
                            height: 1.50,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Category',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF787272),
                          fontSize: 16,
                          fontFamily: 'Amaranth',
                          fontWeight: FontWeight.w700,
                          height: 1.50,
                        ),
                      ),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          fillColor: AppColors.greyColor,
                          filled: true,
                          constraints: BoxConstraints(maxHeight: 45),
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        value: selectedValue,
                        isExpanded: true,
                        items: dropdownItems,
                        isDense: true,
                        alignment: Alignment.center,
                        onChanged: (String? value) {
                          if (value != null) {
                            selectedValue = value;
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'price from',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF787272),
                                    fontSize: 16,
                                    fontFamily: 'Amaranth',
                                    fontWeight: FontWeight.w700,
                                    height: 1.50,
                                  ),
                                ),
                                TextFormField(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Amaranth',
                                    fontWeight: FontWeight.w700,
                                    height: 1.50,
                                  ),
                                  initialValue: '0',
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: "0",
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Amaranth',
                                      fontWeight: FontWeight.w700,
                                      height: 1.50,
                                    ),
                                    fillColor: AppColors.greyColor,
                                    filled: true,
                                    constraints: BoxConstraints(maxHeight: 45),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'price up to',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF787272),
                                    fontSize: 16,
                                    fontFamily: 'Amaranth',
                                    fontWeight: FontWeight.w700,
                                    height: 1.50,
                                  ),
                                ),
                                TextFormField(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Amaranth',
                                    fontWeight: FontWeight.w700,
                                    height: 1.50,
                                  ),
                                  initialValue: '1000',
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: "0",
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Amaranth',
                                      fontWeight: FontWeight.w700,
                                      height: 1.50,
                                    ),
                                    fillColor: AppColors.greyColor,
                                    filled: true,
                                    constraints: BoxConstraints(maxHeight: 45),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(180, 50),
                      ),
                      child: const Text(
                        'Result',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w700,
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Search result
  Widget _buildSearchResult() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '5,597 ',
                    style: TextStyle(
                      color: Color(0xFF12121D),
                      fontSize: 12,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w700,
                      height: 1.33,
                    ),
                  ),
                  TextSpan(
                    text: 'Result',
                    style: TextStyle(
                      color: Color(0x4C12121D),
                      fontSize: 12,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w700,
                      height: 1.33,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0x0C12121D),
                borderRadius: BorderRadius.circular(4),
              ),
              width: 52,
              height: 28,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => isRowVersion = false),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isRowVersion ? Colors.transparent : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        "assets/images/col.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => isRowVersion = true),
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            !isRowVersion ? Colors.transparent : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        "assets/images/row.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isRowVersion ? 1 : 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 15,
              childAspectRatio: isRowVersion ? 3.2 : 0.64,
            ),
            itemCount: 7,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductItemWidget(
                isRowVersion: isRowVersion,
              );
            },
          ),
        ),
      ],
    );
  }

  // Recentlies
  Widget _buildRecently() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Keywords',
              style: TextStyle(
                color: Color(0x4C12121D),
                fontSize: 12,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w700,
              ),
            ),
            GestureDetector(
              onTap: () {
                debugPrint("Clicked ...");
              },
              child: const Text(
                'Clear All',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0x9912121D),
                  fontSize: 12,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        //  Recenlty list
        ...recentlyList.map(
          (e) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                e,
                style: const TextStyle(
                  color: Color(0xFF12121D),
                  fontSize: 14,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () {},
                splashRadius: 20,
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
