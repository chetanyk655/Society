// This file contains dummy data for the facility booking screen.

List<Map<String, dynamic>> getMultipleDummyData(Map<String, dynamic> response) {
  List<Map<String, dynamic>> fetchedList = [];
  Map<String, dynamic> parsedJsonComplaints = response['complaints'];
  Map<String, dynamic> parsedJsonFeedbacks = response['feedbacks'];
  if (parsedJsonComplaints['status_code'] == 200) {
    for (int i = 0; i < parsedJsonComplaints['response'].length; i++) {
      fetchedList.add({
        "title": "Complaint",
        "description": parsedJsonComplaints['response'][i]['complaint'],
        "date": parsedJsonComplaints['response'][i]['date'],
        "time": parsedJsonComplaints['response'][i]['time'],
        "email": parsedJsonComplaints['response'][i]['usr_mail'],
        "id": parsedJsonComplaints['response'][i]['c_id'],
        "status": parsedJsonComplaints['response'][i]['c_status']
      });
    }
  }

  if (parsedJsonFeedbacks['status_code'] == 200) {
    for (int i = 0; i < parsedJsonFeedbacks['response'].length; i++) {
      fetchedList.add({
        "title": "Feedback",
        "description": parsedJsonFeedbacks['response'][i]['feedback'],
        "date": parsedJsonFeedbacks['response'][i]['date'],
        "time": parsedJsonFeedbacks['response'][i]['time'],
        "email": parsedJsonFeedbacks['response'][i]['usr_mail'],
        "id": parsedJsonFeedbacks['response'][i]['f_id'],
        "status": parsedJsonFeedbacks['response'][i]['f_status']
      });
    }
  }
  return fetchedList;
}
