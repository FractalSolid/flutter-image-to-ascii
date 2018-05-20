import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(new MaterialApp(
  title: 'Image to ASCII converter',
  home: new InputPage(),
));

class InputPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InputPageState();
}

class _FormData {
  String imageUrl = '';
}

class Img2Ascii {
  image2Ascii() {
    try {
//      PrintWriter
    } catch (Exception){
      print('You fucked up, you dense motherfucker');
    }
  }
}

class _InputPageState extends State<InputPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _FormData _formData = new _FormData();

  void _imageInputted() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Input Image'),
            ),
            body: new Image.network(_formData.imageUrl),
          );
        }
      )
    );
  }

  void submit() {
    _formKey.currentState.save(); // Save our form's current state
    convert(_formData.imageUrl);

    print('Printing the input URL.');
    print('Image URL: ${_formData.imageUrl}');
  }

  void convert(String imageUrl) {
    Image image = new Image.network(imageUrl);


    for (int i = 0; i < image.height; i++) {
      for (int j = 0; j < image.width; j++) {
        Color pixelColor = new Color(image(j, i));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image to ASCII'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.airplay), onPressed: _imageInputted),
          new IconButton(icon: new Icon(Icons.launch), onPressed: null)
        ]
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                keyboardType: TextInputType.url, // Url input type for... Urls
                decoration: new InputDecoration(
                  hintText: 'https://i.stack.imgur.com/o1z7p.jpg',
                  labelText: 'Image URL',
                ),
                onSaved: (String value) {
                  this._formData.imageUrl = value;
                },
              ),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Convert',
                    style: new TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: this.submit,
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(
                  top: 20.0
                )
              )
              //Add necessary fields here.
            ],
          ),
        )
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'Image to ASCII';
    
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Image.network('https://i.stack.imgur.com/o1z7p.jpg',),
      ),
    );
  }
}