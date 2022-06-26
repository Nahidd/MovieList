import 'package:flutter/material.dart';

import 'db/temp_db.dart';

class NewMoviePage extends StatefulWidget {
  const NewMoviePage({Key? key}) : super(key: key);

  @override
  State<NewMoviePage> createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  final _nameController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ratingController = TextEditingController();
  String? _type;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _nameController.dispose();
    _subtitleController.dispose();
    _descriptionController.dispose();
    _ratingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Movie'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Movie Name',
                fillColor: Colors.grey.shade300,
                filled: true
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 5,),
            TextFormField(
              controller: _subtitleController,
              decoration: InputDecoration(
                  labelText: 'Movie Subtitle',
                  fillColor: Colors.grey.shade300,
                  filled: true
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 5,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _ratingController,
              decoration: InputDecoration(
                  labelText: 'Rating',
                  fillColor: Colors.grey.shade300,
                  filled: true
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                if(double.parse(value!) < 0.0 || double.parse(value!) > 10.0) {
                  return 'Rating should be between 1.0 and 10.0';
                }
                return null;
              },
            ),
            const SizedBox(height: 5,),
            TextFormField(
              maxLines: 3,
              controller: _descriptionController,
              decoration: InputDecoration(
                  labelText: 'Description',
                  fillColor: Colors.grey.shade300,
                  filled: true
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 5,),
            DropdownButtonFormField<String>(
              hint: Text('Select movie category'),
              value: _type,
                items: typeList.map((type) => DropdownMenuItem(
                    child: Text(type),
                    value: type,
                  )
                ).toList(),
                onChanged: (value) {
                  _type = value;
                }
            ),
            SizedBox(height: 5,),
            ListTile(
              tileColor: Colors.grey.shade300,
              title: TextButton(
                child: const Text('Select Date'),
                onPressed: _selectDate,
              ),
              trailing: Text(_selectedDate == null ? DateTime.now().toIso8601String() : _selectedDate!.toIso8601String()),
            )
          ],
        ),
      ),
    );
  }

  void _selectDate() async {
    final dt = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year + 5));
    if(dt != null) {
      setState(() {
        _selectedDate = dt;
      });
    }
    print('hello');
  }
}
