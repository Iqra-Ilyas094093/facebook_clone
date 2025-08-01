import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final Widget Desktop;
  final Widget? Tablet;
  final Widget Mobile;
  const Responsive({super.key, required this.Desktop,this.Tablet, required this.Mobile});

static bool isDesktop(BuildContext context)=> MediaQuery.of(context).size.width >1200;
static bool isTablet(BuildContext context)=> MediaQuery.of(context).size.width >=800&&MediaQuery.of(context).size.width <=1200;
static bool isMobile(BuildContext context)=> MediaQuery.of(context).size.width < 800;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth>=1200){
        return Desktop;
      }else if(constraints.maxWidth>=800){
        return Tablet??Mobile;
      }else{
        return Mobile;
      }
    });
  }
}
