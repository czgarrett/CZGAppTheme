CZGAppTheme
===========

Library for managing UIAppearance customization in iOS.  Includes Adobe Illustrator template for creating custom UI elements.

How to use the Illustrator file:

I use the Illustrator Artboards feature to create UI graphical elements.  This makes it really easy to create perfectly sized images without slicing.  If you're not familiar with AI's Artboards feature, take a moment to find a quick tutorial on the web about it.

After editing elements in Illustrator:

Go to File -> Export.  Be sure to check the "Use Artboards" checkbox on the lower left.  Otherwise use defaults for everything.

Your files will be automatically named to just what you need to use the Theme class.  The Artboards feature prepends all of the PNG files with the name of the AI file, which will in turn be the name of your theme.

You can edit the Theme plist file if you need to edit image insets and so forth, but most of the time you can just use it as is.  There are also color settings in there.

To use the code:

Add the classes to your project and import them in your Application Delegate.

Where your app launches, just call:

[CZGTheme use: @"Default"];

