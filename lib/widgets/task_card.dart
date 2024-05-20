import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskCard extends StatelessWidget{
  const TaskCard({
    Key?key, 
 required this.task,}):super(key: key);

 final Task task;
  @override
Widget build(BuildContext context) {
   return Draggable <Task>(
    data:task,
    dragAnchorStrategy: pointerDragAnchorStrategy ,
    child: Container(
      padding:  const EdgeInsets.all(20.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage()
        ],
      ),
    ), 
    feedback: Text(
      task.title,
      style: Theme.of(context)
      .textTheme
      .titleLarge!
      .copyWith(fontWeight: FontWeight.bold),
   ),
   );
  }

  Widget _buildImage() {
    return (task.image == null)
    ? SizedBox():
    
    ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
        child: Image(
          image: task.image!,
         width: double.infinity, 
        height: 100,
        fit: BoxFit.cover,) 
        ,);
  }

}