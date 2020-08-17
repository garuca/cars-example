import 'package:flutter/material.dart';

class FeedLoadingPage extends StatefulWidget {
  @override
  _FeedLoadingPage createState() => _FeedLoadingPage();
}

class _FeedLoadingPage extends State<FeedLoadingPage> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation gradientPosition;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.linear
      ),
    )..addListener(() {
      setState(() {});
    });

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    double spacing = 20;
    int columns = 2;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 20, top: 15,bottom: 15),
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(gradientPosition.value, 0),
                      end: Alignment(-1, 0),
                      colors: [Colors.black12, Colors.black26, Colors.black12]
                  )
              ),
            ),
          )
        ],
        elevation: 0,
        title: Container(
          height: 24,
          width: 150,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(gradientPosition.value, 0),
                  end: Alignment(-1, 0),
                  colors: [Colors.black12, Colors.black26, Colors.black12]
              )
          ),
        )
      ),
      body: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: (itemWidth / itemHeight),
        padding: EdgeInsets.all(spacing),
        children: List.generate(20, (index) {
          return Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(gradientPosition.value, 0),
                            end: Alignment(-1, 0),
                            colors: [Colors.black12, Colors.black26, Colors.black12]
                        ),
                        borderRadius: BorderRadius.all(
                          const Radius.circular(5.0),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.1,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 14,
                              width: (itemWidth-(3*spacing))/2,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(gradientPosition.value, 0),
                                      end: Alignment(-1, 0),
                                      colors: [Colors.black12, Colors.black26, Colors.black12]
                                  )
                              ),),
                            Text('  '),
                            Container(
                              height: 14,
                              width: (itemWidth-(3*spacing))/2,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(gradientPosition.value, 0),
                                      end: Alignment(-1, 0),
                                      colors: [Colors.black12, Colors.black26, Colors.black12]
                                  )
                              ),),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 14,
                              width: (itemWidth-(3*spacing))/2,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(gradientPosition.value, 0),
                                      end: Alignment(-1, 0),
                                      colors: [Colors.black12, Colors.black26, Colors.black12]
                                  )
                              ),),
                            Text('  '),
                            Container(
                              height: 14,
                              width: (itemWidth-(3*spacing))/2,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(gradientPosition.value, 0),
                                      end: Alignment(-1, 0),
                                      colors: [Colors.black12, Colors.black26, Colors.black12]
                                  )
                              ),),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 14,
                              width: (itemWidth-(3*spacing))/2,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(gradientPosition.value, 0),
                                      end: Alignment(-1, 0),
                                      colors: [Colors.black12, Colors.black26, Colors.black12]
                                  )
                              ),),
                            Text('  '),
                            Container(
                              height: 14,
                              width: (itemWidth-(3*spacing))/2,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment(gradientPosition.value, 0),
                                      end: Alignment(-1, 0),
                                      colors: [Colors.black12, Colors.black26, Colors.black12]
                                  )
                              ),),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Container(
                          height: 16,
                          width: (itemWidth-(3*spacing))/2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(gradientPosition.value, 0),
                                  end: Alignment(-1, 0),
                                  colors: [Colors.black12, Colors.black26, Colors.black12]
                              )
                          ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
