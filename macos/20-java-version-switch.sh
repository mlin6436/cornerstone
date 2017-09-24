#!/bin/bash

echo "$1"

if [ -z "$1" ]
  then
    echo "Specify a Java version to set up"
    exit 1
fi

unlinkjava () {
  sudo unlink /usr/bin/java
  sudo unlink /usr/bin/javac
  sudo unlink /usr/bin/javadoc
  sudo unlink /usr/bin/javah
  sudo unlink /usr/bin/javap
}

if [ $1 == 7 ]
  then 
    echo "Setting up Java 7"
    unlinkjava
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/bin/java /usr/bin/java
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/bin/javac /usr/bin/javac
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/bin/javadoc /usr/bin/javadoc
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/bin/javah /usr/bin/javah
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/bin/javap /usr/bin/javap
fi

if [ $1 == 8 ]
  then
    echo "Setting up Java 8"
    unlinkjava
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/bin/java /usr/bin/java
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/bin/javac /usr/bin/javac
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/bin/javadoc /usr/bin/javadoc
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/bin/javah /usr/bin/javah
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/bin/javap /usr/bin/javap
fi