import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_colors.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/screens/edit_screen.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
     return
     // InkWell(
    //   onTap: () {
    //     Navigator.of(context).pushNamed(EditScreen.routeName);
    //   },
     // child:
       Container(
        height: MediaQuery.of(context).size.height*0.15,
         child: Card(
          child: ListTile(
            onTap: () {
          Navigator.of(context).pushNamed(EditScreen.routeName);
               },
            titleTextStyle: const TextStyle(
                fontSize: 10, color: Colors.black45, fontWeight: FontWeight.w500),
            title:Text(task.taskGroup),
            subtitleTextStyle: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2),
            subtitle: Column(
              children: [
                Text(task.taskName),
                 Align(
                  alignment: Alignment.bottomRight,
                   child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontWeight: FontWeight.values[5],
                        fontSize: 8,
                        color: Theme.of(context).colorScheme.onPrimary,
                        letterSpacing: 0.1,
                      ),
                    ),
                                   ),
                 ),

              ],
            )
            ,
            
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColors.workColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ImageIcon(
                    AssetImage("assets/images/icons/briefcase.png"),
                    color: AppColors.workIconColor,
                    size: 26,
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                //   decoration: BoxDecoration(
                //     color: Theme.of(context).colorScheme.primary,
                //     borderRadius: BorderRadius.circular(35),
                //   ),
                //   child: Text(
                //     "Done",
                //     style: TextStyle(
                //       fontWeight: FontWeight.values[5],
                //       fontSize: 8,
                //       color: Theme.of(context).colorScheme.onPrimary,
                //       letterSpacing: 0.1,
                //     ),
                //   ),
                // ),
              ],
            ),
            // isThreeLine: true,
          ),
               //  shape: Border.all(),
          // child: Container(
          //   padding:const  EdgeInsets.symmetric(horizontal: 17,),
          //   height: MediaQuery.of(context).size.height*0.13,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         task.taskGroup,
          //         style: const TextStyle(
          //             fontSize: 10,
          //             color: Colors.black45,
          //             fontWeight: FontWeight.w500),
          //       ),
          //        Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //          children: [
          //            Text(
          //            task.taskName,
          //             style: const TextStyle(
          //                 fontSize: 12,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.w600,
          //                 letterSpacing: 0.2),
          //                          ),
          //              Container(
          //             padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          //             decoration: BoxDecoration(
          //               color: Theme.of(context).colorScheme.primary,
          //               borderRadius: BorderRadius.circular(35),
          //             ),
          //             child: Text(
          //               "Done",
          //               style: TextStyle(
          //                 fontWeight: FontWeight.values[5],
          //                 fontSize: 8,
          //                 color: Theme.of(context).colorScheme.onPrimary,
          //                 letterSpacing: 0.1,
          //               ),
          //             ),
          //           ),
          //          ],
          //        ),
          //       // Row(
          //       //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       //   children: [
          //           // Row(
          //           //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           //   children: [
          //           //     ImageIcon(
          //           //       size: 14,
          //           //       const AssetImage("assets/images/icons/clock.png",),
          //           //      color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
          //           //     ),
          //           //     const SizedBox(width: 3,),
          //           //     // Text(
          //           //     //   "10:00 AM",
          //           //     //   style: TextStyle(
          //           //     //     color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
          //           //     //    //color: AppColors.lightPurple,
          //           //     //     fontSize: 10,
          //           //     //   ),
          //           //     // )
          //           //   ],
          //           // ),
         
          //         ],
          //       )
          //    // ],
          //   ),
              // ),
               // child: ListTile(
               //   titleTextStyle: TextStyle(fontSize: 10,color: Colors.black45,fontWeight: FontWeight.w500),
               //   title: Text("Grocery shopping app design"),
               //   subtitleTextStyle: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w500,letterSpacing: 0.2),
               //   subtitle: Column(
               //     children: [
               //       Text("Competitive Analaysis"),
               //       Row(
               //         children: [
               //           ImageIcon(
               //             const AssetImage("assets/images/icons/clock.png"),
               //             color: Theme.of(context).colorScheme.primary,
               //           ),
               //           Text("10:00 AM",style: TextStyle(
               //             color:Theme.of(context).colorScheme.primary,
               //             fontSize: 10,
               //           ),)
               //         ],
               //       )
               //     ],
         
               //   ),
               //   trailing: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
               //     Container(
               //       height: 30,
               //       width: 30,
               //       decoration: BoxDecoration(
               //         color:AppColors.workColor,
               //         borderRadius: BorderRadius.circular(10),
               //       ),
               //       child: ImageIcon(AssetImage("assets/images/icons/briefcase.png"),color: AppColors.workIconColor,size: 26,),
               //     ),
               //     Container(
               //       padding: EdgeInsets.symmetric(vertical: 2,horizontal: 8),
               //       decoration: BoxDecoration(
               //         color:Theme.of(context).colorScheme.primary,
               //         borderRadius: BorderRadius.circular(35),
               //       ),
               //       child:Text("Done",style: TextStyle(
               //             fontWeight: FontWeight.values[5],
               //             fontSize: 8,
               //              color:Theme.of(context).colorScheme.onPrimary,
               //              letterSpacing: 0.1,
               //           ),),
               //     ),
               //   ],),
               //  // isThreeLine: true,
         
               // ),
               // ),
             ),
       );
  }
}
