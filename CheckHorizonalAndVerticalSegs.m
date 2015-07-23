function CheckHorizonalAndVerticalSegs(segmentFile)
% blocks preprocessing tool to find the horizontal and vertical segments
% when too zoomed out to see them in SegmentManager
%requries a segment file for input

fprintf('Parsing segment file...')
S = ReadSegmentStructUtil(segmentFile); % read segment file
fprintf('done.\n')

% Check the lengths and azimuths of segments
rvec = zeros(numel(S.lat1), 1);
avec = rvec;
for i = 1:numel(S.lon1)
   [rng az] = distance(S.lat1(i), S.lon1(i), S.lat2(i), S.lon2(i), 'degrees');
   avec(i) = az;
   rvec(i) = 6371*deg2rad(rng);

   if (S.lat1(i) == S.lat2(i))
      fprintf('lat match:')
      S.name(i,:)
      S.lat1(i)
   end

   if (S.lon1(i) == S.lon2(i))
      fprintf('lon match:')
      S.name(i,:)
      S.lon1(i)
   end
   
%    if (avec(i) == 180)
%       sprintf('%d is horizontal, ', i, avec(i));
%    end
%    if (rvec(i) == 0)
%       sprintf('%d has %f length, ', i, rvec(i));
%    end
end

    