
function write_to_conf() {
	sed -i.backup 's/# anon-access = read/anon-access = none/g' $1/conf/svnserve.conf
	sed -i.backup 's/# auth-access = write/auth-access = write/g' $1/conf/svnserve.conf
	sed -i.backup 's/# password-db = passwd/password-db = passwd/g' $1/conf/svnserve.conf
	
	sed -i.backup 's/# sally = sallyssecret/karlandreas = 101Delicion/g' $1/conf/passwd
}

if cd /Volumes/BackupSmestad/OSX/Data/Subversion ; then

if mkdir css && cd css ; then
svnadmin create 3dtransitions
write_to_conf 3dtransitions
svnadmin create LessAndSass
write_to_conf LessAndSass
svnadmin create bootstrap
write_to_conf bootstrap
svnadmin create TransitionAndTransforms
write_to_conf TransitionAndTransforms
svnadmin create css-animation
write_to_conf css-animation
svnadmin create custom-form-elements
write_to_conf custom-form-elements
svnadmin create iPadWebApp
write_to_conf iPadWebApp
svnadmin create patterns
write_to_conf patterns
svnadmin create sandbox
write_to_conf sandbox
svnadmin create webix
write_to_conf webix
svnadmin create webkit
write_to_conf webkit
cd ../
fi

if mkdir django && cd django ; then
svnadmin create addressBOOK
write_to_conf addressBOOK
svnadmin create authenticationBackend
write_to_conf authenticationBackend
svnadmin create autobahn
write_to_conf autobahn
svnadmin create bootstrap
write_to_conf bootstrap
svnadmin create customUserModel
write_to_conf customUserModel
svnadmin create delicion
write_to_conf delicion
svnadmin create dibs
write_to_conf dibs
svnadmin create django_polls
write_to_conf django_polls
svnadmin create emailAuthentication
write_to_conf emailAuthentication
svnadmin create encafe
write_to_conf encafe
svnadmin create imageUploader
write_to_conf imageUploader
svnadmin create lynda
write_to_conf lynda
svnadmin create masteringDjango
write_to_conf masteringDjango
svnadmin create publisher
write_to_conf publisher
svnadmin create readit
write_to_conf readit
svnadmin create simpleBlog
write_to_conf simpleBlog
svnadmin create tornadoWebSocket
write_to_conf tornadoWebSocket
svnadmin create twistedWebSocket
write_to_conf twistedWebSocket
svnadmin create userlogin
write_to_conf userlogin
svnadmin create youtube
write_to_conf youtube
cd ../
fi

if mkdir html5 && cd html5 ; then
svnadmin create appleSamples
write_to_conf appleSamples
svnadmin create browserHistory
write_to_conf browserHistory
svnadmin create canvas
write_to_conf canvas
svnadmin create dragAndDrop
write_to_conf dragAndDrop
svnadmin create file_api
write_to_conf file_api
svnadmin create flexbox
write_to_conf flexbox
svnadmin create geoLocation
write_to_conf geoLocation
svnadmin create html5-game-book
write_to_conf html5-game-book
svnadmin create ios4first
write_to_conf ios4first
svnadmin create khanacademy
write_to_conf khanacademy
svnadmin create localstorage
write_to_conf localstorage
svnadmin create messaging
write_to_conf messaging
svnadmin create powerWorkshop
write_to_conf powerWorkshop
svnadmin create rangeSlider
write_to_conf rangeSlider
svnadmin create snailBait
write_to_conf snailBait
svnadmin create videoAndAudio
write_to_conf videoAndAudio
svnadmin create webForms
write_to_conf webForms
svnadmin create webSockets
write_to_conf webSockets
svnadmin create webWorkers
write_to_conf webWorkers
svnadmin create workflow
write_to_conf workflow
cd ../
fi

if mkdir jQuery && cd jQuery ; then
svnadmin create jCrop
write_to_conf jCrop
svnadmin create jQueryEssentialTraining
write_to_conf jQueryEssentialTraining
svnadmin create jQueryHomepage
write_to_conf jQueryHomepage
svnadmin create jQueryMap
write_to_conf jQueryMap
svnadmin create jQueryPhotoGallery
write_to_conf jQueryPhotoGallery
svnadmin create jQueryVideoGallery
write_to_conf jQueryVideoGallery
svnadmin create tabbedSlidingPanels
write_to_conf tabbedSlidingPanels
cd ../
fi

if mkdir rails && cd rails ; then
svnadmin create addressBOOK
write_to_conf addressBOOK
svnadmin create blogAndCMS4
write_to_conf blogAndCMS4
svnadmin create dibs
write_to_conf dibs
svnadmin create file_examples
write_to_conf file_examples
svnadmin create kajohansen-jQuery
write_to_conf kajohansen-jQuery
svnadmin create kajohansen-js
write_to_conf kajohansen-js
svnadmin create migration_examples
write_to_conf migration_examples
svnadmin create musicLIBRARY4
write_to_conf musicLIBRARY4
svnadmin create simpleBLOG4
write_to_conf simpleBLOG4
svnadmin create simpleCMS4
write_to_conf simpleCMS4
svnadmin create userAuthentication
write_to_conf userAuthentication
cd ../
fi

if mkdir svg && cd svg ; then
svnadmin create ludo
write_to_conf ludo
svnadmin create rollovers
write_to_conf rollovers
svnadmin create svgAnimation
write_to_conf svgAnimation
svnadmin create symbols
write_to_conf symbols
svnadmin create ui_elements
write_to_conf ui_elements
svnadmin create webiconswithsvg
write_to_conf webiconswithsvg
cd ../
fi

if mkdir xml && cd xml ; then
svnadmin create xml
cd ../
fi

