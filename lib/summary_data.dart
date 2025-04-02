import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.summarysData, {super.key});

  final List<Map<String, Object>> summarysData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              summarysData.map((data) {
                bool isCorrect =
                    data['user_answers'] == data['correct_answers'];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 28,
                      width: 30,
                      decoration:
                          isCorrect
                              ? BoxDecoration(
                                color: const Color.fromARGB(255, 40, 178, 75),
                                shape: BoxShape.circle,
                              )
                              : BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                              ),
                      alignment: Alignment.center,
                      child: Text(
                        ((data['questions_index'] as int) + 1).toString(),
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (data['questions']) as String,
                            style: GoogleFonts.poppins(
                              color: Colors.yellow,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            (data['user_answers']) as String,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 220, 201, 201),
                            ),
                          ),
                          Text(
                            (data['correct_answers']) as String,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
