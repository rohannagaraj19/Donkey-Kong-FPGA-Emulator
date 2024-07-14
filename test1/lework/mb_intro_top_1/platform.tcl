# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\rohan\385lab6\lework\mb_intro_top_1\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\rohan\385lab6\lework\mb_intro_top_1\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {mb_intro_top_1}\
-hw {C:\Users\rohan\385lab6\project_1\mb_intro_top.xsa}\
-out {C:/Users/rohan/385lab6/lework}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {mb_intro_top_1}
platform generate -quick
platform generate
