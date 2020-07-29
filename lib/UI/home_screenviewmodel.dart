import 'package:project/Models/Horizontal.dart';
import 'package:project/Models/Vertical.dart';
import 'package:stacked/stacked.dart';
import 'package:project/Services/API_call.dart';

class HomeScreenViewModel extends BaseViewModel {
  List<Horizontal> horizontalview = [];
  List<Vertical> verticalview = [];
  void initialise() async {
    print('triggered');
    API api = API();
    var data = await api.fetchdata();
    for (int i = 0; i < 6; i++) {
      var cdata = data['data'][i];
      verticalview.add(Vertical(
        firstName: cdata['first_name'],
        lastName: cdata['last_name'],
        url: cdata['avatar'],
        email: cdata['email'],
      ));
    }
    notifyListeners();
  }

  void update(int index) {
    Horizontal temp = Horizontal(
      firstName: verticalview[index].firstName,
      url: verticalview[index].url,
    );
    if (verticalview[index].isSelected) {
      // bool result = horizontalview.remove(temp);
      // print(result);
      verticalview[index].isSelected = !verticalview[index].isSelected;
      horizontalview.clear();
      for (int i = 0; i < verticalview.length; i++) {
        Horizontal temp1 = Horizontal(
          firstName: verticalview[i].firstName,
          url: verticalview[i].url,
        );
        if (verticalview[i].isSelected) horizontalview.add(temp1);
      }
    } else {
      verticalview[index].isSelected = !verticalview[index].isSelected;
      horizontalview.add(temp);
    }

    notifyListeners();
  }
}
