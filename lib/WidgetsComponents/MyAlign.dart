import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAlign extends StatefulWidget {
  const MyAlign({Key? key}) : super(key: key);

  @override
  State<MyAlign> createState() => _MyAlignState();
}

class _MyAlignState extends State<MyAlign> {
  double _horizontalSliderValue = 0;
  double _verticalSliderValue = 0;
  var _verticalControler = TextEditingController();
  var _horizontalControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Align',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Horizontal Alignment',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      width: 140,
                      padding: EdgeInsets.only(top: 5),
                      margin: EdgeInsets.only(bottom: 15),
                      child: SliderTheme(
                        data: SliderThemeData(
                            trackShape: CustomTrackShape(),
                            overlayShape: SliderComponentShape.noOverlay,
                            trackHeight: 2,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 8)),
                        child: Slider(
                          value: _horizontalSliderValue,
                          min: -100,
                          max: 100,
                          inactiveColor: Primary_Color_Light,
                          thumbColor: Primary_Color,
                          activeColor: Primary_Color,
                          label: _horizontalSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _horizontalSliderValue = value;
                              _horizontalControler.text =
                                  _horizontalSliderValue.round().toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Text(
                      'Vertical Alignment',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      width: 140,
                      padding: EdgeInsets.only(top: 5),
                      child: SliderTheme(
                        data: SliderThemeData(
                            trackShape: CustomTrackShape(),
                            overlayShape: SliderComponentShape.noOverlay,
                            trackHeight: 2,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 8)),
                        child: Slider(
                          value: _verticalSliderValue,
                          min: -100,
                          max: 100,
                          inactiveColor: Primary_Color_Light,
                          thumbColor: Primary_Color,
                          activeColor: Primary_Color,
                          label: _verticalSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _verticalSliderValue = value;
                              _verticalControler.text =
                                  _verticalSliderValue.round().toString();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _horizontalControler,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(top: 12),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: _verticalControler,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      width: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(0),
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                              ),
                              onPressed: () {},
                              child: SvgPicture.string(
                                  '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13.958 15.203">
                              <g id="Group_46" data-name="Group 46" transform="translate(-1826.746 -587.398)">
                                <path id="Icon_ionic-ios-arrow-down" data-name="Icon ionic-ios-arrow-down" d="M9.523,13.91l2.522-2.524a.475.475,0,0,1,.673,0,.481.481,0,0,1,0,.675L9.861,14.921a.476.476,0,0,1-.657.014L6.326,12.064A.477.477,0,0,1,7,11.388Z" transform="translate(1824.035 576.152)" fill="#707070"/>
                                <path id="Icon_ionic-ios-arrow-down-2" data-name="Icon ionic-ios-arrow-down" d="M3.336,2.664,5.858.14a.475.475,0,0,1,.673,0,.481.481,0,0,1,0,.675L3.673,3.674a.476.476,0,0,1-.657.014L.139.817A.477.477,0,0,1,.812.142Z" transform="translate(1836.891 602.602) rotate(180)" fill="#707070"/>
                                <path id="Icon_ionic-ios-arrow-down-3" data-name="Icon ionic-ios-arrow-down" d="M3.336,2.664,5.858.14a.475.475,0,0,1,.673,0,.481.481,0,0,1,0,.675L3.673,3.674a.476.476,0,0,1-.657.014L.139.817A.477.477,0,1,1,.812.142Z" transform="translate(1840.704 592.378) rotate(90)" fill="#707070"/>
                                <path id="Icon_ionic-ios-arrow-down-4" data-name="Icon ionic-ios-arrow-down" d="M3.336,2.664,5.858.14a.475.475,0,0,1,.673,0,.481.481,0,0,1,0,.675L3.673,3.674a.476.476,0,0,1-.657.014L.139.817A.477.477,0,1,1,.812.142Z" transform="translate(1826.746 599.047) rotate(-90)" fill="#707070"/>
                              </g>
                            </svg>
                            '''),
                            ),
                          ),
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(0),
                                side: BorderSide(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                              ),
                              onPressed: () {},
                              child: SvgPicture.string(
                                  '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17.162 16.686">
                                <g id="Group_47" data-name="Group 47" transform="translate(-1857.919 -586.814)">
                                  <path id="Icon_ionic-ios-arrow-down" data-name="Icon ionic-ios-arrow-down" d="M9.906,14.216,12.717,11.4a.529.529,0,0,1,.75,0,.536.536,0,0,1,0,.753l-3.185,3.187a.53.53,0,0,1-.733.015l-3.207-3.2a.531.531,0,0,1,.75-.753Z" transform="translate(1856.554 588.003)" fill="#707070"/>
                                  <path id="Icon_ionic-ios-arrow-down-2" data-name="Icon ionic-ios-arrow-down" d="M3.719,2.969,6.53.156a.529.529,0,0,1,.75,0,.536.536,0,0,1,0,.753L4.095,4.1a.53.53,0,0,1-.733.015L.155.911A.531.531,0,0,1,.905.158Z" transform="translate(1870.176 591.065) rotate(180)" fill="#707070"/>
                                  <path id="Icon_ionic-ios-arrow-down-3" data-name="Icon ionic-ios-arrow-down" d="M3.719,2.969,6.53.156a.529.529,0,0,1,.75,0,.536.536,0,0,1,0,.753L4.095,4.1a.53.53,0,0,1-.733.015L.155.911A.531.531,0,0,1,.905.158Z" transform="translate(1862.17 591.065) rotate(90)" fill="#707070"/>
                                  <path id="Icon_ionic-ios-arrow-down-4" data-name="Icon ionic-ios-arrow-down" d="M3.719,2.969,6.53.156a.529.529,0,0,1,.75,0,.536.536,0,0,1,0,.753L4.095,4.1a.53.53,0,0,1-.733.015L.155.911A.531.531,0,0,1,.905.158Z" transform="translate(1870.83 598.787) rotate(-90)" fill="#707070"/>
                                </g>
                              </svg>
                            '''),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Flex',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      width: 60,
                      height: 40,
                      margin: EdgeInsets.only(top: 3),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "0",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OutlinedButtonStyle {}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
