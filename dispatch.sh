#!/usr/bin/env bash

for tag in $(ls -1d */); do
    if [[ "$tag" =~ "lib" ]]; then
        # Skip lib dir
        continue;
    fi

    # echo $tag

    touch $tag/Dockerfile
    truncate -s0 $tag/Dockerfile

    for dockerfile in $(ls -1d $tag*.dockerfile); do
        # echo "    $dockerfile"
        cat $dockerfile >> $tag/Dockerfile
        echo "" >> $tag/Dockerfile
        echo "" >> $tag/Dockerfile
    done
done
