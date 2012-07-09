homebrew-hyper
==============

Install homebrew on your mac. Details can be found here: https://github.com/mxcl/homebrew/wiki/Installation


    /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"

Update brew and have the brew doctor check your environment.

    brew update
    brew doctor
    
Tap into the hyper repository and install hyper. Check for caveats, you might need to install gcc by hand.
    
    brew tap henrik-muehe/hyper
    brew install hyper
    
For I7 processors, HyPer currently needs to be compiled with `-mno-avx` added to the `CXXFLAGS`. Also, remember to set CXX to g++-4.7, for instance using `export CXX=g++-4.7`.