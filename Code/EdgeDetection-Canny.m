function [img1] = myEdgeFilter(img0, sigma)
gKernel = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);

filteredImage = myImageFilter(img0, gKernel);
[imgRow, imgCol] = size(filteredImage);


sobelKernelY = fspecial('sobel');
sobelKernelX = sobelKernelY';

imgX = myImageFilter(filteredImage, sobelKernelX);
imgY = myImageFilter(filteredImage, sobelKernelY);

imgMag = zeros([imgRow imgCol]);
imgOri = zeros([imgRow imgCol]);
result = zeros([imgRow imgCol]);

% Calculate gradient magnitude and angle
for i=1:imgRow
    for j=1:imgCol
        imgMag(i,j) = sqrt((imgX(i,j)^2) + (imgY(i,j)^2));
        
        if(imgY(i,j) == 0 && imgX(i,j) == 0)
            imgOri(i,j) = 0;
        else
            imgOri(i,j) = atan(abs(imgY(i,j)) / abs(imgX(i,j))) * (180/pi);
        end
    end
end

% Non Maximum Supression

% 1. Deduce gradient angle values to either 0, 45, 90, 135 degrees

for i = 1:imgRow
    for j = 1:imgCol
        val = imgOri(i,j);
        if(val < 0)
            val = val + 360;
        end
        val = round(val/45) * 45;
        
        while val > 135
            val = val - 180;
        end   
        imgOri(i,j) = val;
    end
end

% 2. Supress the gradient magnitude if the neighbouring values are greater

for i = 2:imgRow-1
    for j = 2:imgCol-1
        if(imgOri(i,j) == 0)
            lst = [imgMag(i,j-1), imgMag(i,j), imgMag(i,j+1)];
        elseif(imgOri(i,j) == 45)
            lst = [imgMag(i+1,j-1), imgMag(i,j), imgMag(i-1,j+1)];
        elseif(imgOri(i,j) == 90)
            lst = [imgMag(i+1,j), imgMag(i,j), imgMag(i-1,j)];
        elseif(imgOri(i,j) == 135)
            lst = [imgMag(i+1,j+1), imgMag(i,j),imgMag(i-1,j-1)];
        end
        
        if(max(lst) ~= imgMag(i,j))
            result(i,j) = 0;
        else
            result(i,j) = imgMag(i,j);
        end
    end
end

img1 = (result);

% figure,imshow(imgMag); title('Gradient Magnitude');
% figure,imshow(result); title('NVM Result');
end
    
                
        
        
