name 'load-balancer'
description 'role for proxy servers'
run_list 'recipe[myusers]', 'recipe[myhaproxy]'
