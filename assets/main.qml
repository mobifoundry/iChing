// PostCarder
// Author Louis Meadows
// November 4th 2012
// Developed from QML sample code located here
// https://developer.blackberry.com/cascades/documentation/ui/custom_components/custom_components_tutorial.html
// root qml document 
// November 12th added camera code from JAM08 Introduction to the BlackBerry NDK
// Recording of session is located here 
// http://hosting.desire2learncapture.com/RIM/1/watch/30.aspx
import bb.cascades 1.0

// creates one page with a label
Page {
    
Container {
        id: greetingPhrase    
        background: Color.create("#262626");
        leftPadding: 50
        rightPadding: 50
        topPadding: 250
                               
        // The custom component
        layout: StackLayout {
        }
        TrigramView {
            id: trigram
        leftPadding: 50
                rightPadding: 50
                topPadding: 250    
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
Container {
               leftPadding: 50
                  rightPadding: 50
                  topPadding: 250     
            horizontalAlignment: HorizontalAlignment.Center
             verticalAlignment: VerticalAlignment.Center                  
        // The button used to generate a new trigram
        Button {
            text: " Generate Trigram "
             onClicked: {
                //                greetingPhrase.text = "                        ";
                createTrigram(); // Invoke createTrigram() when the button is clicked
            }
        }        // end button
    } // end Container of button 
    }

    // Generates a new Trigram
    function createTrigram() {
        // Choose a random of 8 Trigrams, get random between 1 and 8.
        var r = Math.ceil(Math.random() * 8)
        switch (r) {
            case 1:
                // Set trigram image and message to Bound - Ken.
                trigram.text = "                Bound - Ken!"
                trigram.image = "asset:///images/bound_ken.png"
                break
            case 2:
                // Set trigram image and message to Field - K'un.
                trigram.text = "                 Field - K'un!"
          trigram.image = "asset:///images/field_kun.png"
          break
      case 3:
          // Set image and message to Force - Ch'ien.
          trigram.text = "                 Force - Ch'ien!"
          trigram.image = "asset:///images/force_chien.png"
          break
      case 4:
          //Set image and message to Gorge - K'an.
          trigram.text = "                Gorge - K'an!"
          trigram.image = "asset:///images/gorge_kan.png"
          break
     case 5:
          //Set image and message to Ground - Sun.
          trigram.text = "                Ground - Sun!"
          trigram.image = "asset:///images/ground_sun.png"
          break          
     case 6:
          //Set image and message to Open - Tui.
          trigram.text = "                Open - Tui!"
          trigram.image = "asset:///images/open_tui.png"
          break   
      case 7:
           //Set image and message to Gorge - K'an.
           trigram.text = "                Radiance - Li!"
           trigram.image = "asset:///images/radience_li.png"
           break    
     case 8:
          //Set image and message to Shake - Chen.
          trigram.text = "               Shake - Chen!"
          trigram.image = "asset:///images/shake_chien.png"
          break                       
      default:
          // Use the fallback image
          trigram.text = greetingPhrase.text
          trigram.image = "asset:///images/ichingcir.png"
  } // Ends the switch statement       
    // Rotate the whole component to a random number between 
    // -10 and 10 degrees.
    trigram.rotationZ = (Math.random () * 20) - 10
     
    // Scale the whole component to a random number between 
    // 0.7 and 1.2
    var s = Math.random () * 0.5 + 0.7
    trigram.scaleX = s
    trigram.scaleY = s
} // Ends the createTrigram() function
 
} // end of page
