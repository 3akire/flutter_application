
import 'package:flutter/material.dart';

import '../models/stage_model.dart';
import '../widgets/task_drag_target.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    List<Stage> stages= Stage.stages;
    return Scaffold( 
      backgroundColor: const Color(0xFFEEF2F5),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >1200){
            return _DesktopLayout(
              constraints: constraints,
              stages: stages
            );
          }else{
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal ,
              child: _TabletLayout(
                constraints: constraints,
                stages: stages
              ),
            );
          }
        },),
    );
  }
}

class _DesktopLayout extends StatelessWidget{
 const _DesktopLayout({super.key, 
 required this.constraints,
 required this.stages,});

final BoxConstraints constraints;
final List<Stage> stages;
@override
  Widget build(BuildContext context) {
   return Container(
    color: Colors.blue,
    child:Row(
      children: [
      _Sidebar(),
       const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ScreenTitle(),
            Expanded(
              child: TaskDragTarget(
                stages: stages, 
                constraints: constraints,),
            ),
        ],
        ),
      ),
    ],),
   );
  }
}


class _Sidebar extends StatelessWidget {
  const _Sidebar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    List<IconData> icons =[
      Icons.home,
      Icons.stacked_bar_chart,
      Icons.email,
      Icons.analytics,
      Icons.settings,

    ];
    return Container(
      width: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),         
      ),
      child: Column(children: [
        Image.asset('task.png'),
        const Spacer(flex: 1),
        ListView.separated(
        itemBuilder: (context, index ) {
          return IconButton(onPressed: () {}, 
          color: Color(0xFF3A86FF).withAlpha(155) ,
          iconSize: 35, 
          icon: Icon(icons[index]),
          );
        },
         separatorBuilder: (context, index ) {
          return const SizedBox(height: 20);
         }, 
         itemCount: 5,
         shrinkWrap: true,
         ),
         const Spacer(flex: 5),
      ],),
    );
  }
}

class _TabletLayout extends StatelessWidget{
 const _TabletLayout({super.key, 
 required this.constraints,
 required this.stages,});

final BoxConstraints constraints;
final List<Stage> stages;
  
@override
  Widget build(BuildContext context) {

   return Container(
    color: Colors.amber,
    child:Row(children: [
      _Sidebar(),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ScreenTitle(),
           SizedBox(
            height: constraints.maxHeight*0.8,
             child: TaskDragTarget(
                stages: stages, 
                constraints: constraints,),
           ),
      ],
      ),
    ],),
   );
  }
}

class _ScreenTitle extends StatelessWidget {
  const _ScreenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
    child: Text(
      'Your tasks', 
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.bold
      ),
      )
           );
  }
}