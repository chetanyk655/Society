// This file contains dummy data for the facility booking screen.

List<Map<String, dynamic>> getMultipleDummyData(
    Map<String, dynamic> parsedJson) {
  List<Map<String, dynamic>> fetchedList = [];
  if (parsedJson['status_code'] == 200) {
    for (int i = 0; i < parsedJson['response'].length; i++) {
      if (parsedJson['response'][i]['f_status'] != "Approved" &&
          parsedJson['response'][i]['f_status'] != "Declined") {
        fetchedList.add({
          "title": parsedJson['response'][i]['e_name'],
          "description": parsedJson['response'][i]['e_desc'],
          "date": parsedJson['response'][i]['e_date'],
          "time": parsedJson['response'][i]['e_time'],
          "email": parsedJson['response'][i]['usr_mail'],
          "id": parsedJson['response'][i]['f_id']
        });
      }
    }
  }
  return fetchedList;
}
