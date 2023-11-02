import 'package:flutter/material.dart';

class CompanyFormListData {
  CompanyFormListData({
    this.titleTxt = '',
    this.titleType = '',
    this.isSelected = false,
  });

  String titleTxt;
  String titleType; // Added titleType property
  bool isSelected;

  static List<CompanyFormListData> companyFormListData = [
    CompanyFormListData(titleTxt: 'Party Name', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Type of Loan', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Display Name', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'User ID / password', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Email Address', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Upload Image', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Address', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Incentive', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'GST Number', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Range', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'State', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Method of Payment', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'City', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Target(Type of loan)', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Pin code', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'Minimum file', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'Mobile Number', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'Salary', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'Update URL', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Level', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'Account holder name', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Upgrade New Plan', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Bank Name', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Account No.', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'IFCS Code', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Upload Pan Card', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Minimum Business', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'Upload Aadhar Card', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Minimum Payout', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'Benefits', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Compulsory requirement', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Job description', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'No. of job Vacancy', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'Job deadlines', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Is this primary', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Is this primary or sub-primary?', titleType: 'string', isSelected: false),
    CompanyFormListData(titleTxt: 'Level Number', titleType: 'number', isSelected: false),
    CompanyFormListData(titleTxt: 'Level Name', titleType: 'string', isSelected: false),
  ];
}


