#!/bin/sh
bundle exec middleman build --clean
bundle exec middleman server --clean --watcher-force-polling --watcher_latency=1 &> ~/tmp/middleman.log &
