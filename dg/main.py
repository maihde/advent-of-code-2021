#!/usr/bin/env python
# Demonstrate loading a dg module from Python
import dg
import day_2
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-m', '--mode', default='vertical', help='vertical or aim')
opts = parser.parse_args()

pos = day_2.read_commands('input.txt', opts.mode)
print(pos)
