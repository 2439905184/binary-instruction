#!/bin/bash
mkdir dist
gdc scripter.d -o dist/scripter.elf
gdc compiler.d -o dist/compiler.elf