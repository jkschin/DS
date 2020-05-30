**DS**(~~deepsort cpp version~~)

C++ implementation of Simple Online Realtime Tracking with a Deep Association Metric

# 1. dependencies
component|version
-|-
eigen|3.3
opencv|-
boost|-
tensorflow|1.4

# 2. build
./make.sh

# 3. prepare data

change the var values at [lines160-162 in Main.cpp](https://github.com/oylz/DS/blob/master/Main.cpp#L160TL162):
```
_imgDir = "/home/xyz/code1/xyz/img1/"; // MOT format

_rcFile = "/home/xyz/code1/xyz/det/det.txt"; // MOT format

_imgCount = 680;  // frames count
```

# 4. run

./r.sh

# 5.tips

tensorflow build:
```
(1) ./configure
(2) bazel build -c opt --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-mfpmath=both --copt=-msse4.2 --config=cuda  tensorflow:libtensorflow_cc.so
```

# Comments from jkschin
1. I removed some include and library paths that did not seem to affect building.
2. `r.sh` does not seem to exist. I built `opencv` locally in a separate directory, so you need to run `LD_LIBRARY_PATH=/home/$USER/cpplibs/opencv-3.4.7/build/lib ./DS 1` for it to work. I put the libraries in `cpplibs`.
3. `_imgDir` in `Main.cpp` was tricky. Don't forget the last `/` after `img1`. It is necessary for you to read the image in.








