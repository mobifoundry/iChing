// PostCardView
// Author Louis Meadows
// November 4th 2012
// Developed from QML sample code located here
// https://developer.blackberry.com/cascades/documentation/ui/custom_components/custom_components_tutorial.html
// November 12th added camera code from JAM08 Introduction to the BlackBerry NDK
// Recording of session is located here 
// http://hosting.desire2learncapture.com/RIM/1/watch/30.aspx

import bb.cascades 1.0

//Now that the project is set up, let's start creating our custom component.
//  In the assets folder, double-click PostcardView.qml to open the file in the editor.
// The PostcardView component is pretty simple; 
// it consists of two ImageView controls and a Label, all within a Container.
//  One of the ImageView controls is the postcard image and the other is a static overlay that provides a border,
// a drop shadow, and a glossy finish for the postcard.

    
   // First, create a Container that uses an AbsoluteLayout as its layout. 
   // We're using AbsoluteLayout because we want to position our text directly on top of our postcard image.     
   
Container { 
        
 //  Before we can generate new postcards, we need to access some of the inner properties of PostcardView.
 // Even though PostcardView contains a TextArea with a text property and an ImageView with an image property, 
 //they are not accessible from outside the component because they are not defined at the root of PostcardView.
   
//   To expose these properties, you must define new properties at the root of the component, 
// and bind them to the inner properties that you want to expose using an alias.
//  Now, when you use the PostcardView control, you can easily access its text and image properties.    
 
        property alias image: imageView.imageSource
        property alias text: textArea.text             
        layout: AbsoluteLayout {}
          
   //Next, let's add our two images. 
   // The image that is added first is the default postcard image and the second is the overlay.
   //  Since the postcard image is added to the container first, the overlay is displayed in front of it on the screen.
   
   // Like the parent container, the postcard image needs an id property. 
   // This will be necessary when we change the image that is being displayed.
   //  The layoutProperties for the postcard image are used to offset the image 
   //so that it is displayed in the center of the overlay.      
   
   // The postcard image
   
   ImageView {
       id: imageView
      imageSource: "asset:///images/ichingcir.png"
      scaleX: 1.2
      scaleY: 1.2
       layoutProperties: AbsoluteLayoutProperties {
            positionY: 20.0
            positionX: 60.0
        }
 
    }
    // The overlay image that sits on top of the postcard image
    ImageView {
        imageSource: "asset:///images/overlay.png"
       preferredWidth: 300
          preferredHeight: 250
        visible: false
    }
    // The last part of our custom component is a TextArea that we'll use to add some text on top.
    // The TextArea needs an id property so that we can dynamically change the text that is being displayed.

    // Along with the id property, there are other properties that must be set.
    // The positioning and size of the text area are set using the layoutProperties, preferredWidth,
    // and preferredHeight properties.
    // To make our greeting stand out on our postcard, we set the textStyle to bold and white.
    // We also set the editable property to false so that the end user can't modify the text.
    // The text displayed on the postcard
    TextArea {
        id: textArea
        text: "                                 "
        preferredWidth: 200
        preferredHeight: 200
        backgroundVisible: false
        editable: false
        textStyle {
            fontWeight: FontWeight.Bold
            color: Color.create("#333333")
        }
    }
}// end of root container
