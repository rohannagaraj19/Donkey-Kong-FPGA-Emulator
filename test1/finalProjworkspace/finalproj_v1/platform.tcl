# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\rohan\385FinalProject\test1\finalProjworkspace\finalproj_v1\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\rohan\385FinalProject\test1\finalProjworkspace\finalproj_v1\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {finalproj_v1}\
-hw {C:\Users\rohan\385FinalProject\test1\project_1\finalproj_v1.xsa}\
-out {C:/Users/rohan/385FinalProject/test1/finalProjworkspace}

platform write
domain create -name {standalone_microblaze_0} -display-name {standalone_microblaze_0} -os {standalone} -proc {microblaze_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {finalproj_v1}
platform generate -quick
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v2.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v2.xsa}
platform generate -domains 
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v2.xsa}
platform clean
platform generate
platform active {finalproj_v1}
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v2.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform active {finalproj_v1}
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform active {finalproj_v1}
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform clean
platform generate
platform active {finalproj_v1}
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
platform config -updatehw {C:/Users/rohan/385FinalProject/test1/project_1/finalproj_v1.xsa}
platform clean
platform generate
