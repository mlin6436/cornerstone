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

if [ $1 == 10 ]
  then 
    echo "Setting up Java 10"
    unlinkjava
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/bin/java /usr/bin/java
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/bin/javac /usr/bin/javac
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/bin/javadoc /usr/bin/javadoc
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/bin/javah /usr/bin/javah
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home/bin/javap /usr/bin/javap
fi

if [ $1 == 8 ]
  then
    echo "Setting up Java 8"
    unlinkjava
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/bin/java /usr/bin/java
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/bin/javac /usr/bin/javac
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/bin/javadoc /usr/bin/javadoc
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/bin/javah /usr/bin/javah
    sudo ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home/bin/javap /usr/bin/javap
fi
