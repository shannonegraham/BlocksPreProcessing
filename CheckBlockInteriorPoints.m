function CheckBlockInteriorPoints(segmentFile,blockFile,stationFile)
% blocks preprocessing tool to check and see if all blocks are closed and
% have an interior point
% provide segment file, block file and station file in that order

fprintf('Parsing segment, block, and station files...')
Segment = ReadSegmentStructUtil(segmentFile); % read segment file
Block = ReadBlock(blockFile); % Read block file
Station = ReadStation(stationFile); %read station file
fprintf('done.\n')

% edit this section
fprintf('Labeling blocks...')
[Segment, Block, Station] = BlockLabelUtil(Segment, Block, Station);
fprintf('done.\n')
fprintf('Look at plots if any\n')
