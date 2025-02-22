import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:vector_math/vector_math.dart';
import 'package:o3d/o3d.dart';


class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {

  Flutter3DController firstAvatarController = Flutter3DController();


  late Flutter3DController controller2;

  Future<void> _setFirstAnimations() async {
    final availableAnimations =
    await firstAvatarController.getAvailableAnimations();
    firstAvatarController.setCameraOrbit(150, 0, 2);
    print('First Avatar Animations: $availableAnimations');
  }

  void moveFront(){
    setState(() {
     // movementX +=0.5;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hellod');
    _setFirstAnimations();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Avatar',

        ),
        centerTitle: true,

        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.male_sharp,
             ),
             ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.female_sharp,
             )),
        ],
      ),

      body:  Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 200,
                height: 300,
                child: Flutter3DViewer(

                  activeGestureInterceptor: true,

                  enableTouch: true,
                  onProgress: (double progressValue) {},
                  onLoad: (String modelAddress) => _setFirstAnimations(),
                  onError: (String error) {},
                  controller: firstAvatarController,


                  src: 'assets/avatar1.glb',
                ),
              ),
            ],

          )
        ],

      )

      /*Column(
        children: [

          //first avatar
          Row(
   mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //first avatar
        SizedBox(
          width: 200,
          height: 300,
          child: ModelViewer(
            src: 'assets/avatar1.glb',
          cameraOrbit: "50deg 15deg 2m",
            autoPlay: false,
            autoRotate: false,

          ),
        )
      ],
    ),

          // avatar 2
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                height: 300,
                child: ModelViewer(
                  src: 'assets/avatar1.glb',
                  cameraOrbit: "-120deg 0deg 0m",
                  autoRotate: false,
                  autoPlay: false,
                ),
              )
            ],

          ),





          Center(
            child: Padding(
                padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.arrow_back_outlined)),

                  IconButton(onPressed: (){},
                      icon: Icon(Icons.space_bar_sharp),
                  ),

                  IconButton(onPressed: (){},
                      icon: Icon(Icons.arrow_forward_sharp)),


                ],
              ),
            ),
          ),

        ],
      ),



*/
    );
  }
}
