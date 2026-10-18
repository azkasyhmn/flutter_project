import 'package:flutter/material.dart';

enum Gender { lakiLaki, perempuan }

class BMIScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  Gender _gender = Gender.lakiLaki;

  double? _hasilBMI;

  String _keterangan = 'Keterangan muncul disini';

  final Map<Gender, List<double>> _batasBMI = {
    Gender.lakiLaki: [18.5, 25, 30],
    Gender.perempuan: [18.5, 25, 30],
  };

  Color get _warnaHasil {
    switch (_keterangan) {
      case 'Kurus':
        return Colors.orange;
      case 'Ideal':
        return Colors.green;
      case 'Gemuk':
        return Colors.deepOrange;
      case 'Obesitas':
        return Colors.red;
      default: 
        return Colors.grey;
    }
  }

  String _getKeterangan(double bmi) {
    final batas = _batasBMI[_gender]!;

    if (bmi < batas[0]) {
      return 'Kurus';
    } else if (bmi < batas[1]) {
      return 'Ideal';
    } else if (bmi < batas[2]) {
      return 'Gemuk';
    } else {
      return 'Obesitas';
    }
  }

  void _logikaBMI() {
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbInCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if (bb > 0 && tbInCm > 0) {
        final double tbInM = tbInCm / 100;
        final double bmi = bb / (tbInM * tbInM);

        _hasilBMI = bmi;
        _keterangan = _getKeterangan(bmi);
      } else {
        _hasilBMI = null;
        _keterangan = 'Masukkan data yang valid!';
      }
    });
  }

  void _resetBMI() {
    _bbController.clear();
    _tbController.clear();

    setState(() {
      _gender = Gender.lakiLaki;
      _hasilBMI = null;
      _keterangan = 'Keterangan muncul disini';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator BMI', 
        style: TextStyle(color: Colors.white, fontWeight: .bold)),
        leading: Icon(Icons.calculate, color: Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                Text(
                  'Hasil BMI :',
                  textAlign: .center,
                  style: TextStyle(fontWeight: .bold, fontSize: 22, color: Colors.indigo),
                ),
                SizedBox(height: 16),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: _warnaHasil, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: _warnaHasil.withValues(alpha: 0.2),
                        blurRadius: 16,
                        offset: Offset(0, 6),
                      ),
                    ]
                  ),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          _hasilBMI?.toStringAsFixed(1) ?? '-',
                          style: TextStyle(fontSize: 56, fontWeight: .bold, color: _warnaHasil),
                        ),
                        SizedBox(height: 12),
                        Text(
                          _keterangan,
                          textAlign: .center,
                          style: TextStyle(
                            fontWeight: .bold,
                            color: _warnaHasil,
                          ),
                        ),
                      ],
                    ),
                ),

                SizedBox(height: 32),
                Text('Masukkan data anda: ', textAlign: .center),
                SizedBox(height: 16),

                SegmentedButton<Gender>(
                  segments: const [
                    ButtonSegment(
                      value: Gender.lakiLaki,
                      label: Text('Laki Laki'),
                      icon: Icon(Icons.male),
                    ),
                    ButtonSegment(
                      value: Gender.perempuan,
                      label: Text('Perempuan'),
                      icon: Icon(Icons.female),
                    ),
                  ],
                  selected: {_gender},
                  onSelectionChanged: (Set<Gender> pilihan) {
                    setState(() {
                      _gender = pilihan.first;
                    });
                  },
                ),
                SizedBox(height: 20),

                TextField(
                  controller: _bbController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Berat Badan (Kg)',
                    prefixIcon: Icon(
                      Icons.monitor_weight_rounded,
                      color: Colors.indigo,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                TextField(
                  controller: _tbController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Tinggi Badan (Cm)',
                    prefixIcon: Icon(
                      Icons.height,
                      color: Colors.indigo,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _resetBMI,
                        icon: Icon(Icons.refresh, color: Colors.red), 
                        label: Text(
                          'Reset',
                          style: TextStyle(color: Colors.red),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),

                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _logikaBMI,
                        icon: Icon(Icons.calculate, color: Colors.white),
                        label: Text(
                          'Hitung BMI',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
