#!/usr/bin/bash

gpg --keyserver-options auto-key-retrieve --keyserver hkps://keyserver.ubuntu.com --recv-keys $1
