#!/usr/bin/env bash
service nginx start

uvicorn app.main:app --uds /tmp/uvicorn.sock
