#!/bin/bash

kill -9 `ps aux | grep rails | grep -v grep | awk "{print $2}"`
