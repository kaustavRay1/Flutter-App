import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_app/models/category_model.dart';
import 'package:sample_app/models/diet_model.dart';
import 'package:sample_app/page_providers/CardSwipe.dart';
class HomePageProvider extends StatelessWidget {
  HomePageProvider({super.key});

  List<CategoryModel> categories = [];

  List<DietModel> diets = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context){
    _getInitialInfo();
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(

                  child:
                  Column(
                      children:[
                        _searchField(),
                        SizedBox(height:40,),
                        Container(
                          height: 260,
                          width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                            CardSwipe(),
                        ),
                        SizedBox(height:10,),
                        _categoriesSelection(),
                        SizedBox(height:40,),
                        _categoriesSelection1(),
                        SizedBox(height:40,),
                        _dietSection(),
                        SizedBox(height:40,),
                        _categoriesSelection1(),
                      ]
                  )
              )
          )
        ],
      ),


    );

  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left:20),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16
                          ),
                        ),
                        Text(
                          diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calorie,
                          style: const TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      child: Center(
                        child: Text(
                          'View',
                          style: TextStyle(
                              color: diets[index].viewIsSelected ? Colors.white : const Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                                diets[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent
                              ]
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 25,),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
                left: 20,
                right: 20
            ),
          ),
        )
      ],
    );
  }

  Column _categoriesSelection1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:20),
          child: Text('Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            separatorBuilder: (context,index) => SizedBox(width: 20,),
            itemBuilder:(context, index){
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height:50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(categories[index].iconPath),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Column _categoriesSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:20),
          child: Text('Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            separatorBuilder: (context,index) => SizedBox(width: 20,),
            itemBuilder:(context, index){
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height:50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(categories[index].iconPath),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
        margin: EdgeInsets.only(top:40,left:20,right:20),
        decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                  color: const Color(0xff1D1617).withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0
              )
            ]
        ),

        child:  TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search Food',
              hintStyle: TextStyle(color: Colors.black26),
              prefixIcon: Padding(
                padding : const EdgeInsets.all(15),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon: Padding(
                padding : const EdgeInsets.all(15),
                child: SvgPicture.asset('assets/icons/Filter.svg'),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
              )
          ),
        )
    );
  }

  AppBar appBar() {
    return AppBar(
        title: Text('Breakfast',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){

          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/icons/Arrow - Left 2.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
                color:Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
        actions: [
        GestureDetector(
        onTap: (){

    },
    child:  Container(
    margin: const EdgeInsets.all(10),
    alignment: Alignment.center,
    width: 37,
    child: SvgPicture.asset(
    'assets/icons/dots.svg',
    height: 5,
    width: 5,
    ),
    decoration: BoxDecoration(
    color:Color(0xffF7F8F8),
    borderRadius: BorderRadius.circular(10)
    ),
    ),
    ),
  ],
    );
  }
}