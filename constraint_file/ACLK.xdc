#create_clock -name ACLK -period 3.763 [get_ports ACLK] #For Max Frequency
create_clock -name ACLK -period 10.000 [get_ports ACLK]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
