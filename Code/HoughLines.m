function [rhos, thetas] = myHoughLines(H, nLines)
[imgRow,imgCol]= size(H);

for i = 2:imgRow-1
    for j = 2:imgCol-1
        if(H(i,j) > H(i,j+1) && H(i,j) > H(i,j-1) && H(i,j) > H(i+1,j) && H(i,j) > H(i-1,j) && H(i,j) > H(i+1,j+1)&& H(i,j) > H(i-1,j-1) && H(i,j) > H(i-1,j+1) && H(i,j) > H(i+1,j-1))
            H(i,j)=H(i,j);                      
        else
            H(i,j)=0;
        end     
    end
end

i = 1;
rhos=[];
thetas=[];
while i <= nLines
    [x,y] = max(H(:));
    [r, c] = ind2sub(size(H),y);
    rhos = [rhos r];
    thetas = [thetas c];
    H(r, c)=0; 
    i = i + 1;
end
rhos=transpose(rhos);
thetas=transpose(thetas);

        