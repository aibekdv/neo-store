import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  final bool isRowVersion;

  const ProductItemWidget({super.key, required this.isRowVersion});

  @override
  Widget build(BuildContext context) {
    return isRowVersion
        ? SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/product.png'),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    SizedBox(
                      height: 32,
                      child: Text(
                        'Jordan 1 Retro High Tie Dye (W)',
                        style: TextStyle(
                          color: Color(0xFF12121D),
                          fontSize: 12,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                          height: 1.33,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Lowest Ask',
                      style: TextStyle(
                        color: Color(0x4C12121D),
                        fontSize: 11,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                        height: 1.45,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      '\$235',
                      style: TextStyle(
                        color: Color(0xFF12121D),
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w700,
                        height: 1.43,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          )
        : SizedBox(
            width: 150,
            height: 235,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/product.png'),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.noRepeat,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 32,
                  child: Text(
                    'Jordan 1 Retro High Tie Dye (W)',
                    style: TextStyle(
                      color: Color(0xFF12121D),
                      fontSize: 12,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w400,
                      height: 1.33,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Lowest Ask',
                  style: TextStyle(
                    color: Color(0x4C12121D),
                    fontSize: 11,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                const Text(
                  '\$235',
                  style: TextStyle(
                    color: Color(0xFF12121D),
                    fontSize: 14,
                    fontFamily: 'SF Pro Text',
                    fontWeight: FontWeight.w700,
                    height: 1.43,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
  }
}
