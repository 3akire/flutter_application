import 'package:flutter/material.dart';

import '../models/stage_model.dart';
import '../models/task_model.dart';

class TaskDragTarget extends StatefulWidget {
  const TaskDragTarget({
    super.key,
    required this.stages,
    required this.constraints,
  });

  final List<Stage> stages;
  final BoxConstraints constraints;

  @override
  State<TaskDragTarget> createState() => _TaskDragTargetState();
}

class _TaskDragTargetState extends State<TaskDragTarget> {
  late List<Task> tasks;
  @override
  void initState(){
    tasks= Task.tasks;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Row(
      children: [
        for(Stage stage in widget.stages) 
        (widget.constraints.maxWidth>1200)
       ? Expanded(child: _buildTaskDragMethod(context, stage))
       : _buildTaskDragMethod(context, stage),
      ],
    );
    
    
  }

  Container _buildTaskDragMethod(BuildContext context, Stage stage, ) {
    List<Task> stageTask= tasks.where((task)=> task.stage==stage).toList();
    return Container(
    margin:const EdgeInsets.all(10.0) ,
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 20, 
              height: 20, 
              decoration: BoxDecoration(
                color: stage.color,
                borderRadius: BorderRadius.circular(5.0),),
              
              ),
              const SizedBox(width: 10),
              Text(
                stage.name,
             style: Theme.of(context)
             .textTheme
             .titleLarge!
             .copyWith(fontWeight: FontWeight.bold), 
             )
          ],
        ),
        Divider(
          color: stage.color, 
          height: 20, 
          thickness: 2,),
           Expanded(
             child: DragTarget<Task>(
              builder: ((context, candidateData, rejectedData ){
              return Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: stageTask.length,
                    itemBuilder: (context, index){
                      return Text(tasks[index].title);
              
                    },
                    ),
              );
              }
              ),
                       ),
           )
      ],
    ),
    );
  }
}