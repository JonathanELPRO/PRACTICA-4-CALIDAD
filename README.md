Run a feature file
==================
cucumber features\1calc.feature

Run a feature file without report dialog
==================================
cucumber features\1calc.feature --publish-quiet

Run a feature file and export results to HTML format
====================================================
cucumber features\1calc.feature -f html -o reports\reportExecution.html

Run an specific scenario in a feature file
==========================================
cucumber features\1calc.feature  -t @onlyThis

Run all features
================
cucumber features