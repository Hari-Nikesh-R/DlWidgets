# DlWidgets

DlWidgets is a Flutter library that aims to simplify the development process by providing a collection of useful and customizable widgets.

## Features

- **Design Widgets:** Reduced time in developing password text field and normal text field. All the Widgets are pre-built developed.
- 
## Installation

To use DlWidgets in your Flutter project, you need to add it as a dependency in your `pubspec.yaml` file:

yaml
dependencies:
  dl_widgets: ^1.0.0

Then, run the following command to fetch the package:

$ flutter pub get

## Usage
Import the DlWidgets package into your Dart file:

import 'package:dl_widgets/dl_widgets.dart';

Now, you can start using the DlWidgets library. Here's an example of how to use one of the widgets:

DlButton(buttonName: "BUTTON TEXT", 
    size: ButtonSize.small,
    onPressed: (){ },
    buttonColor:  #COLOR OF THE BUTTON
),

For more detailed information on how to use each widget, refer to the API documentation.

## Contributing
Contributions to DlWidgets are welcome! If you find a bug or have a feature suggestion, please open an issue on the GitHub repository.

## License
This library is available under the MIT License.