if mkdir delicion && cd delicion ; then
svnadmin create delicion-aws
write_to_conf delicion-aws
svnadmin create delicion-layout
write_to_conf delicion-layout
svnadmin create delicion-php
write_to_conf delicion-php
svnadmin create delicion-reaktor
write_to_conf delicion-reaktor
svnadmin create delicion1
write_to_conf delicion1
svnadmin create delicion2
write_to_conf delicion2
cd ../
fi

if mkdir gamle && cd gamle ; then
svnadmin create ElRoyo
write_to_conf ElRoyo
svnadmin create KAFlash
write_to_conf KAFlash
svnadmin create check
write_to_conf check
svnadmin create citrus
write_to_conf citrus
svnadmin create disparaWebProto
write_to_conf disparaWebProto
svnadmin create encafe
write_to_conf encafe
svnadmin create fiberprotector
write_to_conf fiberprotector
svnadmin create images
write_to_conf images
svnadmin create slektsstevne
write_to_conf slektsstevne
cd ../
fi

if mkdir javaScript && cd javaScript ; then
svnadmin create ajaxEssentialTraining
write_to_conf ajaxEssentialTraining
svnadmin create angular2EssentialTraining
write_to_conf angular2EssentialTraining
svnadmin create coffeeScript
write_to_conf coffeeScript
svnadmin create essentialTraining2002
write_to_conf essentialTraining2002
svnadmin create essentialTraining2007
write_to_conf essentialTraining2007
svnadmin create essentialTraining2011
write_to_conf essentialTraining2011
svnadmin create googleMaps
write_to_conf googleMaps
svnadmin create imageResizer
write_to_conf imageResizer
svnadmin create javascriptPractical
write_to_conf javascriptPractical
svnadmin create pureJavaScriptHtmlTabs
write_to_conf pureJavaScriptHtmlTabs
cd ../
fi

if mkdir kajohansen && cd kajohansen ; then
svnadmin create Artwork
write_to_conf Artwork
svnadmin create ka-cube-experiment
write_to_conf ka-cube-experiment
svnadmin create kajohansen
write_to_conf kajohansen
svnadmin create kajohansen-aws
write_to_conf kajohansen-aws
svnadmin create kajohansen-layout
write_to_conf kajohansen-layout
svnadmin create kajohansen-php
write_to_conf kajohansen-php
svnadmin create mobile-first
write_to_conf mobile-first
cd ../
fi

if mkdir php && cd php ; then
svnadmin create adventureTours
write_to_conf adventureTours
svnadmin create agenda
write_to_conf agenda
svnadmin create blog
write_to_conf blog
svnadmin create business_directory
write_to_conf business_directory
svnadmin create crud
write_to_conf crud
svnadmin create debug
write_to_conf debug
svnadmin create dibs
write_to_conf dibs
svnadmin create dibs_one
write_to_conf dibs_one
svnadmin create facebook_php_mysql
write_to_conf facebook_php_mysql
svnadmin create forum
write_to_conf forum
svnadmin create homeunix
write_to_conf homeunix
svnadmin create kajohansen
write_to_conf kajohansen
svnadmin create lsl
write_to_conf lsl
svnadmin create ludo
write_to_conf ludo
svnadmin create lyndaSQLite3
write_to_conf lyndaSQLite3
svnadmin create mx_kart
write_to_conf mx_kart
svnadmin create oop
write_to_conf oop
svnadmin create phar_tut
write_to_conf phar_tut
svnadmin create phpBeyondBasics
write_to_conf phpBeyondBasics
svnadmin create phpEssentialTraining
write_to_conf phpEssentialTraining
svnadmin create recordStore
write_to_conf recordStore
svnadmin create security
write_to_conf security
svnadmin create sid
write_to_conf sid
svnadmin create simplePushAPNS
write_to_conf simplePushAPNS
svnadmin create simplexml
write_to_conf simplexml
svnadmin create ska
write_to_conf ska
svnadmin create statistics
write_to_conf statistics
svnadmin create sweetscomplete
write_to_conf sweetscomplete
svnadmin create travel_agency
write_to_conf travel_agency
svnadmin create twitteroauth-master
write_to_conf twitteroauth-master
svnadmin create userAuth
write_to_conf userAuth
svnadmin create watermark
write_to_conf watermark
cd ../
fi

if mkdir sql && cd sql ; then
svnadmin create sql
write_to_conf sql
cd ../
fi

if mkdir webgl && cd webgl ; then
svnadmin create applications-master
write_to_conf applications-master
svnadmin create beginningWebglForHTML5
write_to_conf beginningWebglForHTML5
svnadmin create forbeginners
write_to_conf forbeginners
svnadmin create forbeginners-master
write_to_conf forbeginners-master
svnadmin create glmatrix-tutorial
write_to_conf glmatrix-tutorial
svnadmin create inka3D
write_to_conf inka3D
svnadmin create khronos-master
write_to_conf khronos-master
svnadmin create kickJS-master
write_to_conf kickJS-master
svnadmin create ludo
write_to_conf ludo
svnadmin create oreilly-applications
write_to_conf oreilly-applications
svnadmin create oreilly-planets
write_to_conf oreilly-planets
svnadmin create oreilly-planets-master
write_to_conf oreilly-planets-master
svnadmin create webglForHTML5-master
write_to_conf webglForHTML5-master
svnadmin create webglGameDevelopment-master
write_to_conf webglGameDevelopment-master
svnadmin create webglHotspot-master
write_to_conf webglHotspot-master
svnadmin create webglProgrammingGuide
write_to_conf webglProgrammingGuide
svnadmin create webglProgrammingGuide-master
write_to_conf webglProgrammingGuide-master
cd ../
fi

fi

