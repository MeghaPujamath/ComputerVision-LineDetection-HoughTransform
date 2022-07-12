function [H, rhoScale, thetaScale] = myHoughTransform(Im, threshold, rhoRes, thetaRes)

[imgRow,imgCol]=size(Im);
% rhoRange= (-1)*(floor(sqrt(imgRow*imgRow+imgCol*imgCol))-1) : (floor(sqrt(imgRow*imgRow+imgCol*imgCol))-1);
thetaRange = 0 :1: 179;
thetaRange = deg2rad(thetaRange);

max = sqrt(imgRow*imgRow+imgCol*imgCol);
rhoRange = linspace(0, 2*max, 2*max);

% rhoValues=zeros(1, ceil(max/rhoRes));
% thetaValues=zeros(1, ceil(180/(180*(thetaRes/pi))));

H = zeros(length(rhoRange), length(thetaRange));

for i = 1:imgRow
    for j = 1:imgCol
        if (Im(i, j) > threshold)
            for k = 1:length(thetaRange)
                theta = thetaRange(k);
                rho = round(j * cos(theta) + i * sin(theta));
                if (rho > 0 && rho < 2*max) 
%                     t = (angle + 90) + 1;
%                     r = (rho + (floor(sqrt(imgRow*imgRow+imgCol*imgCol))-1)) + 1;
%                     rhoValues(1,ceil(r/rhoRes)) = rho;
%                     thetaValues(1,ceil((t)/(180*(thetaRes/pi)))) = angle;
                    H(int16(rho),k) = H(int16(rho),k) + 1;
                end
            end
        end
    end
end
rhoScale = rhoRange;
thetaScale = thetaRange;

end
        
        