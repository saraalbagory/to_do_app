import 'package:flutter/material.dart';
import 'package:to_do_app/common/custom_container.dart';
import 'package:to_do_app/common/images_name.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
       mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       crossAxisAlignment: CrossAxisAlignment.start,
        children:
         [
        //   CustomContainer(
        //       child: Row(
        //     children: [
        //       Icon(
        //         Icons.language_rounded,
        //         color: Theme.of(context).colorScheme.secondary,
        //       ),
        //       const Text("Language"),
              
        //       DropdownButton(
        //         value: "en",
        //         icon: ImageIcon(
        //           AssetImage(ImagesName.dropDownIcon),
        //           color: Colors.black,
        //         ),
        //         onChanged: (value) {},
        //         items: const [
        //           DropdownMenuItem(
        //             value: "en",
        //             child: Text(
        //               "English",
        //             ),
        //           ),
        //           DropdownMenuItem(
        //             value: "ar",
        //             child: Text(
        //               "عربى",
        //             ),
        //           )
        //         ],
        //       )
        //     ],
        //   )),
        const SizedBox(height:20 ,),
        const Text("Language",style: TextStyle(
          fontWeight: FontWeight.w600
        ),),
          CustomContainer(
              child: Row(
            children: [
              Icon(
                Icons.language_rounded,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    //underline: Divider(height: 0,),
                    value: "en",
                    items: const [
                      DropdownMenuItem(
                     //   alignment: Alignment.centerRight,
                        value: "en",
                        child: Text(
                          "English",
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "ar",
                        child: Text(
                          "عربى",
                          // style: TextStyle(color: Colors.white)
                        ),
                      )
                    ],
                    onChanged: (value) {},
                    icon: ImageIcon(
                      AssetImage(ImagesName.dropDownIcon),
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          )),
           const Text("Theme",style: TextStyle(
          fontWeight: FontWeight.w600
        ),),
          CustomContainer(
              child: Row(
            children: [
              Icon(
                Icons.dark_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    //underline: Divider(height: 0,),
                    value:true,
                    items: const [
                      DropdownMenuItem(
                     //   alignment: Alignment.centerRight,
                        value: true,
                        child: Text(
                          "Dark Mode",
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Text(
                         "Light mode",
                          // style: TextStyle(color: Colors.white)
                        ),
                      )
                    ],
                    onChanged: (value) {},
                    icon: ImageIcon(
                      AssetImage(ImagesName.dropDownIcon),
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
