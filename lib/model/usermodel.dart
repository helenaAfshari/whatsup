
import 'package:hive/hive.dart';

part 'usermodel.g.dart';
//flutter packages pub run build_runner build

@HiveType(typeId: 0)
class UserModel extends HiveObject{
 
   @HiveField(0)
   String name;
   @HiveField(1)
   String phone;
     
   @HiveField(2)
   String profileUser;

     UserModel({
                     
         required this.name,
         required this.phone,
         required this.profileUser,
     });

    
}