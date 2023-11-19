import 'package:flutter/material.dart';

import 'button_values.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String operand = '';

  String num1Dec = '';
  String num2Dec = '';
  String num1Bin = '';
  String num2Bin = '';
  String num1Hex = '';
  String num2Hex = '';

  String base = 'DEC';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // output
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: base == 'DEC'
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange)
                          : ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                      onPressed: () {
                        setState(() {
                          base = 'DEC';
                        });
                      },
                      child: const Text('DEC'),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '$num1Dec$operand$num2Dec'.isEmpty
                              ? '0'
                              : '$num1Dec$operand$num2Dec',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: base == 'BIN'
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange)
                          : ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                      onPressed: () {
                        setState(() {
                          base = 'BIN';
                        });
                      },
                      child: const Text('BIN'),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '$num1Bin$operand$num2Bin'.isEmpty
                                  ? '0'
                                  : '$num1Bin$operand$num2Bin',
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: base == 'HEX'
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange)
                          : ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                      onPressed: () {
                        setState(() {
                          base = 'HEX';
                        });
                      },
                      child: const Text('HEX'),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '$num1Hex$operand$num2Hex'.isEmpty
                              ? '0'
                              : '$num1Hex$operand$num2Hex',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              children: base == 'HEX'
                  ? Btn.hexaDecimalBtn
                      .map(
                        (value) => SizedBox(
                          width: screenSize.width / 6,
                          height: screenSize.width / 6,
                          child: buildButton(value),
                        ),
                      )
                      .toList()
                  : [],
            ),

            Wrap(
              children: base == 'BIN'
                  ? Btn.availableBinBtn
                      .map(
                        (value) => SizedBox(
                          width: value == Btn.calc
                              ? screenSize.width
                              : screenSize.width / 3,
                          height: screenSize.width / 5,
                          child: buildButton(value),
                        ),
                      )
                      .toList()
                  : Btn.buttonValues
                      .map(
                        (value) => SizedBox(
                          width: value == Btn.calc
                              ? screenSize.width / 1.67
                              : screenSize.width / 5,
                          height: screenSize.width / 5,
                          child: buildButton(value),
                        ),
                      )
                      .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
        color: [Btn.del, Btn.clr].contains(value)
            ? Colors.blueGrey
            : [Btn.divide, Btn.multiply, Btn.add, Btn.subtract].contains(value)
                ? Colors.orange
                : Colors.black87,
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }

  // ##############
  // delete one from the end
  void delete() {
    if (num2Dec.isNotEmpty) {
      // 12323 => 1232
      num2Dec = num2Dec.substring(0, num2Dec.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (num1Dec.isNotEmpty) {
      num1Dec = num1Dec.substring(0, num1Dec.length - 1);
    }

    if (num2Bin.isNotEmpty) {
      // 12323 => 1232
      num2Bin = num2Bin.substring(0, num2Bin.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (num1Bin.isNotEmpty) {
      num1Bin = num1Bin.substring(0, num1Bin.length - 1);
    }

    if (num2Hex.isNotEmpty) {
      // 12323 => 1232
      num2Hex = num2Hex.substring(0, num2Hex.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (num1Hex.isNotEmpty) {
      num1Hex = num1Hex.substring(0, num1Hex.length - 1);
    }

    setState(() {});
  }

  // ########
  void onBtnTap(String value) {
    if (base == 'BIN' && !Btn.availableBinBtn.contains(value)) {
      return;
    }

    if (value == Btn.del) {
      delete();
      return;
    }

    if (value == Btn.clr) {
      clearAll();
      return;
    }

    if (value == Btn.calc) {
      calculate();
      return;
    }

    appendValue(value);
  }

  // ##############
  // clears all output
  void clearAll() {
    setState(() {
      operand = "";

      num1Dec = '';
      num2Dec = '';
      num1Bin = '';
      num2Bin = '';
      num1Hex = '';
      num2Hex = '';
    });
  }

  // calculates the result
  void calculate() {
    if (num1Dec.isEmpty) return;
    if (operand.isEmpty) return;
    if (num2Dec.isEmpty) return;

    final double num1 = double.parse(num1Dec);
    final double num2 = double.parse(num2Dec);

    var result = 0.0;
    switch (operand) {
      case Btn.add:
        result = num1 + num2;
        break;
      case Btn.subtract:
        result = num1 - num2;
        break;
      case Btn.multiply:
        result = num1 * num2;
        break;
      case Btn.divide:
        result = num1 / num2;
        break;
      default:
    }

    setState(() {
      num1Dec = result.toStringAsPrecision(3);

      if (num1Dec.endsWith(".0")) {
        num1Dec = num1Dec.substring(0, num1Dec.length - 2);
      }

      operand = "";
      num2Dec = "";
    });
  }

  // #############
  // appends value to the end
  void appendValue(String value) {
    var baseNum1 = '';
    var baseNum2 = '';
    // check which num should be modified
    switch (base) {
      case 'DEC':
        {
          baseNum1 = num1Dec;
          baseNum2 = num2Dec;
        }
        break;

      case 'BIN':
        {
          baseNum1 = num1Bin;
          baseNum2 = num2Bin;
        }
        break;

      case 'HEX':
        {
          baseNum1 = num1Hex;
          baseNum2 = num2Hex;
        }
        break;
    }

    // if is operand and not "."
    if (value != Btn.dot && int.tryParse(value) == null) {
      // operand pressed
      if (operand.isNotEmpty && baseNum2.isNotEmpty) {
        calculate();
      }
      operand = value;
    } else if (baseNum1.isEmpty || operand.isEmpty) {
      // check if value is "." | ex: number1 = "1.2"
      if (value == Btn.dot && baseNum1.contains(Btn.dot)) return;
      if (value == Btn.dot && (baseNum1.isEmpty || baseNum1 == Btn.n0)) {
        value = "0.";
      }

      if (base == 'DEC') {
        num1Dec += value;
        num1Bin = int.parse(num1Dec).toRadixString(2).toString();
        num1Hex = int.parse(num1Dec).toRadixString(16).toString();
      } else if (base == 'BIN') {
        num1Bin += value;
        num1Dec = int.parse(num1Bin, radix: 2).toString();
        num1Hex = int.parse(num1Dec).toRadixString(16).toString();
      } else {
        num1Hex += value;
        num1Dec = int.parse(num1Hex, radix: 16).toString();
        num1Bin = int.parse(num1Dec).toRadixString(2).toString();
      }
    }
    // assign value to number2 variable
    else if (baseNum2.isEmpty || operand.isNotEmpty) {
      // check if value is "." | ex: number1 = "1.2"
      if (value == Btn.dot && baseNum2.contains(Btn.dot)) return;
      if (value == Btn.dot && (baseNum2.isEmpty || baseNum2 == Btn.n0)) {
        value = "0.";
      }
      if (base == 'DEC') {
        num2Dec += value;
        num2Bin = int.parse(num2Dec).toRadixString(2).toString();
        num2Hex = int.parse(num2Dec).toRadixString(16).toString();
      }
    }

    setState(() {});
  }
}
