import '../json_service.dart';

List<List<String>> whatIdo() {
  final proficiency = JSONService.response['what_i_do']['proficiency'].toList();
  final tools = JSONService.response['what_i_do']['tools'].toList();

  final List<String> totalProficiency = [];
  final List<String> totalTools = [];
  final List<List<String>> total = [];

  for (int k = 0; k < int.parse(proficiency.length.toString()); k++)
    totalProficiency.add(proficiency[k].toString());

  for (int k = 0; k < int.parse(tools.length.toString()); k++)
    totalTools.add(tools[k].toString());

  total.add(totalProficiency);
  total.add(totalTools);

  return total;
}
