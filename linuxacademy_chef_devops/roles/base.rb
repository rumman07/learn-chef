name "base"
description "This contains recipes that will run on all the nodes"
run_list "recipe[security]","recipe[localusers]"

