import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kahi_coffee/network/network_request.dart';
import 'package:kahi_coffee/providers/account_provider.dart';
import 'package:kahi_coffee/screen/home_screen.dart';
import 'package:kahi_coffee/utils/config_color.dart';
import 'package:kahi_coffee/widgets/showdialog.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class PersonalNewInfoScreen extends StatefulWidget {
  const PersonalNewInfoScreen({super.key});

  @override
  State<PersonalNewInfoScreen> createState() => _PersonalNewInfoScreenState();
}

class _PersonalNewInfoScreenState extends State<PersonalNewInfoScreen> {
  DateTime date = DateTime.utc(2003, 06, 14);
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  int id_account = 0;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black87,
        scrolledUnderElevation: 7,
        elevation: 7,
        toolbarHeight: 90,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Personal Info',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: StyleConfig.black,
                ),
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Member Name',
                style: TextStyle(
                  fontSize: 16,
                  color: StyleConfig.black,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: StyleConfig.grey,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: StyleConfig.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                    color: StyleConfig.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Birthday',
                style: TextStyle(
                  fontSize: 16,
                  color: StyleConfig.black,
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        date = value;
                      });
                    }
                  });
                },
                child: Text(
                  '${date.day}/${date.month}/${date.year}',
                  style: TextStyle(
                    fontSize: 16,
                    color: StyleConfig.grey,
                  ),
                ),
              ),
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 16,
                  color: StyleConfig.black,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(
                    color: StyleConfig.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                  labelStyle: TextStyle(
                    color: StyleConfig.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    labelStyle: TextStyle(
                      color: StyleConfig.grey,
                      fontSize: 12,
                    ),
                  ),
                  value: selectedGender,
                  items: <String>['Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  onPressed: () {
                    NetWorkRequest.createPersonalInfo(
                            Provider.of<AccountProvider>(context, listen: false)
                                .getId,
                            _firstNameController.text,
                            _lastNameController.text,
                            date,
                            _addressController.text,
                            _cityController.text,
                            selectedGender!)
                        .then(
                      (value) {
                        if (value.data == true) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else {
                          Showdialog.showAlertDialog(context, 'Error',
                              'Save personal information failed');
                        }
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: StyleConfig.colormain,
                    minimumSize: const Size(130, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: StyleConfig.white,
                      fontSize: 14,
                      fontFamily: 'Roboto-Regular',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
