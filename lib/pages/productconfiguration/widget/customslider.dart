import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double minimumval = 0.0;
  double maxmumval = 2400.0;
  RangeValues values = const RangeValues(0.0, 2400.0);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 15,
        valueIndicatorColor: Colors.teal,

        //thumbShape: CustomCircleSliderThumbShape(thumbRadius: 20),
      ),
      child: RangeSlider(
        min: minimumval,
        max: maxmumval,
        values: values,
        labels: RangeLabels(values.start.toString(), values.end.toString()),
        onChanged: (value) {
          setState(() {
            values = value;
          });
        },
      ),
    );
  }
}
