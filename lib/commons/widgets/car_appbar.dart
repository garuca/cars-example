import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar carAppbar({required Function onTap}) {
  const String assetTune = 'images/tune.svg';
  var tune = SvgPicture.asset(
    assetTune,
    fit: BoxFit.contain,
    height: 30,
    width: 30,
  );
  return AppBar(
    backgroundColor: Colors.white,
    actions: <Widget>[
      GestureDetector(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
          child: Center(
              child: Wrap(
            children: [
              SizedBox(
                  width: 45,
                  height: 45,
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: tune,
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: 22,
                              height: 20,
                              color: Colors.white,
                              child: Center(
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF0065ff),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              )))
                    ],
                  )),
            ],
          )),
        ),
        onTap: () {
          onTap.call();
        },
      )
    ],
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Image.asset('images/logo.png'),
    ),
    title: const Text(
      "VW Seminovos",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF4B5670)),
    ),
  );
}
