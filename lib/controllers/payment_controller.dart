import 'dart:convert';
import 'dart:developer';
import 'package:asignment/utils/app_colors.dart';
import 'package:asignment/utils/stripe_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntent;
  // DateTime? selectedtime  ;
  var selectedDate = DateTime.now().obs;
  var amountVeri = 5.obs;
  RxString paymentType = "stripe".obs;
  RxString cardNumber = ''.obs;
  RxInt cardCVCNum = 123.obs;
  RxBool apiBoolValue = false.obs;

  setAmount(int amountvalue) {
    amountVeri.value = amountvalue;
    log('amountVeri.value = ${amountVeri.value}');
  }

  setPaymentMethod(String paymentMethod) {
    paymentType.value = paymentMethod;
    log('paymentType.value = ${paymentType.value}');
  }

  setCardCVCNumber(int cvcNum) {
    cardCVCNum.value = cvcNum;
    log('cardCVCNum.value = ${cardCVCNum.value}');
  }

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.primary, // <-- SEE HERE
              onPrimary: Colors.white,
              onSurface: AppColor.primary, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: AppColor.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      log(' pickedDate  ${pickedDate}');
      log(' selectedDate.value  ${selectedDate.value}');
    }
  }

  // bool disableDate(DateTime day) {
  //   if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
  //       day.isBefore(DateTime.now().add(Duration(days: 5))))) {
  //     return true;
  //   }
  //   return false;
  // }

/*  Future<void> makePayment(
      ammountvalue,
      BuildContext context,
      ) async {
    try {
      paymentIntent = await createPaymentIntent(
        ammountvalue.toString(),
        'USD',
        context,
      );

      const billingDetails = BillingDetails(
        name: "Test User",
        email: 'email@stripe.com',
        phone: '+48888000888',
        address: Address(
          city: 'Houston',
          country: 'US',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      );
      await Stripe.instance
          .confirmSetupIntent(
        secretKey,
        const PaymentMethodParams.cardFromMethodId(
          paymentMethodData: PaymentMethodDataCardFromMethod(
            paymentMethodId: 'card',
            cvc: '123',
          ),
        ),
      )
          .then((value) {
        log('Payment Displayed');
        displayPaymentSheet(
          context,
        );
      });
    } catch (e, s) {
      log('exception:$e$s');
    }
  }*/

  // displayPaymentSheet(
  //   BuildContext context,
  // ) async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet().then((value) {
  //       log('Payment Response');
  //       log('Payment Successfull');
  //       paymentIntent = null;
  //     }).onError((error, stackTrace) {
  //       print('Error is:--->$error $stackTrace');
  //     });
  //   } on StripeException catch (e) {
  //     print('Error is:---> $e');
  //     showDialog(
  //         context: context,
  //         builder: (_) => const AlertDialog(
  //               content: Text("Cancelled "),
  //             ));
  //   } catch (e) {
  //     print('Error $e');
  //   }
  // }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(
    BuildContext context,
  ) async {
    try {
     
      Map<String, dynamic> body = {
        'amount': calculateAmount("303030"),
        "currency": "pkr",
        'payment_method_types[]': 'card'
      };

      await http
          .post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${StripeConfig.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      )
          .then((value) {
        log("log the status code ${value.statusCode}");
        log("Value===========" + jsonDecode(value.body).toString());
        // CleanerService customerService = CleanerService();
        // var dada = jsonDecode(value.body);
        // customerService.addAmountToCleanerWallet(
        //     dada['id'], calculateAmount(amountVeri.value.toString()), 'stripe');

        log("API Hit Done===========");
        apiBoolValue.value = false;
      });
    } catch (err) {
      print('Error = $err');
    }
  }

  Future<void> initPaymentSheet(
    BuildContext context,
  ) async {
    apiBoolValue.value = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      // 1. create payment intent on the server
      final paymentSheetData = await createPaymentIntent(
        context,
      );
      print("payment intent created");

      // create some billing details
      var billingDetails = BillingDetails(
        email: "uumerazeem@gmail.com.com",
        phone: "+923316615959",
        address: Address(
          city: "Lahore",
          country: "Pakistan",
          line1: "Lahore",
          line2: '',
          state: 'Punjab',
          postalCode: "",
        ),
      ); // mocked data for tests

      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              // applePay: true,
              // googlePay: true,
              style: ThemeMode.dark,
              // testEnv: true,
              // merchantCountryCode: 'US',
              merchantDisplayName: 'Test',
              // customerId: paymentSheetData['customer'],
              customerId: preferences.get("userID").toString(),
              paymentIntentClientSecret:
                  preferences.getString("stripe_user_id").toString(),
              billingDetails: billingDetails
              // paymentIntentClientSecret: paymentSheetData['client_secret'],
              // customerEphemeralKeySecret: paymentSheetData['ephemeralKey'],
              ));
      print("payment sheet created");

      await Stripe.instance.presentPaymentSheet();

      print("after payment sheet presented");
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
      rethrow;
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = amountVeri.value * 100;
    // '${amountVeri.value + ((amountVeri.value / 100) * 10) * 100}';
    // var val1 = calculatedAmout / 100;
    // log('val2 = ${val1.toString()}');
    // var val2 = val1 * 2.5;

    log('val2 = ${calculatedAmout}');
    // var val3 = calculatedAmout + val2;
    // log('val3 = ${val3.toString()}');
    return calculatedAmout.toString();
  }
}
