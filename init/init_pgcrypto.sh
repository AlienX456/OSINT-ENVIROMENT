#!/bin/bash

psql -U dspace -d dspace -c 'create extension pgcrypto'