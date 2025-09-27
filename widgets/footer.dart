import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  // Google Maps link for NM-AIST
  final String _mapUrl =
      "https://www.google.com/maps/place/The+Nelson+Mandela+African+Institution+of+Science+and+Technology+(NM-AIST)/@-3.3998,36.79662,753m/data=!3m1!1e3!4m6!3m5!1s0x18371b6f471dbac9:0x704668ef05d49867!8m2!3d-3.399462!4d36.7967251!16s%2Fm%2F0w7q0mt!5m1!1e1?entry=ttu&g_ep=EgoyMDI1MDkyNC4wIKXMDSoASAFQAw%3D%3D";

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade900,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Smart Bin Monitoring System",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Nelson Mandela African Institution of Science and Technology (NM-AIST)",
            style: TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          const Text(
            "Address: 404 Nganana, Kikwe, Arumeru, P.O. BOX 447, Arusha, Tanzania",
            style: TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          const Text(
            "Phone: +255 27 297 0007 | Email: vc@nm-aist.ac.tz",
            style: TextStyle(color: Colors.white70, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => _launchUrl(_mapUrl),
            child: const Text(
              "📍 View on Google Maps",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "© 2025 Smart Bin Monitoring System. All rights reserved.",
            style: TextStyle(color: Colors.white54, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
