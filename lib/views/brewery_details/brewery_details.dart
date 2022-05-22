import 'package:flutter/material.dart';
import 'package:maahey/models/brewery_model.dart';

class brewery_details extends StatefulWidget {
  BreweryModel breweryModel;

  brewery_details({
    Key? key,
    required this.breweryModel,
  }) : super(key: key);

  @override
  State<brewery_details> createState() => _brewery_detailsState(
        breweryModel: breweryModel,
      );
}

class _brewery_detailsState extends State<brewery_details> {
  BreweryModel breweryModel;
  _brewery_detailsState({required this.breweryModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brewery Details"),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("id= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("name= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("brewery_type= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("street= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("address_2= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("address_3= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("city= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("state= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("county_province= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("postal_code= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("country= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("longitude= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("latitude= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("phone= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("website_url= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("updated_at= " + breweryModel.id.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("created_at= " + breweryModel.id.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
