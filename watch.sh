#!/bin/sh
bundle exec middleman server --watcher-force-polling --watcher_latency=1 &> ~/tmp/middleman.log &
