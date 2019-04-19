import 'package:club_manager/pages/signup&login/register/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:persian_datepicker/persian_datepicker.dart';

class DemandNoteDialog extends StatelessWidget {
  final TextEditingController textEditingController;
  PersianDatePickerWidget persianDatePicker;
  final buttonPress;
  final keyForm;
  final nameOnSaved;
  final demandNumberOnSaved;
  final demandMoenyOnSaved;
  bool isLoading;

  DemandNoteDialog(
      {this.textEditingController,
      this.demandNumberOnSaved,
      this.buttonPress,
      this.keyForm,
      this.nameOnSaved,
      this.demandMoenyOnSaved,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    persianDatePicker = PersianDatePicker(
      controller: textEditingController,
    ).init();

    return Dialog(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.blueGrey,
      child: Container(
        height: MediaQuery.of(context).size.height * .525,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: ListView(
            children: <Widget>[
              Form(
                key: keyForm,
                child: Column(
                  children: <Widget>[
                    FormTextField(
                      label: "نام دارنده چک",
                      icon: Icons.person,
                      isEnable: true,
                      keyType: TextInputType.text,
                      obsecure: false,
                      onSaved: nameOnSaved,
                      valid: (String str) {
                        if (str.length < 2 && str == null) {
                          return "مقدار صحیح را وارد کنید";
                        }
                      },
                    ),
                    FormTextField(
                      label: "شماره چک",
                      obsecure: false,
                      keyType: TextInputType.numberWithOptions(signed: false),
                      isEnable: true,
                      icon: Icons.assignment,
                      valid: (String str) {
                        if (str.length < 2 && str == null) {
                          return "مقدار صحیح را وارد کنید";
                        }
                      },
                      onSaved: demandNumberOnSaved,
                    ),
                    FormTextField(
                      label: "مبلغ چک",
                      obsecure: false,
                      keyType: TextInputType.numberWithOptions(signed: false),
                      isEnable: true,
                      icon: Icons.credit_card,
                      valid: (String str) {
                        if (str.length < 4) {
                          return "مقدار صحیح را وارد کنید";
                        }
                      },
                      onSaved: demandMoenyOnSaved,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 14),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            labelText: "انتخاب تاریخ",
                            labelStyle: TextStyle(color: Colors.white),
                            icon: Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        enableInteractiveSelection: false,
                        // *** this is important to prevent user interactive selection ***
                        onTap: () {
                          FocusScope.of(context).requestFocus(
                              new FocusNode()); // to prevent opening default keyboard
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return persianDatePicker;
                              });
                        },
                        controller: textEditingController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : FlatButton(
                              child: Text(
                                "تایید",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: buttonPress,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.grey,
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
