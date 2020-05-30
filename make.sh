#!/bin/bash

function getbazel(){
	LINE=`readlink -f /home/$USER/code1/tensorflow-1.4.0-rc0/bazel-bin/`

	POS1="_bazel_$USER/"
	STR=${LINE##*$POS1}

	BAZEL=${STR:0:32}

	echo $BAZEL
}



BAZEL=`getbazel`




IINCLUDE="-I/home/$USER/cpplibs/opencv-3.4.7/build/include -I/usr/local/include -I/home/$USER/cpplibs/eigen-3.3.7/Eigen"


LLIBPATH="-L/home/$USER/cpplibs/opencv-3.4.7/build/lib -L/usr/local/lib -L/usr/local -L/home/$USER/code/DS/deepsort/FeatureGetter"

rm DS -rf


function BOPENMP(){
	LLIBS="-lopencv_corexyz -lopencv_imgprocxyz  -lopencv_highguixyz -lFeatureGetter -lboost_system -lglog -ltcmalloc"
	g++ --std=c++14 -O3 -fopenmp -DUDL -o DS $IINCLUDE $LLIBPATH  deepsort/munkres/munkres.cpp deepsort/munkres/adapters/adapter.cpp deepsort/munkres/adapters/boostmatrixadapter.cpp  NT.cpp fdsst/fdssttracker.cpp fdsst/fhog.cpp Main.cpp $LLIBS
}


function BTBB(){
	LLIBS="-lopencv_corexyz -lopencv_imgprocxyz -lopencv_highguixyz -lFeatureGetter -lboost_system -lglog -ltbb"
	g++ --std=c++14 -DUSETBB -o DS $IINCLUDE $LLIBPATH deepsort/munkres/munkres.cpp deepsort/munkres/adapters/adapter.cpp deepsort/munkres/adapters/boostmatrixadapter.cpp  NT.cpp Main.cpp $LLIBS
}


function BOPENMPHOG(){
	LLIBS="-lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs -lopencv_videoio -lboost_system -lglog -ltcmalloc"
	g++ --std=c++14 -O3 -fopenmp -o DS $IINCLUDE $LLIBPATH  deepsort/munkres/munkres.cpp deepsort/munkres/adapters/adapter.cpp deepsort/munkres/adapters/boostmatrixadapter.cpp  NT.cpp fdsst/fdssttracker.cpp fdsst/fhog.cpp Main.cpp $LLIBS
}

BOPENMPHOG




