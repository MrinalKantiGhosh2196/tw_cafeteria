import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group("user journey test", (){
    FlutterDriver driver;
    setUpAll(() async{
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null){
        driver.close();
      }
    });

    test("should find appbar with proper widget", () async{
      expect(await driver.getText(find.text("TW Cafeteria")), true);
    });
  });
}