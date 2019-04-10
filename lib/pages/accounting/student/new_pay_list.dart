import 'package:club_manager/pages/accounting/student/demand_note.dart';
import 'package:club_manager/pages/accounting/online_pay_list/onlinePayment.dart';
import 'package:meta/meta.dart';

class GeneralPaymentInformation{
  bool isDemandNote;
  DemandNote demandNote;
  OnlinePayment onlinePayment;

  GeneralPaymentInformation({@required this.isDemandNote, this.demandNote, this.onlinePayment});


}
