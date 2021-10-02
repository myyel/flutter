import 'package:flutter/material.dart';
import 'package:mvvm_uygulama_mimarisi/models/books_model.dart';
import 'package:mvvm_uygulama_mimarisi/models/borrow_info_model.dart';
import 'package:mvvm_uygulama_mimarisi/services/time_calculator.dart';
import 'package:provider/provider.dart';

import 'barrow_list_view_model.dart';

class BarrowListView extends StatefulWidget {
  late Books book;
  BarrowListView({required this.book});

  @override
  _BarrowListViewState createState() => _BarrowListViewState();
}

class _BarrowListViewState extends State<BarrowListView> {
  @override
  Widget build(BuildContext context) {
    List<BorrowInfo> barrowList = widget.book.borrows;

    return ChangeNotifierProvider<BarrowListViewModel>(
      create: (context) => BarrowListViewModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: Text("${widget.book.bookName}Kayıt Listesi"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          "https://s3-us-east-2.amazonaws.com/maryville/wp-content/uploads/2020/01/07163629/author-at-work-500x333.jpg",
                        ),
                      ),
                      title: Text(
                          "${barrowList[index].name} ${barrowList[index].surname}"),
                    );
                  },
                  separatorBuilder: (context, _) => Divider(),
                  itemCount: barrowList.length,
                ),
              ),
              InkWell(
                onTap: () async {
                  BorrowInfo? newBarrowInfo =
                      await showModalBottomSheet<BorrowInfo>(
                          context: context,
                          builder: (BuildContext context) {
                            return BarrowForm();
                          });
                  if (newBarrowInfo != null) {
                    setState(() {
                      barrowList.add(newBarrowInfo);
                    });
                    context.read<BarrowListViewModel>().updateBook(
                          book: widget.book,
                          barrowList: barrowList,
                        );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 80,
                  color: Colors.blueAccent,
                  child: Text(
                    "Yeni Ödünç",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BarrowForm extends StatefulWidget {
  const BarrowForm({Key? key}) : super(key: key);

  @override
  _BarrowFormState createState() => _BarrowFormState();
}

class _BarrowFormState extends State<BarrowForm> {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController surnameCtr = TextEditingController();
  TextEditingController barrowDateCtr = TextEditingController();
  TextEditingController returnDateCtr = TextEditingController();
  late DateTime _selectedBarrowDate;
  late DateTime _selecetedReturnDate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameCtr.dispose();
    surnameCtr.dispose();
    barrowDateCtr.dispose();
    returnDateCtr.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          "https://s3-us-east-2.amazonaws.com/maryville/wp-content/uploads/2020/01/07163629/author-at-work-500x333.jpg",
                        ),
                      ),
                      Positioned(
                        bottom: -5,
                        right: -10,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.photo_camera_rounded,
                            color: Colors.grey.shade100,
                            size: 26,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameCtr,
                        decoration: InputDecoration(
                          hintText: "Ad",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Adınızı giriniz";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: surnameCtr,
                        decoration: InputDecoration(
                          hintText: "Soyad",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Soyadınızı giriniz";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextFormField(
                    onTap: () async {
                      _selectedBarrowDate = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          Duration(days: 365),
                        ),
                      ))!;
                      barrowDateCtr.text =
                          TimeCalculator.dateTimeToString(_selectedBarrowDate);
                    },
                    controller: barrowDateCtr,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      hintText: "Alım Tarihi",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Lütfen Tarih Seçiniz";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextFormField(
                    onTap: () async {
                      _selecetedReturnDate = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          Duration(days: 365),
                        ),
                      ))!;
                      returnDateCtr.text =
                          TimeCalculator.dateTimeToString(_selecetedReturnDate);
                    },
                    controller: returnDateCtr,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      hintText: "İade Tarihi",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Lütfen Tarih Seçiniz";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  /// kulanıcı bilgileri ile BorrowInfo objesi oluşturacağız
                  BorrowInfo newBorrowInfo = BorrowInfo(
                      photoUrl: "",
                      name: nameCtr.text,
                      surname: surnameCtr.text,
                      borrowDate: TimeCalculator.dateTimeToTimeStamp(
                          _selectedBarrowDate),
                      returnDate: TimeCalculator.dateTimeToTimeStamp(
                          _selectedBarrowDate));

                  /// navigator.pop
                  Navigator.pop(context, newBorrowInfo);
                }
              },
              child: Text("Ödünç Kayıt EKle"),
            )
          ],
        ),
      ),
    );
  }
}
