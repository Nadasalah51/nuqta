import 'package:flutter/material.dart';
import 'package:nuqta/constant.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController pageController = PageController();
  int currentPage = 0;
  List<Map<String, String>> pages = [
    {
      "image": "assets/images/img_1.png",
      "title": "Donate Blood",
      "desc":
          "Blood donation is a vital act that helps hospitals and patients in need",
    },
    {
      "image": "assets/images/img_2.png",
      "title": "Save Lives",
      "desc":
          "A single blood donation can save multiple lives and bring hope to those in need",
    },
    {
      "image": "assets/images/img_3.png",
      "title": "Get Connect Community",
      "desc":
          "Join a community of heroes dedicated to making a life-saving impact through blood donation",
    }
  ];
  void skip() {
    pageController.jumpToPage(pages.length - 1);
  }

  void next() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: skip,
              child: Text("Skip"),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: pages.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pages[index]["image"]!,
                    width: 500,
                    height: 500,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    pages[index]["title"]!,
                    style: TextStyle(
                      fontSize: 36,
                      color: blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    pages[index]["desc"]!,
                    style: TextStyle(
                      fontSize: 20,
                      color: blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        pages.length,
                        (index) => Container(
                          width: currentPage == index ? 20 : 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: currentPage == index ? red : Colors.grey,
                            shape: currentPage == index
                                ? BoxShape.rectangle
                                : BoxShape.circle, // Corrected line
                            borderRadius: currentPage == index
                                ? BorderRadius.circular(4)
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentPage < pages.length - 1) {
                    next();
                  } else {
                    Navigator.pushNamed(context, 'loginscreen');
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFE464D),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
