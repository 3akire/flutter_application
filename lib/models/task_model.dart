import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_trial/models/stage_model.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final int commentCount;
  final int attachmentCount;
  final Stage? stage;
  final ImageProvider? image;

  Task({
    required this.id, 
    required  this.title, 
    required  this.description, 
    required this.commentCount, 
    required this.attachmentCount, 
     this.stage, 
     this.image, 

  });

  Task copyWith ({
    String? id,
    String? title,
    String? description,
    int? commentCount,
    int? attachmentCount,
    Stage? stage,
    ImageProvider? image,
  

  }) {
    return Task(
      id: id ?? this.id, 
      title: title ?? this.title, 
      description: description ?? this.description, 
      commentCount: commentCount ?? this.commentCount, 
      attachmentCount: attachmentCount?? this.attachmentCount,
      stage: stage?? this.stage,
      image:image?? this.image ,
      );
  }

static List<Task> tasks=[
  Task(id: '1', 
  title: 'Build', 
  description: 'dai', 
  commentCount: 3, 
  attachmentCount: 1,
  image: const NetworkImage('https://tse3.mm.bing.net/th?id=OIP.Y54vFfR-4jHXRH5rSi7bgwHaEK&pid=Api'
  ),
  stage: Stage.stages[0],
  ),

  Task(id: '2', 
  title: 'Decorate', 
  description: 'dai', 
  commentCount: 3, 
  attachmentCount: 1,
  image: const NetworkImage('https://tse3.mm.bing.net/th?id=OIP.Y54vFfR-4jHXRH5rSi7bgwHaEK&pid=Api'
  ),
  stage: Stage.stages[0],
  ),

  Task(id: '3', 
  title: 'Check', 
  description: 'dai', 
  commentCount: 3, 
  attachmentCount: 1,
  image: const NetworkImage('https://tse3.mm.bing.net/th?id=OIP.Y54vFfR-4jHXRH5rSi7bgwHaEK&pid=Api'
  ),
  stage: Stage.stages[0],
  ),
    Task(id: '4', 
  title: 'control', 
  description: 'dai', 
  commentCount: 3, 
  attachmentCount: 1,
  image: const NetworkImage('https://tse3.mm.bing.net/th?id=OIP.Y54vFfR-4jHXRH5rSi7bgwHaEK&pid=Api'
  ),
  stage: Stage.stages[1],
  ),
    Task(id: '5', 
  title: 'talk', 
  description: 'dai', 
  commentCount: 3, 
  attachmentCount: 1,
  image: const NetworkImage('https://tse3.mm.bing.net/th?id=OIP.Y54vFfR-4jHXRH5rSi7bgwHaEK&pid=Api'
  ),
  stage: Stage.stages[2],
  ),
    Task(id: '6', 
  title: 'Present', 
  description: 'dai', 
  commentCount: 3, 
  attachmentCount: 1,
  image: const NetworkImage('https://tse3.mm.bing.net/th?id=OIP.Y54vFfR-4jHXRH5rSi7bgwHaEK&pid=Api'
  ),
  stage: Stage.stages[3],
  ),
];


  @override
  List<Object?> get props =>[id, title, description, commentCount, attachmentCount, stage, image];
}