import 'package:flutter/material.dart';
import 'package:notes/database_helper.dart';
import 'package:notes/models/task.dart';
import 'package:notes/widgets.dart';

class Taskpage extends StatefulWidget {
  final Task task;
  Taskpage({@required this.task});


  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  // now for fetching the title and discription
  String _taskTitle = "";
  String _taskDescription = "";
  int _taskId = 0;


  FocusNode _titleFocus;
  FocusNode _descriptionFocus;
  FocusNode _todoFocus;

  bool _contentVisible = false;
  bool flag = false;


  @override
  void initState() {

    //storing the task value

    if(widget.task != null){

      // if the task is not null set visibility to true
      _contentVisible = true;
      _taskTitle = widget.task.title;
      _taskDescription = widget.task.description;
      _taskId = widget.task.id;

    }

    _titleFocus = FocusNode();
    _descriptionFocus = FocusNode();
    _todoFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {

    _titleFocus.dispose();
    _descriptionFocus.dispose();

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 17.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image(
                              image: AssetImage('assets/images/back_arrow_icon.png'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: _titleFocus,
                            onSubmitted: (value) async {
                              print("Field Value: $value");



                              // condition input check if the field is not empty

                              if(value != "") {

                                //check if the task is null
                                if (widget.task == null){

                                  // creating a new task

                                  DatabaseHelper _dbHelper = DatabaseHelper();

                                  Task _newTask = Task(
                                      title: value
                                  );

                                  _taskId = await _dbHelper.insertTask(_newTask);
                                  setState(() {
                                    _contentVisible = true;
                                    _taskTitle = value;
                                  });

                                } else{
                                 await _dbHelper.updateTaskTitle(_taskId, value);
                                }

                                _descriptionFocus.requestFocus();

                              }

                            },
                            controller: TextEditingController()..text = _taskTitle,
                            decoration: InputDecoration(
                              hintText: "Enter Title",
                              border: InputBorder.none,
                              ),
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0A2463),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: _contentVisible,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 30.0,
                        ),
                        child: TextField(
                          maxLines: 100,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          focusNode: _descriptionFocus,
                          onSubmitted: (value){
                            if(value != ""){
                              if(_taskId != 0){
                                _dbHelper.updateTaskDescription(_taskId, value);
                              }

                            }
                          },
                          controller: TextEditingController()..text = _taskDescription,
                          decoration: InputDecoration(
                            hintText: "Write Something Here",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1E1B18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  
                  TodoWidget(isDone: true),




                ],
              ),

              // Delete button

              Visibility(
                visible: _contentVisible,
                child: Positioned(
                  bottom: 24.0,
                  right: 24.0,
                  child: GestureDetector(
                    onTap: () async {
                      if(_taskId != 0){
                        await _dbHelper.deleteTask(_taskId);
                        Navigator.pop(context);
                      }
                    },

                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF4B76),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image(
                        image: AssetImage(
                          "assets/images/delete_icon.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ),


              //delete button

            ],
          ),
        ),
      ),
    );
  }
}
