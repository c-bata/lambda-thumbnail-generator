#!/bin/bash

export PROJECT_ROOT=$PWD
cd $VIRTUAL_ENV/lib/python2.7/site-packages/
zip -r $PROJECT_ROOT/upload.zip *
cd $PROJECT_ROOT
zip -g upload.zip lambda_function.py

unset PROJECT_ROOT

