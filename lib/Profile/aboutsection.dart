

import 'package:flutter/material.dart';

import '../Utils/color.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          SizedBox(height: 10),
          Text("Activity", style: Font.notbold),
          SizedBox(height: 5),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ActivityChip(label: 'Investment'),
              ActivityChip(label: 'Shopping'),
              ActivityChip(label: 'Road Trip'),
              ActivityChip(label: 'Football'),
              ActivityChip(label: 'Snowboarding'),
              ActivityChip(label: 'Painting'),
              ActivityChip(label: 'Golf'),
              ActivityChip(label: 'Investment'),
              ActivityChip(label: 'Shopping'),
              ActivityChip(label: 'Road Trip'),
              ActivityChip(label: 'Football'),
              ActivityChip(label: 'Snowboarding'),
              ActivityChip(label: 'Painting'),
              ActivityChip(label: 'Golf'),

            ],
          ),
          SizedBox(height: 20),
          Text("Bio", style:  Font.notbold),
          Text(
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'
                ' Aenean commodo ligula eget dolor. Aenean massa. '
                'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis. '
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'
                ' Aenean commodo ligula eget dolor. Aenean massa. '
          'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis.'
          'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),

        ],
      ),
    );
  }
}
class ActivityChip extends StatelessWidget {
  final String label;
  const ActivityChip({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: login),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.black)),
    );
  }
}
