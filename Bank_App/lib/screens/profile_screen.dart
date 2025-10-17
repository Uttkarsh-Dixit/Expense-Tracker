import 'dart:io';
import 'package:bank_app/database_services/database_services.dart';
import 'package:bank_app/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _name;
  String? _number;
  String? _imagePath;
  final TextEditingController _nameEditController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('profile_name') ?? 'Guest User';
      _number = prefs.getString('profile_number') ?? 'N/A';
      _imagePath = prefs.getString('profile_photo');
      _nameEditController.text = _name!;
    });
  }

  void _saveNameChanges() async {
    if (_nameEditController.text.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_name', _nameEditController.text);
    setState(() {
      _name = _nameEditController.text;
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name updated successfully!'), duration: Duration(seconds: 2)),
      );
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_photo', image.path);
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  void _logoutAndWipeData() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text(
            'Logging out will clear all your transaction and profile data permanently. Are you sure you want to continue?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirm', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await DatabaseService.instance.wipeDatabase();

      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
              (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile'), backgroundColor: const Color(0xFFF4F1F7)),
      backgroundColor: const Color(0xFFF4F1F7),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                child: _imagePath == null
                    ? const Icon(Icons.person, size: 60, color: Colors.white)
                    : ClipOval(
                  child: Image.file(
                    File(_imagePath!),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Name Field (Editable)
            ListTile(
              leading: const Icon(Icons.badge),
              title: TextFormField(
                controller: _nameEditController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: _saveNameChanges,
                  ),
                ),
              ),
            ),
            const Divider(),

            // Contact Number (Non-Editable)
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Contact Number'),
              subtitle: Text(_number ?? 'Loading...'),
              trailing: const Icon(Icons.lock_outline),
            ),
            const Divider(),

            // Logout Button
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout and Reset App'),
              onTap: _logoutAndWipeData,
            ),
          ],
        ),
      ),
    );
  }
}