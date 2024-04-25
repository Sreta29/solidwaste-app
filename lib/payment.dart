import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isPaymentCompleted = false;
  static const platform = MethodChannel('com.example.sabahpay/payment');

  // Function to simulate payment process
  void _processPayment() {
    // Assuming payment process is successful
    setState(() {
      _isPaymentCompleted = true;
    });
    // Send notification to user
    _sendNotification();
    // Send digital receipt
    _sendDigitalReceipt();
  }

  // Function to send notification
  void _sendNotification() {
    // Code to send notification to user
    print('Notification sent to user: Payment completed successfully');
  }

  // Function to send digital receipt
  void _sendDigitalReceipt() {
    // Code to send digital receipt to user
    print('Digital receipt sent to user');
  }

  Future<void> _startPayment() async {
    try {
      // Call method on platform channel to start payment
      await platform.invokeMethod('startPayment');
    } on PlatformException catch (e) {
      // Handle error
      print("Failed to start payment: '${e.message}'.");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Payment Page"),
    ),
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Payment details input fields
            const TextField(
              decoration: InputDecoration(labelText: 'Bank Account Number'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            // Button to initiate payment
            ElevatedButton(
              onPressed: () {
                // Call backend API to initiate payment
                
              },
              child: const Text('Pay with FPX'),
            ),
          ],
        ),
      ),
  );
}

  /*void initiatePayment() async {
  String bankAccountNumber = ...; // Retrieve bank account number from text field
  String amount = ...; // Retrieve amount from text field
  
  // Make POST request to backend API
  var response = await http.post(
    Uri.parse('http://your-backend-url/fpx/payment'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'bankAccountNumber': bankAccountNumber,
      'amount': amount,
    }),
  );*/

  // Handle response from backend
  /*if (response.statusCode == 200) {
    var responseData = jsonDecode(response.body);
    String paymentStatus = responseData['status'];
    // Handle payment status, show success or failure to the user
  } else {
    // Handle error response from backend
    print('Failed to initiate payment: ${response.statusCode}');
  }*/

}