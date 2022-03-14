import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class DownloadReadFiles extends StatefulWidget {
  const DownloadReadFiles({Key? key}) : super(key: key);

  @override
  _DownloadReadFilesState createState() => _DownloadReadFilesState();
}

class _DownloadReadFilesState extends State<DownloadReadFiles> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           ElevatedButton(
                child: Text("Download and Open"),
               onPressed: ()=> openFile(
                 url:'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
                 fileName:'ElephantsDream.mp4',
               )
               ),
         ],
       ) ,
      ),
    );
  }

 Future openFile({String? url,String? fileName}) async{

    print(fileName);

  final file=  await downloadFile(url!,fileName);
   // if(file==null) return;

    final image=await pickFilee();
  if(image==null) return;
  // File('image.files.first.path');

   OpenFile.open(image.path);
  }

  //download file into private folder not visible to userss
   Future<File?> downloadFile(String url, String? name) async{
    final appStorage=await getApplicationDocumentsDirectory();
    //final file=File('${appStorage.path}/$name');
/*
        try{
      final res = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              receiveTimeout: 0,
              followRedirects: false));
      final raf=file.openSync(mode:FileMode.write);
     raf.writeFromSync(res.data);
     return file;
    } catch(e){
          return null;
        }*/
  }

   Future<File?> pickFilee() async{
   FilePickerResult? pickedFile=await FilePicker.platform.pickFiles();

   print("${pickedFile}       nameee");

    if(pickedFile==null) return null;
    File file=File(pickedFile.files.first.path.toString());
   return file;



    //// multiple filessss
    /*FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      //List<File> files = result.paths.map((path) => File(path)).toList();
    } else {
      // User canceled the picker
    }*/
  }
}
