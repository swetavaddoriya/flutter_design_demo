import 'package:flutter/material.dart';
import 'package:flutter_design_demo/Constant/AppColor.dart';
import 'package:flutter_design_demo/GridView/GridPage.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionPage extends StatefulWidget {
  @override
  _PermissionPageState createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  double sWidth = 0;
  final PermissionGroup _permissionGroup = PermissionGroup.storage;
  PermissionStatus _permissionStatus = PermissionStatus.unknown;

  @override
  void initState() {
    super.initState();
  }

  Future<void> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
    await PermissionHandler().requestPermissions(permissions);
    setState(() {
      print(permissionRequestResult);
      _permissionStatus = permissionRequestResult[permission];
      if(_permissionStatus==PermissionStatus.granted){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) => GridPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    sWidth = (MediaQuery.of(context).size.width) * 0.65;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          heightFactor: 1.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                "Everything is okey",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Image.asset(
                'assets/images/permission.png',
                height: sWidth,
                width: sWidth,
              ),
              Text(
                "Now we need your permission to\ncontinue use the application perfectly",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Container(
                width: (MediaQuery.of(context).size.width) * 0.75,
                decoration: BoxDecoration(
                  color: AppColors.TEXT_COLOR,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.TEXT_COLOR,
                        blurRadius: 8,
                        offset: Offset(0, 1))
                  ],
                ),
                child: InkWell(
                  onTap: () {
//                    showDialog(
//                      context: context,
//                      barrierDismissible: false,
//                      builder: (_) => SignUpDialog(),
//                    );
                    requestPermission(_permissionGroup);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, top: 12.0),
                    child: Text(
                      'Allow Permission',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
