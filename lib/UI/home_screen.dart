import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_screenviewmodel.dart';

class HomeScreen extends StatelessWidget {
  final int flag = 0;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fall'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  height: 80.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.horizontalview.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Stack(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  NetworkImage(model.horizontalview[index].url),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  model.horizontalview[index].firstName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Flexible(
                  child: ListView.builder(
                    itemCount: model.verticalview.length,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    itemBuilder: (context, index) {
                      return Card(
                        color: model.verticalview[index].isSelected
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                NetworkImage(model.verticalview[index].url),
                          ),
                          title: Text(
                            '${model.verticalview[index].firstName} ${model.verticalview[index].lastName}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(model.verticalview[index].email),
                          onLongPress: () {
                            model.update(index);
                          },
                        ),
                      );
                    },
                    // children: model.verticalview,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
