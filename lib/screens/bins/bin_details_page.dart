import 'package:flutter/material.dart';
import '../../models/bin_model.dart';

class BinDetailsPage extends StatelessWidget {
  final Bin bin;

  const BinDetailsPage({Key? key, required this.bin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bin Details')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem('Bin Name', bin.name),
            _buildDetailItem('Location', bin.location),
            _buildDetailItem('Fill Level', '${bin.fillLevel}%'),
            _buildDetailItem('Status', bin.status),
            _buildDetailItem('Last Updated', bin.lastUpdated.toString()),
            SizedBox(height: 30),
            LinearProgressIndicator(
              value: bin.fillLevel / 100,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                bin.fillLevel > 80
                    ? Colors.red
                    : bin.fillLevel > 50
                    ? Colors.orange
                    : Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Text('Fill Level: ${bin.fillLevel}%', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
