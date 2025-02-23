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
  Flutter3DController SecondAvatarController = Flutter3DController();


  late Flutter3DController controller2;

  Future<void> _setFirstAnimations() async {
    final availableAnimations =
    await firstAvatarController.getAvailableAnimations();
    firstAvatarController.setCameraOrbit(-70, 0, 2);
    print('First Avatar Animations: $availableAnimations');

  }

  Future<void> _setSecondAnimations() async {
    final availableAnimations =
    await SecondAvatarController.getAvailableAnimations();
    SecondAvatarController.setCameraOrbit(120, 0, 2);
    print('Second Avatar Animations: $availableAnimations');
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hellod');


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

      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    src: 'assets/prelimFemale.glb',
                  ),
                ),


                //second avatar

                SizedBox(
                  width: 200,
                  height: 300,
                  child: Flutter3DViewer(
                    activeGestureInterceptor: true,

                    enableTouch: true,
                    onProgress: (double progressValue) {},
                    onLoad: (String modelAddress) => _setSecondAnimations(),
                    onError: (String error) {},
                    controller: SecondAvatarController,
                    src: 'assets/prelimModel.glb',
                  ),
                ),
              ],
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              Text('female'),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        firstAvatarController.playAnimation(

                          animationName: 'dance',
                        );


                      },
                          icon: Icon(Icons.arrow_back_outlined)),

                      IconButton(onPressed: (){
                        firstAvatarController.playAnimation(
                          animationName: 'expression'
                        );
                      },
                        icon: Icon(Icons.space_bar_sharp),
                      ),

                      IconButton(onPressed: (){
                        firstAvatarController.playAnimation(
                            animationName: 'run'
                        );
                      },
                          icon: Icon(Icons.arrow_forward_sharp)),

                      IconButton(onPressed: (){
                        firstAvatarController.stopAnimation();
                      },
                          icon: Icon(Icons.cancel)),


                    ],
                  ),
                ),
              ),
            ]
          ),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[

                Text('male'),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){
                          SecondAvatarController.playAnimation(
                              animationName: 'M_Dances_003'
                          );
                        },
                            icon: Icon(Icons.arrow_back_outlined)),

                        IconButton(onPressed: (){
                          SecondAvatarController.playAnimation(
                              animationName: 'M_Standing_Expressions_'
                          );
                        },
                          icon: Icon(Icons.space_bar_sharp),
                        ),

                        IconButton(onPressed: (){
                          SecondAvatarController.playAnimation(
                              animationName: 'M_Walk_002'
                          );
                        },
                            icon: Icon(Icons.arrow_forward_sharp)),


                        IconButton(onPressed: (){
                          SecondAvatarController.stopAnimation();
                        },
                            icon: Icon(Icons.cancel)),


                      ],
                    ),
                  ),
                ),
              ]
          )





        ],
      )


    );
  }
}
