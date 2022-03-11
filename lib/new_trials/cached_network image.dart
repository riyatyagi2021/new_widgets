import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheNtwrkImages extends StatefulWidget {
  const CacheNtwrkImages({Key? key}) : super(key: key);

  @override
  _CacheNtwrkImagesState createState() => _CacheNtwrkImagesState();
}

class _CacheNtwrkImagesState extends State<CacheNtwrkImages> {

  final  customCacheManager=CacheManager(
    Config(
      'customcacheKey',
      stalePeriod: Duration(days: 15),
      maxNrOfCacheObjects: 5
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
          onPressed: clearCache,)
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 20,
            itemBuilder: (BuildContext context,int index){
              return Card(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: buildImage(index),
                    title: Text(
                      "Image ${index+1}"
                    ),
                  ),
                ),
              );

            }),
      ),
    );
  }

 Widget buildImage(int index) {
    return ClipRRect(
      child: CachedNetworkImage(
        cacheManager: customCacheManager,
        key: UniqueKey(),
        height: 100,
        width: 100,
        fit: BoxFit.cover,
        imageUrl: 'https://source.unsplash.com/user/c_v_r/100x100',
        placeholder: (context,url)=>Center(
            child: CircularProgressIndicator()),
        errorWidget: (context,url,error)=>Container(
          color: Colors.deepPurple,
            child: Icon(Icons.error,color: Colors.red,)),

      ),
    );
  }

  void clearCache(){
    DefaultCacheManager().emptyCache();   //cachemanger pkg

    imageCache?.clear();         //flutter sdk
    imageCache?.clearLiveImages();
    setState(() {

    });
  }
}
