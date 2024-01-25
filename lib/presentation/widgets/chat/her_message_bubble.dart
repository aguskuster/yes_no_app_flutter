import 'package:flutter/material.dart';

// create StateLessWidget called HerMessageBubble
class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "The evil bugsucker",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
          "https://yesno.wtf/assets/no/16-b66d2db7543f5259c86abc166d6901cf.gif",
          width: size.width * 0.6,
          height: 150,
          fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.6,
              height: 150,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal:10),
              child: const Text("Loading..."),
            );
       
      }),
    );
  }
}


// LOADING CIRCULAR PROGRESS BAR

// class _ImageBubble extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: Image.network(
//           "https://yesno.wtf/assets/no/16-b66d2db7543f5259c86abc166d6901cf.gif",
//           width: size.width * 0.6,
//           height: 150,
//           fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
//         if (loadingProgress == null) return child;

//         return Center(
//             child: CircularProgressIndicator(
//           value: loadingProgress.expectedTotalBytes != null
//               ? loadingProgress.cumulativeBytesLoaded /
//                   loadingProgress.expectedTotalBytes!
//               : null,
//         ));
//       }),
//     );
//   }
// }