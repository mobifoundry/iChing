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
import "hexagrams.js" as Hexagram 

// creates one page with a label
Page {
    id: iChing
    titleBar: TitleBar {
        id: titlebarlabel
        title: "iChing  "
        visibility: ChromeVisibility.Visible

        kind: TitleBarKind.Default
        dismissAction: ActionItem {
            id: logo
          
            imageSource: "asset:///images/default.png"
        }
    }
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
        }
    }
    Container {
        id: greetingPhrase
        background: Color.create("#EE0000")
        
        leftPadding: 50
        rightPadding: 50
        topPadding: 150

        // The custom component
        layout: StackLayout {
        }
        topMargin: 1.0
        bottomMargin: 1.0
        layoutProperties: StackLayoutProperties {
        }
        scaleX: 1.0
        Label {
            id: hexagram
            text: ""
            visible: true
            textStyle.fontSizeValue: 8.0
            textStyle.color: Color.Blue
            multiline: true
        }
        Label {
            id: uppertrigramlabel
            text: "Upper Trigram"
            textStyle.color: Color.Blue
            textStyle.fontWeight: FontWeight.W900
            textStyle.fontSizeValue: 8.0
            visible: false
        }
        Label {
            textStyle.fontSizeValue: 1.0
        }
        TrigramView {
            id: uppertrigram
            leftPadding: 0
            rightPadding: 0
            topPadding: 1.0
            bottomPadding: 1.0
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            visible: true
            opacity: 0.9
            scaleX: 1.0
        }
        Label {
            id: lowertrigramlabel
            text: "Lower Trigram"
            textStyle.fontSizeValue: 8.0
            textStyle.color: Color.Blue
            textStyle.fontWeight: FontWeight.W900
            visible: false
        }
        Label {
            textStyle.fontStyle: FontStyle.Normal
            textStyle.fontSizeValue: 1.0
        }
        TrigramView {
            id: lowertrigram
            leftPadding: 0
            rightPadding: 0
            topPadding: 1.0
            bottomPadding: 0
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            visible: false
            opacity: 0.9
        }
        Container {
            leftPadding: 50
            rightPadding: 50
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            // The button used to generate a new trigram
            Button {
                id: castbutton
                text: "Concentrate then press to Cast"
                onClicked: {
                    //                greetingPhrase.text = "                        ";
                    createTrigram(); // Invoke createTrigram() when the button is clicked
                }
            }
            ImageButton {
                id: backbutton
                defaultImageSource: "asset:///images/back.png"
                pressedImageSource: "asset:///images/btn_home.png "
                visible: false
                onClicked: {
                    castbutton.visible = true;
                    backbutton.visible = false;
                    lowertrigram.visible = false;
                    lowertrigramlabel.visible = false;
                    uppertrigramlabel.visible = false;
                    uppertrigram.image = "asset:///images/ichingcir.png";
                    hexagram.text = "";
                }
            }
            // end button
        }

        // end Container of button
    }

    // Generates a new Trigram
    function createTrigram() {
        castbutton.visible = false;
        lowertrigram.visible = true;
        lowertrigramlabel.visible = true;
        uppertrigramlabel.visible = true;
        backbutton.visible = true;
        // Choose a random of 8 Trigrams, get random between 1 and 8.
        var ut = Math.ceil(Math.random() * 8)
        switch (ut) {
            case 1:
                // Set trigram image and message to Bound - Ken.
                uppertrigramlabel.text = "                Bound - Ken!"
                uppertrigram.image = "asset:///images/bound_ken.png"
                break
            case 2:
                // Set trigram image and message to Field - K'un.
                uppertrigramlabel.text = "                 Field - K'un!"
                uppertrigram.image = "asset:///images/field_kun.png"
                break
            case 3:
                // Set image and message to Force - Ch'ien.
                uppertrigramlabel.text = "                 Force - Ch'ien!"
                uppertrigram.image = "asset:///images/force_chien.png"
                break
            case 4:
                //Set image and message to Gorge - K'an.
                uppertrigramlabel.text = "                Gorge - K'an!"
                uppertrigram.image = "asset:///images/gorge_kan.png"
                break
            case 5:
                //Set image and message to Ground - Sun.
                uppertrigramlabel.text = "                Ground - Sun!"
                uppertrigram.image = "asset:///images/ground_sun.png"
                break
            case 6:
                //Set image and message to Open - Tui.
                uppertrigramlabel.text = "                Open - Tui!"
                uppertrigram.image = "asset:///images/open_tui.png"
                break
            case 7:
                //Set image and message to Gorge - K'an.
                uppertrigramlabel.text = "                Radiance - Li!"
                uppertrigram.image = "asset:///images/radience_li.png"
                break
            case 8:
                //Set image and message to Shake - Chen.
                uppertrigramlabel.text = "               Shake - Chen!"
                uppertrigram.image = "asset:///images/shake_chien.png"
                break
            default:
                // Use the fallback image
                uppertrigram.text = greetingPhrase.text
                uppertrigram.image = "asset:///images/ichingcir.png"
        } // Ends the switch statement
        var lt = Math.ceil(Math.random() * 8)
        switch (lt) {
            case 1:
                // Set trigram image and message to Bound - Ken.
                lowertrigramlabel.text = "                Bound - Ken!"
                //  ************
                //  *****  *****
                //  *****  *****
                lowertrigram.image = "asset:///images/bound_ken.png"
                switch (ut) {
                    case 1: hexagram.kan();    // hexagram 1
                    break;
                    case 2: hexagram.khien();  // hexagram 34
                    break;
                    case 3: hexagram.thun();   // hexagram 5
                    break;  
                    case 4: Hexagram.hsiaokwo(); // hexagram 26
                    break;                   
                    case 5: Hexagram.kien();    // hexagram 11 
                    break;  
                    case 6: Hexagram.hsiao(); // hexagram 09
                    break;
                    case 7: Hexagram.gpta(); // Hexagram 14 
                    break;  
                    case 8: Hexagram.kuai(); // Hexagram 43
                    break;                                                               
                    default:
                    } // end switch statement 
                break
            case 2:
                // Set trigram image and message to Field - K'un.
                lowertrigramlabel.text = "                 Field - K'un!"
                lowertrigram.image = "asset:///images/field_kun.png"
           switch (ut) {
                    case 1: Hexagram.wu();    // hexagram 25
                    break;
                    case 2: Hexagram.chen();  // hexagram 51
                    break;
                    case 3: Hexagram.chun();   // hexagram 3
                    break;  
                    case 4: Hexagram.yi(); // hexagram 27
                    break;                   
                    case 5: Hexagram.fu();    // hexagram 24 
                    break;  
                    case 6: Hexagram.hsiao(); // hexagram 42
                    break;
                    case 7: Hexagram.shih(); // Hexagram 21 
                    break;  
                    case 8: Hexagram.sui(); // Hexagram 17
                    break;                                                               
                    default:
                    } // end switch statement                 
                break
            case 3:
                // Set image and message to Force - Ch'ien.
                lowertrigramlabel.text = "                 Force - Ch'ien!"
                lowertrigram.image = "asset:///images/force_chien.png"
            switch (ut) {
                     case 1: Hexagram.sung();    // hexagram 6
                     break;
                     case 2: Hexagram.hsieh();  // hexagram 40
                     break;
                     case 3: Hexagram.hsi();   // hexagram 29
                     break;  
                     case 4: Hexagram.meng(); // hexagram 4
                     break;                   
                     case 5: Hexagram.shih();    // hexagram 7 
                     break;  
                     case 6: Hexagram.huan(); // hexagram 59
                     break;
                     case 7: Hexagram.wei(); // Hexagram 64
                     break;  
                     case 8: Hexagram.kun(); // Hexagram 47
                     break;                                                               
                     default:
                     } // end switch statement                                
                break
            case 4:
                //Set image and message to Gorge - K'an.
                lowertrigramlabel.text = "                Gorge - K'an!"
                lowertrigram.image = "asset:///images/gorge_kan.png"
          switch (ut) {
                      case 1: Hexagram.thun();    // hexagram 33
                      break;
                      case 2: Hexagram.hsiao();  // hexagram 62
                      break;
                      case 3: Hexagram.chien();   // hexagram 39
                      break;  
                      case 4: Hexagram.kan(); // hexagram 52
                      break;                   
                      case 5: Hexagram.khien();    // hexagram 15
                      break;  
                      case 6: Hexagram.kien(); // hexagram 53
                      break;
                      case 7: Hexagram.lu(); // Hexagram 56
                      break;  
                      case 8: Hexagram.hsien(); // Hexagram 31
                      break;                                                               
                      default:
                      } // end switch statement                                               
                break
            case 5:
                //Set image and message to Ground - Sun.
                lowertrigramlabel.text = "                Ground - Sun!"
                lowertrigram.image = "asset:///images/ground_sun.png"
          switch (ut) {
                       case 1: Hexagram.pin();    // hexagram 12
                       break;
                       case 2: Hexagram.yu();  // hexagram 16
                       break;
                       case 3: Hexagram.gpi();   // hexagram 8
                       break;  
                       case 4: Hexagram.po(); // hexagram 23
                       break;                   
                       case 5: Hexagram.kun();    // hexagram 2
                       break;  
                       case 6: Hexagram.kuan(); // hexagram 20
                       break;
                       case 7: Hexagram.chin(); // Hexagram 35
                       break;  
                       case 8: Hexagram.tsui(); // Hexagram 45
                       break;                                                               
                       default:
                       } // end switch statement                                  
                break
            case 6:
                //Set image and message to Open - Tui.
                lowertrigramlabel.text = "                Open - Tui!"
                lowertrigram.image = "asset:///images/open_tui.png"
          switch (ut) {
                        case 1: Hexagram.kou();    // hexagram 44
                        break;
                        case 2: Hexagram.heng();  // hexagram 32
                        break;
                        case 3: Hexagram.ching();   // hexagram 48
                        break;  
                        case 4: Hexagram.ku(); // hexagram 18
                        break;                   
                        case 5: Hexagram.sheng();    // hexagram 46
                        break;  
                        case 6: Hexagram.sun(); // hexagram 57
                        break;
                        case 7: Hexagram.ting(); // Hexagram 50
                        break;  
                        case 8: Hexagram.geta(); // Hexagram 28
                        break;                                                               
                        default:
                        } // end switch statement                                     
                break
            case 7:
                //Set image and message to Gorge - K'an.
                lowertrigramlabel.text = "                Radiance - Li!"
                lowertrigram.image = "asset:///images/radience_li.png"
        switch (ut) {
                         case 1: Hexagram.tung();    // hexagram 13
                         break;
                         case 2: Hexagram.feng();  // hexagram 55
                         break;
                         case 3: Hexagram.chi();   // hexagram 63
                         break;  
                         case 4: Hexagram.api(); // hexagram 22
                         break;                   
                         case 5: Hexagram.ming();    // hexagram 36
                         break;  
                         case 6: Hexagram.chia(); // hexagram 37
                         break;
                         case 7: Hexagram.li(); // Hexagram 30
                         break;  
                         case 8: Hexagram.ko(); // Hexagram 49
                         break;                                                               
                         default:
                         } // end switch statement                                            
                break
            case 8:
                //Set image and message to Shake - Chen.
                lowertrigramlabel.text = "               Shake - Chen!"
                lowertrigram.image = "asset:///images/shake_chien.png"
       switch (ut) {
                         case 1: Hexagram.tlu();    // hexagram 10
                         break;
                         case 2: Hexagram.kuei();  // hexagram 54
                         break;
                         case 3: Hexagram.chieh();   // hexagram 60
                         break;  
                         case 4: Hexagram.dsun(); // hexagram 41
                         break;                   
                         case 5: Hexagram.lin();    // hexagram 19
                         break;  
                         case 6: Hexagram.chung(); // hexagram 61
                         break;
                         case 7: Hexagram.kuei(); // Hexagram 38
                         break;  
                         case 8: Hexagram.tui(); // Hexagram 58
                         break;                                                               
                         default:
                         } // end switch statement                                            
                break                
                break
            default:
                // Use the fallback image
                lowertrigram.text = greetingPhrase.text
                lowertrigram.image = "asset:///images/ichingcir.png"
        } // Ends the switch statement
 
        // Rotate the whole component to a random number between
        // -10 and 10 degrees.
        uppertrigram.rotationZ = (Math.random() * 20) - 10
        lowertrigram.rotationZ = (Math.random() * 20) - 10
        // Scale the whole component to a random number between
        // 0.7 and 1.2
        var s = Math.random() * 1.5 + 0.7
        uppertrigram.scaleX = s
        uppertrigram.scaleY = s
        var s = Math.random() * 1.5 + 0.7
        lowertrigram.scaleX = s
        lowertrigram.scaleY = s
    }    // Ends the createTrigram() function
  
}// end of page
