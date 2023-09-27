import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../dashboard/Dashboard.dart';

class InteresSimple extends StatefulWidget {
  static String routeName = "/interes_simple";

  @override
  _InteresSimpleState createState() => _InteresSimpleState();
}

class _InteresSimpleState extends State<InteresSimple> {
  TextEditingController _capitalController = TextEditingController();
  TextEditingController _tasaController = TextEditingController();
  TextEditingController _mesesController = TextEditingController();
  TextEditingController _aniosController = TextEditingController();
  TextEditingController _diasController = TextEditingController();
  TextEditingController _interesesController = TextEditingController();
  TextEditingController _montoController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  bool _calculateByDates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Get.offAll(() => const Dashboard());
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 32,
                )),
            const SizedBox(height: 10),
            TextField(
              controller: _capitalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Capital'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _tasaController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Tasa de interés (%)'),
            ),
            const SizedBox(height: 10),
            _calculateByDates
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          _startDate = await _selectDate();
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _startDate != null
                                  ? DateFormat('dd/MM/yyyy').format(_startDate!)
                                  : 'Seleccionar Fecha Inicial',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          _endDate = await _selectDate();
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _endDate != null
                                  ? DateFormat('dd/MM/yyyy').format(_endDate!)
                                  : 'Seleccionar Fecha Final',
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: TextField(
                          controller: _aniosController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Años'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          controller: _mesesController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Meses'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          controller: _diasController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Días'),
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: _calculateByDates,
                  onChanged: (value) {
                    setState(() {
                      _calculateByDates = value!;
                      _mesesController.clear();
                      _aniosController.clear();
                      _diasController.clear();
                    });
                  },
                ),
                const Text('Calcular por fechas'),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _interesesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Intereses'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Monto'),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _calcular,
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 33, 143, 21),
                  ),
                  icon: const Icon(Icons.calculate),
                  label: const Text('Calcular', style: TextStyle(fontSize: 18)),
                ),
                ElevatedButton.icon(
                  onPressed: _limpiarCampos,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  icon: const Icon(Icons.clear),
                  label: const Text('Limpiar', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate() async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
  }

  void _calculardiaconfechas() {
    if (_calculateByDates) {
      if (_startDate != null && _endDate != null) {
        Duration difference = _endDate!.difference(_startDate!);
        int totalDays = difference.inDays;

        _aniosController.text = (totalDays ~/ 365).toString();
        _mesesController.text = ((totalDays % 365) ~/ 30).toString();
        _diasController.text = (totalDays % 30).toString();
      }
    }
  }

  void _calcularSinMonto() {
    if (_aniosController.text.isEmpty &&
        _mesesController.text.isEmpty &&
        _diasController.text.isEmpty) {
      _calcularTiempo1();
    } else if (_capitalController.text.isEmpty) {
      _calcularCapital1();
    } else if (_tasaController.text.isEmpty) {
      _calcularTasa1();
    } else if (_interesesController.text.isEmpty) {
      _calcularIntereses();
    } else if (_aniosController.text.isEmpty &&
        _mesesController.text.isEmpty &&
        _diasController.text.isEmpty) {
      _calcularTiempo1();
    }
    _calcularMonto();
  }

  void _calcularConMonto() {
    if (_aniosController.text.isEmpty &&
        _mesesController.text.isEmpty &&
        _diasController.text.isEmpty) {
      _calcularTiempo2();
    } else if (_capitalController.text.isEmpty) {
      _calcularCapital2();
    } else if (_tasaController.text.isEmpty) {
      _calcularTasa2();
    } else if (_interesesController.text.isEmpty) {
      _calcularInteresesconMonto();
    } else if (_aniosController.text.isEmpty &&
        _mesesController.text.isEmpty &&
        _diasController.text.isEmpty) {
      _calcularTiempo2();
    }
  }

  void _calcular() {
    _calculardiaconfechas();
    if (_montoController.text.isEmpty) {
      _calcularSinMonto();
    } else {
      _calcularConMonto();
    }
  }

  void _calcularCapital1() {
    double tasa = double.tryParse(_tasaController.text) ?? 0;
    int anios = int.tryParse(_aniosController.text) ?? 0;
    int meses = int.tryParse(_mesesController.text) ?? 0;
    int dias = int.tryParse(_diasController.text) ?? 0;
    int totalDias = (anios * 365) + (meses * 30) + dias;
    double interesSimple = double.tryParse(_interesesController.text) ?? 0;
    double resultCapital = (interesSimple * 36500) / (tasa * totalDias);
    _capitalController.text = resultCapital.toStringAsFixed(2);
  }

  void _calcularTasa1() {
    double capital = double.tryParse(_capitalController.text) ?? 0;
    int anios = int.tryParse(_aniosController.text) ?? 0;
    int meses = int.tryParse(_mesesController.text) ?? 0;
    int dias = int.tryParse(_diasController.text) ?? 0;
    int totalDias = (anios * 365) + (meses * 30) + dias;
    double interesSimple = double.tryParse(_interesesController.text) ?? 0;
    double resultTasa = (interesSimple * 36500) / (capital * totalDias);
    _tasaController.text = resultTasa.toStringAsFixed(2);
  }

  void _calcularMonto() {
    double capital = double.tryParse(_capitalController.text) ?? 0;
    double tasa = double.tryParse(_tasaController.text) ?? 0;
    int anios = int.tryParse(_aniosController.text) ?? 0;
    int meses = int.tryParse(_mesesController.text) ?? 0;
    int dias = int.tryParse(_diasController.text) ?? 0;
    int totalDias = (anios * 365) + (meses * 30) + dias;
    double monto = ((capital) * (1 + ((tasa / 100) * (totalDias / 365))));
    _montoController.text = monto.toStringAsFixed(2);
  }

  void _calcularIntereses() {
    double capital = double.tryParse(_capitalController.text) ?? 0;
    double tasa = double.tryParse(_tasaController.text) ?? 0;
    int anios = int.tryParse(_aniosController.text) ?? 0;
    int meses = int.tryParse(_mesesController.text) ?? 0;
    int dias = int.tryParse(_diasController.text) ?? 0;
    int totalDias = (anios * 365) + (meses * 30) + dias;
    double interesSimple = (capital * tasa * totalDias) / 36500;
    _interesesController.text = interesSimple.toStringAsFixed(2);
  }

  void _calcularTiempo1() {
    double capital = double.tryParse(_capitalController.text) ?? 0;
    double tasa = double.tryParse(_tasaController.text) ?? 0;
    double interesSimple = double.tryParse(_interesesController.text) ?? 0;

    double tiempoEnDias = (interesSimple * 36500) / (capital * tasa);
    int anios = (tiempoEnDias / 365).floor();
    int meses = ((tiempoEnDias - (anios * 365)) / 30).floor();
    int dias = (tiempoEnDias - (anios * 365) - (meses * 30)).floor();

    _aniosController.text = anios.toString();
    _mesesController.text = meses.toString();
    _diasController.text = dias.toString();
  }

  void _calcularCapital2() {
    double monto = double.tryParse(_montoController.text) ?? 0;
    double tasa = double.tryParse(_tasaController.text) ?? 0;
    int anios = int.tryParse(_aniosController.text) ?? 0;
    int meses = int.tryParse(_mesesController.text) ?? 0;
    int dias = int.tryParse(_diasController.text) ?? 0;
    int totalDias = (anios * 365) + (meses * 30) + dias;
    double capital = monto / (1 + (tasa * totalDias / 36500));
    _capitalController.text = capital.toStringAsFixed(2);
    _calcularInteresesconMonto();
  }

  void _calcularTasa2() {
    _calcularInteresesconMonto();
    _calcularTasa1();
  }

  void _calcularTiempo2() {
    _calcularInteresesconMonto();
    _calcularTiempo1();
  }

  _calcularInteresesconMonto() {
    double capital = double.tryParse(_capitalController.text) ?? 0;
    double monto = double.tryParse(_montoController.text) ?? 0;
    double interesSimple = (monto) - (capital);
    _interesesController.text = interesSimple.toStringAsFixed(2);
  }

  void _limpiarCampos() {
    _capitalController.clear();
    _tasaController.clear();
    _mesesController.clear();
    _aniosController.clear();
    _diasController.clear();
    _interesesController.clear();
    _montoController.clear();
    _startDate = null;
    _endDate = null;
    _calculateByDates = false;
    setState(() {});
  }
}
