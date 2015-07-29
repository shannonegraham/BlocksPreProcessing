function VizualizeBlockClosure_bjm(segmentFile,blockFile,stationFile)
% blocks preprocessing tool to vizualize the block closing and segment
% marching
% provide segment file, block file and station file in that order

fprintf('Parsing segment, block, and station files...')
Segment = ReadSegmentStructUtil(segmentFile); % read segment file
Block = ReadBlock(blockFile); % Read block file
Station = ReadStation(stationFile); %read station file
fprintf('done.\n')

% edit this section
fprintf('Labeling blocks...')
[Segment, Block, Station] = BlockLabelViz(Segment, Block, Station);
fprintf('done.\n')
