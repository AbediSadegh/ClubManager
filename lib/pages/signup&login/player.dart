import 'package:club_manager/pages/accounting/demand_note.dart';
import 'package:club_manager/pages/accounting/online_pay_list/onlinePayment.dart';

class Player{


  String name;
  String family;
  int birthday;
  int passport;
  String email;
  String patientHistory;
  String technicalFoot;
  String favoritePos;
  int fatherPhone;
  String fatherWorks;
  int motherPhone;
  int homePhone;
  String address;
  String schoolName;
  String coachName;
  String lastTeam;
  String reagentCode;
  String timePeriod;
  List<OnlinePayment> onlinePay=[OnlinePayment(cost: "12000",date: "98/12/01",trackingCode: "123456")];
  List<DemandNote> demandNote = [
    DemandNote(demandNoteDate: "98/01/01",demandNoteAuthor: "jhoney sins",isPass: false,demandNoteValue: 15000),
  ];

  Player({this.timePeriod,this.name, this.family, this.birthday, this.passport, this.email,
      this.patientHistory, this.technicalFoot, this.favoritePos,
      this.fatherPhone, this.fatherWorks, this.motherPhone, this.homePhone,
      this.address, this.schoolName, this.coachName, this.lastTeam,this.reagentCode});


}