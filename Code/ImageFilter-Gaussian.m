function [img1] = myImageFilter(img0, h)

[rowfilter, colfilter] = size(h);

h = im2double(h);
% rotFilter = rot90(h, 2);

padsizer = floor(rowfilter/2);
padsizec = floor(colfilter/2);
paddedimage = padarray(img0, [padsizer padsizec],'replicate');

img1 = zeros(size(img0));
for i = 1+padsizer:size(paddedimage, 1)-padsizer
    for j = 1+padsizec:size(paddedimage, 2)-padsizec
        sum = 0;
        for p = -padsizer:padsizer
            for q = -padsizec:padsizec
                sum = sum + h(p+padsizer+1,q+padsizec+1)*paddedimage(i+p,j+q);
            end
        end
        img1(i-padsizer,j-padsizec) = sum;
    end
end


end