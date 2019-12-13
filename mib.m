function[Image, Mask, Box] = mib(Image)

[w,h] = size(Image);
Mask = ones(w,h);
Box = [1 1; 1 h; w h; w 1];
end
