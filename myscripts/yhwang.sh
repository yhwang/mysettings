#!/bin/bash

brswitch2()
{
    if [ "$#" != 1 ]; then
        printf "usage: brswitch2 <version>\n"
        return 0
    fi
    local TARGET=$1
    if [ "$TARGET" == "v4" ]; then
        export BRDEVHOME=/home/yhwang/WS_RTC_Bedrock40
        export BRHOME=/home/yhwang/bedrock/bedrock-sdk40
    elif [ "$TARGET" == "v5" ]; then
        export BRDEVHOME=/home/yhwang/WS_RTC_Bedrock
        export BRHOME=/home/yhwang/bedrock/bedrock-sdk
    elif [ "$TARGET" == "v3" ]; then
        export BRDEVHOME=/home/yhwang/WS_RTC_Bedrock30
        export BRHOME=/home/yhwang/bedrock/bedrock-sdk30
    fi

    echo =========================
    echo BRDEVHOME=$BRDEVHOME
    echo BRHOME=$BRHOME
    echo =========================
}

brrebuild-dp-bin()
{
    if [ "$_MCP" == "1" ]; then
        cd $BRDEVHOME/protected-src
        make clean
        make all
        make install
        cd $BRDEVHOME/src/third-party/dp-bin
        make install
    else
        echo "get into fakeroot first"
    fi
}

brbuild()
{
    cd $BRDEVHOME/src
    make clean
    make
    make install-sdk
    make prep-fvt
}
