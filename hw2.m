new  = uint8(HW2_brain);
%figure(1);imshow(new);colorbar;title('original'); 
%-------hw2(a)----------------------------------------------------------------------------
figure(1);
imhist(new);title('gray histogram');axis auto;
%-------hw2(b)----------------------------------------------------------------------------
[row,col] = size(new);
r = 0:255;
pixels = zeros(1,256); %initialize
for i = 1:row
    for j = 1:col
        for k = 1:256
            if(new(i,j) == r(k))
                pixels(k) = pixels(k) + 1;
            end
        end
    end
end
pdf = pixels /(row * col);
cum = cumsum(pixels);
cdf = cum * (255 / (row * col));%*****
intensity = round(cdf);
h_eq = zeros(row ,col);%initialize
for i = 1:row
    for j = 1:col
        h_eq(i,j) = intensity(new(i,j)+1);
    end
end
%----show image------------------------------------------------------------------------
figure(2);stem(pdf,'fill');title('PDF');xlabel('r(k)');ylabel('P(r(k))');
figure(3);stairs(cdf);title('CDF');xlabel('r(k)');ylabel('T(r(k))');
figure(4);imshow(uint8(h_eq));title('Manual equal');
figure(5);imhist(uint8(h_eq));axis auto;title('Manual equal');
sh = histeq(new);
figure(6);imshow(sh);title('Function equal');
figure(7);imhist(sh);title('Function equal');axis auto;

