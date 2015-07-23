# BlocksPreProcessing

supplemental programs for checking segment and block files prior to running blocks

File list and use:
All_in_Kreemer_GPS_NA_trouble4_off_RF_Clean.sta.data - example station file
BlockLabelUtil.m - modified version of BlockLabel used in CheckBlockInteriorPoints.m
BlockLabelViz.m - modified version of BlockLabel used in VizualizeBlockClosure.m
CheckBlockInteriorPoints.m - run to verify whether or not blocks have a single interior point. Blocks that do not are plotted
CheckHorizonalAndVerticalSegs.m - run to check for horizontal or vertical segments. Outputs the name and lat or lon of offending segments
CheckLengths.m - program to check the difference between actual segment length and projected length. Produces plots of problem segments. Also checks for sign of dlamb problems
faultobliquemerc_plots.m - modified version used in CheckLengths.m
Global_antipode_test_plots.segment -  test segment file for the problem segments
ProjectSegCoords_plots.m -  modified version used in CheckLengths.m
ReadSegmentStructUtil.m - modified version of ReadSegmentStruct.m used by BlockLabel*
VizualizeBlockClosure.m - run to watch the segment tracker and watch blocks close
taiwan_blocks_ching_redo_edit3.segment- example segment file (small model for just Taiwan)
test.block - example block file for the above segment file - has one block missing an interior point 
test_horiz_vert.segment - test segment file for showing how the horizontal/vertical checker works 

