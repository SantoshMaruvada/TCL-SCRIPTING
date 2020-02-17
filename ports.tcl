set length [llength [dbget top.terms.name]]
for {set i 0 } {$i < $length} {incr i} {
set termname [dbget top.terms.name -i $i]
set netname [dbget [ dbget  top.terms.name $termname -p  ].net.name ]
if {$netname != "0x0"} {
set times [ llength [dbget [dbget top.terms.name $netname -p ].net.wires.box ]]
for {set t 0} {$t< $times} {incr t} {
set box  [dbget [ dbget top.terms.name $netname -p ].net.wires.box -i $t ]
set box_llx [dbget [ dbget top.terms.name  $netname -p].net.wires.box_llx -i $t]
set box_lly [dbget [ dbget top.terms.name  $netname -p].net.wires.box_lly -i $t]
set box_urx [dbget [ dbget top.terms.name  $netname -p].net.wires.box_urx -i $t]
set box_ury [dbget [ dbget top.terms.name  $netname -p].net.wires.box_ury -i $t]
set layer [dbget  [dbget top.terms.name $netname  -p ].net.wires.layer.name -i $t]
set Fplan_box_llx [dbget top.fPlan.box_llx]
set Fplan_box_lly [dbget top.fPlan.box_lly]
set Fplan_box_urx [dbget top.fPlan.box_urx]
set Fplan_box_ury [dbget top.fPlan.box_ury]
if { $box_llx < $Fplan_box_llx} {
deselectAll 
editSelect -area $box -layer $layer -net $netname 
editStretch x 0.035 low
} elseif { $box_lly < $Fplan_box_lly} {
deselectAll 
editSelect -area $box -layer $layer -net $netname
editStretch y 0.035 low
} elseif { $box_urx > $Fplan_box_urx} {
deselectAll 
editSelect -area $box -layer $layer -net $netname 
editStretch x -0.035 high
} elseif { $box_ury > $Fplan_box_ury} {
deselectAll 
editSelect -area $box -layer $layer -net $netname 
editStretch y -0.035 high
} else {
continue
}
}
}
} 
