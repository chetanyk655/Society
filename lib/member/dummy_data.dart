// This file contains dummy data for the facility booking screen.

List<Map<String, dynamic>> getMultipleDummyData(
    Map<String, dynamic> parsedJson) {
  List<Map<String, dynamic>> fetchedList = [];
  if (parsedJson['status_code'] == 200) {
    for (int i = 0; i < parsedJson['response'].length; i++) {
      fetchedList.add({
        "title": parsedJson['response'][i]['e_name'],
        "description": parsedJson['response'][i]['e_desc'],
        "date": parsedJson['response'][i]['e_date'],
        "time": parsedJson['response'][i]['e_time'],
        "email": parsedJson['response'][i]['usr_mail'],
        "status": parsedJson['response'][i]['f_status']
      });
    }
  }
  return fetchedList;
}
