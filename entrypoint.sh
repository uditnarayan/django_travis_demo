#!/bin/bash

./wait-for-it.sh -s db:5432 -- python manage.py migrate

coverage run --source='.' manage.py test

coverage report

coverage xml -o code_coverage.xml

coverage html -d code_coverage_report

cd code_coverage_report

python -m SimpleHTTPServer 8000

echo 'Server started at http://0.0.0.0:8000/'
