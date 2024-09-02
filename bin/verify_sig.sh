#!/usr/bin/bash

gpg --keyserver-options auto-key-retrieve --keyserver hkps://keyserver.ubuntu.com --verify $1
