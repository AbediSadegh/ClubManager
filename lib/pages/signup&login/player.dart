
import 'package:club_manager/pages/accounting/online_pay_list/onlinePayment.dart';
import 'package:club_manager/pages/accounting/student/demand_note.dart';
import 'package:club_manager/pages/accounting/student/new_pay_list.dart';

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
  List<GeneralPaymentInformation> generalPayment=[
    GeneralPaymentInformation(
        isDemandNote: true,
        demandNote: DemandNote(
            demandNumber: 123456,
            demandNoteDate: "1398/01/17",
            demandNoteAuthor: "zmmmm",
            isPass: false,
            demandNoteValue: 15000
        )
    ),
    GeneralPaymentInformation(
        isDemandNote: false,
        onlinePayment: OnlinePayment(
            cost: "12000",
            trackingCode: "123456",
            date: "1398/01/18"
        )
    ),
  ];
  Player({this.timePeriod,this.name, this.family, this.birthday, this.passport, this.email,
      this.patientHistory, this.technicalFoot, this.favoritePos,
      this.fatherPhone, this.fatherWorks, this.motherPhone, this.homePhone,
      this.address, this.schoolName, this.coachName, this.lastTeam,this.reagentCode});


}