#!/usr/bin/env python2.7

import sys, re

extensions = ['png','jpg','jpeg','pdf','ai']
regexps = [re.compile(r'\{\s*([^\{]+?.%s)\s*\}' % extension) for extension in extensions]

try:
    filename = sys.argv[1] if sys.argv[1] != '-' else None
except IndexError:
    filename = None

if filename:
    infile = open(filename,'rt')
else:
    infile = sys.stdin

try:
    for line in infile:
        line = line.split('%')[0]
        for regexp in regexps:
            m = regexp.search(line)
            if m:
                print re.sub(r'[{}]', '', m.groups()[0])
finally:
    infile.close()

