import 'package:firstapp/models/facility.dart';
import 'package:flutter/material.dart';

class FacilityProvider extends ChangeNotifier {
  List<Facility> fasilityList = [];



    void initFacility(){
      fasilityList.add(Facility(image: "path", title: "the trining hall", subTitle: "office type", availability: true));
      fasilityList.add(Facility(image: "path", title: "the trining hall", subTitle: "office type", availability: false));
      fasilityList.add(Facility(image: "path", title: "the trining hall", subTitle: "office type", availability: true));
      fasilityList.add(Facility(image: "path", title: "the trining hall", subTitle: "office type", availability: false));
    
    notifyListeners();
    }

  
}