#!/usr/bin/python

import yaml
import sys

repos_yaml=sys.argv[1]

repos = yaml.load(open(repos_yaml))
for path, upstreams in repos.iteritems():
  first=True
  if upstreams is None:
    continue
  for name, url in upstreams.iteritems():
    info={'path':path, 'name':name, 'url':url}
    if first:
      print "cd; mkdir -p %s"%(path,)
      print "cd; cd '%(path)s'/.."%info
    else:
      print "cd; cd '%(path)s'; git remote add %(name)s %(url)s"%info
    first=False
