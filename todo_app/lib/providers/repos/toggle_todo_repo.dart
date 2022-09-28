import 'package:todo_app/services/remote/api_call.dart';

class ToggleTodoRepository {
  ApiCall apiCall = ApiCall();

  Future postToggleValue(String id) async {
    final data = await apiCall.putData('/todos/$id', {
      'isDone': false,
    });
  }
}
