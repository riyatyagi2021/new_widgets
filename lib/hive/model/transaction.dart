import 'package:hive/hive.dart';
part 'transaction.g.dart';          // run this command -flutter packages pub run build_runner build


@HiveType(typeId: 1)       //unique id to each class
class Transaction extends HiveObject {     //extends gives us more functionality like more methods-save,delete
  @HiveField(0)             //unique field id to each field with this specific class
  late String name;

  @HiveField(1)             //never reuse this same number again
  late DateTime createdDate;      // do not chnage the returntype, if u chnage it-plz chnage the field value number i.e not used before

  @HiveField(2)
  late bool isExpense = true;

  @HiveField(3)
  late double amount;
}