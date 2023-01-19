/*import 'package:shared_preferences/shared_preferences.dart';
import 'package:OnlineCourseAppUI/question_screens/dsa.dart';

var dsa_progress = 0.5;

addDoubleToSF(double dd) async {
  if (dd == null) dd = 0.0;
  //var temp= getprogress();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('dsa_progress', dd);
}

getDoubleValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return double
  double doubleValue = prefs.getDouble('dsa_progress');
  print('value returned by getDoubleValueSF is $doubleValue');
  return doubleValue;
}

double returndouble() {
  double temp = getDoubleValuesSF();
  return temp;
}
*/