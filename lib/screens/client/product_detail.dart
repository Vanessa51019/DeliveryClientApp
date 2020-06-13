import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {

  @override
  _ProductDetailState createState() => _ProductDetailState();

}
class _ProductDetailState extends State<ProductDetail> {

  int _current = 0;

  static List<String> imgList = [
    'assets/products/detail.jpg',
    'assets/products/clothes.jpg',
    'assets/products/detail.jpg',
    'assets/products/detail.jpg',
    'assets/products/detail.jpg',
    'assets/products/detail.jpg'
  ];

  List<Widget> imageSliders = imgList.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Container(
                height: 250,
                width: 150,
                child: Image.asset(item, fit: BoxFit.cover),
              ),
            ],
          )
        ),
      ),
    )).toList();

  @override
  void initState() {
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back,),
                      ),
                      Center(
                        child: Text("Nightrise Hoodle", style: TextStyle(fontSize: 16),),
                      ),
                      Container(),
                    ],
                  ),

                  SizedBox(height: 10),

                  Container(
                    height: MediaQuery.of(context).size.height*2/5,
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: imageSliders,
                          options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            aspectRatio :2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.map((url) {
                            int index = imgList.indexOf(url);
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            );
                          }).toList(),
                        ),
                      ]
                    ),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height*2/5,
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(bottom: 15),
                          child: Center(
                            child: Text("Description")
                          ),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
                          ),
                        ),
                        Text("Urban ninjas favourite hoodie for leisure time!"),
                        SizedBox(height: 15,),
                        Text("interior chin guard"),
                        SizedBox(height: 15,),
                        Text("oversize, adjustable contoured, crossed hood with cord inside with labeled leather length regulator on it"),
                        SizedBox(height: 15,),
                        Text("rib cuffs with thumbholes"),
                        SizedBox(height: 15,),
                        Text("pinetree label on the back"),
                        SizedBox(height: 15,),
                        MaterialButton(
                          onPressed: (){

                          },
                          height: 40,
                          color: Color.fromRGBO(0, 193, 93, 1),
                          child: Text("ADD TO CART", style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),

          
        ],
      ),
    );
  }
}