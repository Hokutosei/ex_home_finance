#!/bin/sh

export PORT=${PORT:-8000}

start () {
    mix phx.server
}

$*