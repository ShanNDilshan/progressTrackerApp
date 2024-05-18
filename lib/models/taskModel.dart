import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

//create a unique id using uuid
final uuid = const Uuid().v4();

@HiveType(typeId: 1)
class taskModel {
  taskModel({required this.task, required this.isChecked}) : id = uuid;

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String task;

  @HiveField(2)
  final bool isChecked;
}
