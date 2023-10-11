import 'dart:io';

void main() {
  //create temperature input from farenheit and convert to celcius
  // print("Input temperature in farenheit: ");
  // num farenheit = num.parse(stdin.readLineSync()!);
  // var celcius = (farenheit - 32) * 5 / 9;
  // print("Temperature in celcius: ${celcius.toStringAsFixed(2)} \u2103");

  //create temperature input from farenheit and convert to celcius, kelvin, and reamur give 2 decimal places
  stdout.write("Input temperature in farenheit: ");
  num farenheit = num.parse(stdin.readLineSync()!);
  var celcius = (farenheit - 32) * 5 / 9;
  var kelvin = celcius + 273.15;
  var reamur = celcius * 4 / 5;
  print("Temperature in celcius: ${celcius.toStringAsFixed(2)} \u2103");
  print("Temperature in kelvin: ${kelvin.toStringAsFixed(2)} \u212A");
  print("Temperature in reamur: ${reamur.toStringAsFixed(2)} \u00B0R");
}
