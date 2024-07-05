import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class TeethView extends StatefulWidget {
  @override
  _TeethViewState createState() => _TeethViewState();
}

class _TeethViewState extends State<TeethView> {
  String? predictedClass;
  bool isLoading = false;
  File? selectedImage;

  Future<void> uploadImage(ImageSource source) async {
    setState(() {
      isLoading = true;
    });

    final XFile? imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    final File file = File(imageFile.path);
    if (!file.existsSync()) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    setState(() {
      selectedImage = file;
    });

    final String apiUrl = 'https://dfumodel.onrender.com/teath';

    final uri = Uri.parse(apiUrl);
    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      file.path,
      contentType: MediaType('image', 'jpeg'),
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> responseData = jsonDecode(responseBody);

      if (responseData.containsKey('predicted_class')) {
        final String predictedClass = responseData['predicted_class'];

        setState(() {
          this.predictedClass = predictedClass;
          isLoading = false;
        });
      } else {
        setState(() {
          predictedClass = "Unknown";
          isLoading = false;
        });
      }
    } else {
      setState(() {
        predictedClass = null;
        isLoading = false;
      });
    }
  }

  void showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Picture'),
                onTap: () {
                  Navigator.of(context).pop();
                  uploadImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Upload from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  uploadImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'Assets/Images/teeth2.jpg', 
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('Assets/Images/teeth1.jpg'), 
              ),
              const SizedBox(height: 24),
              const Text(
                'Check Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: isLoading ? null : showImagePickerDialog,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(75),
                    border: Border.all(color: Colors.blueAccent, width: 3),
                  ),
                  child: selectedImage != null
                      ? ClipOval(
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Center(
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.blueAccent,
                            size: 50,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed:
                    isLoading ? null : () => uploadImage(ImageSource.gallery),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Upload Image',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              if (isLoading)
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: CircularProgressIndicator(),
                ),
              if (predictedClass != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Diagnosis:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$predictedClass',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 16),
                    if(predictedClass=="Caries")
                    const Padding(
padding: EdgeInsets.only(left: 15,right: 10),                      child: Text("Caries (Dental caries) is tooth decay caused by bacterial infection resulting in demineralization of the tooth enamel and dentin.",style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),),
                    )
                    else if(predictedClass=="Gingivitis")
                    const Padding(
padding: EdgeInsets.only(left: 15,right: 10),                      child: Text("Gingivitis is inflammation of the gums caused by bacterial plaque buildup, characterized by redness, swelling, and bleeding gums.",style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),),
                    )
                    else if(predictedClass=="Hypodontia")
                    const Padding(
padding: EdgeInsets.only(left: 15,right: 10),                      child: Text("Hypodontia is a congenital condition characterized by the absence of one or more teeth.",style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),),
                    )
                    else if(predictedClass=="Mouth Ulcer")
                    const Padding(
                      padding: EdgeInsets.only(left: 15,right: 10),
                      child: Text("Mouth Ulcer (Aphthous ulcer) is a painful sore or lesion that appears on the mucous membrane inside the mouth.",style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),),
                    )
                    else 
                    const Padding(
padding: EdgeInsets.only(left: 15,right: 10),                      child: Text("Tooth Discoloration (Tooth discoloration augmented) refers to changes in the color of the tooth, often caused by staining, aging, or certain medications.",style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),),
                    )

                    ],
                  ),
                ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
