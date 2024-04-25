import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class OrderForm extends StatefulWidget {
  const OrderForm({Key? key, required this.orderNumber}) : super(key: key);
  final String orderNumber;

  @override
  State<OrderForm> createState() => _OrderFormState();
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

class _OrderFormState extends State<OrderForm> {
  final TextEditingController colorController = TextEditingController();
  ColorLabel? selectedColor;
  

  int _gardenWastePacks = 0;
  int _oversizedWasteItems = 0;
  List<File> _selectedImages = [];

  void _incrementGardenWastePacks() {
    setState(() {
      _gardenWastePacks++;
    });
  }

  void _incrementOversizedWasteItems() {
    setState(() {
      _oversizedWasteItems++;
    });
  }

  Future<void> _uploadPhotos() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    setState(() {
      _selectedImages =
          pickedImages.map((pickedImage) => File(pickedImage.path)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${widget.orderNumber}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Collection Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownMenu<ColorLabel>(
              initialSelection: ColorLabel.green,
              controller: colorController,
              // requestFocusOnTap is enabled/disabled by platforms when it is null.
              // On mobile platforms, this is false by default. Setting this to true will
              // trigger focus request on the text field and virtual keyboard will appear
              // afterward. On desktop platforms however, this defaults to true.
              requestFocusOnTap: true,
              label: const Text('Color'),
              onSelected: (ColorLabel? color) {
                setState(() {
                  selectedColor = color;
                });
              },
              dropdownMenuEntries: ColorLabel.values
                  .map<DropdownMenuEntry<ColorLabel>>((ColorLabel color) {
                return DropdownMenuEntry<ColorLabel>(
                  value: color,
                  label: color.label,
                  enabled: color.label != 'Grey',
                  style: MenuItemButton.styleFrom(
                    foregroundColor: color.color,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 24),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Zone',
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Garden Waste (RM1/pack)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Number of packs:'),
                ElevatedButton(
                  onPressed: _incrementGardenWastePacks,
                  child: const Text('+'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('$_gardenWastePacks'),
            const SizedBox(height: 16),
            const Text(
              'Oversized Waste (RM5/item)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Number of items:'),
                ElevatedButton(
                  onPressed: _incrementOversizedWasteItems,
                  child: const Text('+'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('$_oversizedWasteItems'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadPhotos,
              child: const Text('Upload Photos'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add code for submission here
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16),
            // Display the selected images
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _selectedImages
                  .map((image) => Image.file(image, width: 100, height: 100))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
