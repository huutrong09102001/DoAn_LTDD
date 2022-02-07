import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/constants.dart';


class DHCTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: kBackgroundColor.withOpacity(1),
        appBar: buildAppBar(),
        body: background1(
              TabBarView(children: [
              ListView(
                children: [for (var i = 0; i < 4; i++)Column(
                children: [ don('Hủy đơn',context),
                SizedBox(height: 15,),],
              )
              ]),

              ListView(
                children: [  for (var i = 0; i < 4; i++)Column(
                children: [ don('Hủy đơn',context),
                SizedBox(height: 15,),],
              )
              ]),

              ListView(
                children: [for (var i = 0; i < 4; i++)Column(
                children: [ don('Hủy đơn',context),
                SizedBox(height: 15,),],
              )
              ]),

              ListView(children: [for (var i = 0; i < 4; i++)Column(
                children: [ don('Đánh giá',context),
                SizedBox(height: 15,),],
              )
              ]),
              ListView(children: [for (var i = 0; i < 4; i++)Column(
                children: [ don('Mua lại',context),
                SizedBox(height: 15,),],
              )
              ]),
            ]), context),
      ),
    );
  }
}


AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.lightGreen,
    centerTitle: true,
    title: Text("Đơn hàng của tôi"),
    bottom: const TabBar(
              isScrollable:true,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Chờ xác nhận'),
                Tab(text: 'Chờ lấy hàng'),
                Tab(text: 'Đang giao'),
                Tab(text: 'Đã giao'),
                Tab(text: 'Đã hủy')
              ],
            ),
  );
}

Widget background1(TabBarView lb, context) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.greenAccent,
                    Colors.yellowAccent,
                    Colors.blueAccent,
                  ]),
            ),
            child: lb,
          ),
        ]),
      ));
}

Widget don(String button,BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/invoicedetail');
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Row(children: [
          Container(
             width: 150,
             height: 60,
            child: Image.asset('assets/images/IP12.jpg')
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 300),
                child: Text(
                  'Iphone 12 Promax 256GB',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                'x1',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '24.000.000d',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.greenAccent,
                ),
              ),
            ],
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black45))),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '1 sản phẩm',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Thành tiền : 24.000.000d',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black45))),
          child:  ElevatedButton(
              child: Text(
                button,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Righteous',
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              onPressed: () => print('aaaaaa'),
            ),
          ),
        
      ]),
    ),
  );
}