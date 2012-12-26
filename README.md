## Perka Objective-C Client Library

Allows iOS developers to easily integrate with [The Perka API](https://getperka.com/developer/)

[Full SDK Documentation](http://perka.github.com/perka-client-objc/classes.html)

### Requirements
* iOS 5.0+
* Automatic Reference Counting

### Installation

1. Create a new XCode project to make use of the perka client library.  We'll refer to this project as perka-app, housed in the directory $WORKSPACE.

2. Clone the perka-client-objc project next to perka-app:

       git clone git@github.com:perka/perka-client-objc.git $WORKSPACE/perka-client-objc

3. Drag the perka-client-objc.xcodeproj file from the Finder onto the perka-app project in XCode:

   ![Dragging perka-client-objc.xcodeproj](https://raw.github.com/perka/perka-client-objc/master/docs/screen1.jpg)
   
4. Select the perka-app project from the XCode sidebar, choose the perka-app target, open the Build Phases tab, and add the perka-client-objc library as a target dependency:

    ![Add perka-client-objc dependency](https://raw.github.com/perka/perka-client-objc/master/docs/screen2.jpg)
    
5. Open the Build Settings tab, search for 'user header', Change 'Always Search User Paths' to YES, and add '../perka-client-objc/perka-client-objc' as a recursive search path:
  
    ![Add user header search path](https://raw.github.com/perka/perka-client-objc/master/docs/screen3.jpg)
    
    