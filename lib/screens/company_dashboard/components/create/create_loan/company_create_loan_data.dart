import 'package:flutter/material.dart';

class CompanyLoanListData {
  CompanyLoanListData({
    this.titleTxt = '',
    this.titleType = '',
    this.isSelected = false,
  });

  String titleTxt;
  String titleType; // Added titleType property
  bool isSelected;

  static List<CompanyLoanListData> companyLoanListData = [
    CompanyLoanListData(titleTxt: 'Photo Upload', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Pan Card Upload', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Aadhar Upload', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Light bill Upload', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Rental Agreement upload', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: '3 Month Salary slip', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: '6 month back statement', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Company Id', titleType: 'number', isSelected: false),
    CompanyLoanListData(titleTxt: 'Appointment Letter', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Relieving letter', titleType: 'number', isSelected: false),
    CompanyLoanListData(titleTxt: '2 year ITR', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: '1 Year bank statement', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Business Identity proof', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Office address proof', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Copy of property related Document', titleType: 'number', isSelected: false),
    CompanyLoanListData(titleTxt: 'Share Certificate', titleType: 'number', isSelected: false),
    CompanyLoanListData(titleTxt: 'Chain Agreement', titleType: 'number', isSelected: false),
    CompanyLoanListData(titleTxt: 'Plan copy', titleType: 'number', isSelected: false),
    CompanyLoanListData(titleTxt: 'Occupation certificate', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Commencement & Completion certificate', titleType: 'string', isSelected: false),
    CompanyLoanListData(titleTxt: 'Other multiple documents', titleType: 'number', isSelected: false),
  ];
}


