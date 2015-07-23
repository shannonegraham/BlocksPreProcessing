function CheckLengths(segmentFile,stationFile)
% program to compute the distance bewteen fault lon/lat poitns and compare
% against the distance between projected points
% output those distance pairs as well as the segment info
% requires a segment file and station file for input

fprintf('Parsing segment and station files...')
F = ReadSegmentStructUtil(segmentFile); % read segment file
S = ReadStation(stationFile); %read station file
fprintf('done.\n')

nseg = numel(F.lon1);
Strike = zeros(nseg, 1);


for i = 1:nseg
    f = structsubset(F, i);
    % Calculate projected Cartesian coordinates
    [f, s]                                  = ProjectSegCoords_plots(f, S, i, f.name);
    %[f, s]                                  = ProjectSegCoords_plots(f, S,i,f.name(i,:)); % calls faultobliquemerc_plots

    Strike(i)                               = f.strike;

% compute the distance bewteen fault lon/lat poitns and compare against
    % distance between projected points
    % output those distance pairs as well as the segment info
    lonlat_fault_dist=gcdist(f.lat1, f.lon1, f.lat2, f.lon2)/1000; %convert to km
    xy_fault_dist=(sqrt(((f.px1-f.px2)^2)+(f.py1-f.py2)^2));
    dist_diff=lonlat_fault_dist-xy_fault_dist;
    segment=f.name;

        if abs(dist_diff) > 5
          fprintf('Segment length does not match projected length! See faultinfo plot(s)')  
          segment
          lonlat_fault_dist
          xy_fault_dist
          dist_diff

        % plot the lon lat coords
          % fault: f.lon1, f.lat1, f.lon2, f.lat2
         % stations: s.lon, s.lat
           f.longs=[f.lon1,f.lon2];
           f.latits=[f.lat1,f.lat2];
           figure(i)
            subplot(2,1,1);
            plot(s.lon,s.lat,'bo',...
           'MarkerSize',5,...
           'MarkerFaceColor','b')
           hold on
           plot(f.longs,f.latits,'r','LineWidth',10)


         % plot the projected coords
         % fault: f.px1, f.py1, f.px2, f.py2
         % stations: s.fpx, s.fpy
          f.xpoints=[f.px1, f.px2];
          f.ypoints=[f.py1, f.py2];
           subplot(2,1,2);
          plot(s.fpx,s.fpy,'bo',...
          'MarkerSize',5,...
          'MarkerFaceColor','b')
          hold on
          plot(f.xpoints, f.ypoints, 'r',...
          'LineWidth',10)
          %tmps=['smfault',num2str(i),'.fig'];
          tmps=['faultinfo',num2str(i),'.png'];
          saveas(gca,tmps);

        end
end
