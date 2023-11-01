import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_profile_appbar.dart';
import 'package:hpn_pay_project_avestan/screens/company_dashboard/widgets/company_drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:velocity_x/velocity_x.dart';

class CompanyDashboardScreen extends StatefulWidget {
  String companyName;
  CompanyDashboardScreen({super.key, required this.companyName});

  @override
  State<CompanyDashboardScreen> createState() => _CompanyDashboardScreenState();
}

class _CompanyDashboardScreenState extends State<CompanyDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<ChartData> chartData = [
    ChartData('David', 25, primaryColor),
    ChartData('Steve', 38, Colors.blue),
    ChartData('Jack', 34, Colors.red),
    ChartData('Others', 52, Colors.green)
  ];

  final List<String> companyCustomerDataList = <String>[
    'Total Customer',
    'Total Customer',
    'Saving',
    'Total Customer',
  ];

  final List<Data> _data = [
    Data('Justin Lipshutz', 'Marketing', '22', '100%', 'Permanent'),
    Data('Marcus Culhane', 'Finance', '24', '95%', 'Contract'),
    Data('Leo Stanton', 'R&D', '28', '89%', 'Permanent'),
  ];

  late Map<String, double> columnWidths = {
    'name': double.nan,
    'department': double.nan,
    'age': double.nan,
    'disipline': double.nan,
    'status': double.nan
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      key: _scaffoldKey,
      drawer: CompanyDrawerWidget(),
      appBar: CustomProfileAppBar(scaffoldKey: _scaffoldKey,),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                    2, // You can change the number of columns as needed
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: companyCustomerDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                              children: [
                                companyCustomerDataList[index].text.size(10).make(),
                                4.widthBox,
                                Row(
                                  children: [
                                    Icon(Icons.trending_up, size: 8, color: Colors.green),
                                    2.widthBox,
                                    '10.0%'.text.color(Colors.green).size(2).make(),
                                  ],
                                ).box.padding(EdgeInsets.all(2)).color(Colors.green.withOpacity(0.1)).roundedSM.make(),
                              ],
                            ),
                      10.heightBox,
                      5.heightBox,
                      '856'.text.size(18).black.bold.make(),
                      10.heightBox,
                      'Employee'.text.color(greyColor).size(12).make(),
                    ],
                  ).box.color(Colors.grey.withOpacity(0.1)).p16.roundedSM.make();
                },
              ),
              20.heightBox,

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  'Employee Composition of'.text.extraBold.extraBlack.make(),
                  3.widthBox,
                  widget.companyName.text.extraBold.color(primaryColor).size(18).make(),
                ],
              ),
              SfCircularChart(
                  series: <CircularSeries>[
                    // Render pie chart
                    PieSeries<ChartData, String>(
                        dataSource: chartData,
                        pointColorMapper:(ChartData data,  _) => data.color,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        explode: true,
                        // First segment will be exploded on initial rendering
                        explodeIndex: 3
                    )
                  ]
              ),
              20.heightBox,
              SfDataGrid(
                allowColumnsDragging: false,
                source: _DataSource(data: _data),
                allowColumnsResizing: true,
                onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
                  setState(() {
                    columnWidths[details.column.columnName] = details.width;
                  });
                  return true;
                },
                columnResizeMode: ColumnResizeMode.onResizeEnd,
                columns: <GridColumn>[
                  GridColumn(
                      width: columnWidths['name']!,
                      columnName: 'name',
                      label: const Text('Employee Name')),
                  GridColumn(
                      width: columnWidths['department']!,
                      columnName: 'department',
                      label: const Text('Department')),
                  GridColumn(
                      width: columnWidths['age']!,
                      columnName: 'age',
                      label: const Text('Age')),
                  GridColumn(
                      width: columnWidths['disipline']!,
                      columnName: 'disipline',
                      label: const Text('Disipline')),
                  GridColumn(
                      width: columnWidths['status']!,
                      columnName: 'status',
                      label: const Text('Status')),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class _DataSource extends DataGridSource {
  final List<Data> data;

  _DataSource({required this.data});

  @override
  List<DataGridRow> get rows => data
      .map((d) => DataGridRow(cells: [
    DataGridCell<String>(columnName: 'name', value: d.name),
    DataGridCell<String>(columnName: 'department', value: d.department),
    DataGridCell<String>(columnName: 'age', value: d.age),
    DataGridCell<String>(columnName: 'disipline', value: d.disipline),
    DataGridCell<String>(columnName: 'status', value: d.status),
  ]))
      .toList();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataCell) {
        if (dataCell.columnName == 'name') {
          // Create a custom column for the profile image
          return Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Image.asset('assets/images/profile.jpg', width: 25, height: 25),
                SizedBox(width: 8),
                Text(dataCell.value.toString(),style: TextStyle(fontSize: 12),),
              ],
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(dataCell.value.toString()),
          );
        }
      }).toList(),
    );
  }

}
class Data {
  final String name;
  final String department;
  final String age;
  final String disipline;
  final String status;

  Data(this.name, this.department, this.age, this.disipline, this.status);
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}


