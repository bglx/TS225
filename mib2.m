function[Image_final, Mask_final, Box_final] = mib2(Image, Mask, Box, Homographie, Homographie_inverse)


[box_1_x, box_1_y] = transformation(Homographie, Box(1,1), Box(1,2));
[box_2_x, box_2_y] = transformation(Homographie, Box(2,1), Box(2,2));
[box_3_x, box_3_y] = transformation(Homographie, Box(3,1), Box(3,2));
[box_4_x, box_4_y] = transformation(Homographie, Box(4,1), Box(4,2));
Box_final = [floor(box_1_x) floor(box_1_y); floor(box_2_x), floor(box_2_y); floor(box_3_x), floor(box_3_y); floor(box_4_x), floor(box_4_y)];


% [w,h] = size(Image);
% 
% Test1 = ones(w,h);
% Test2 = ones(w,h);
% 
% for i = 1:w
%     for j = 1:h
%         [x, y] = transformation(Homographie, i, j);
%         Test1(i,j) = x;
%         Test2(i,j) = y;
%     end
% end

Max_x = max([floor(box_1_x) floor(box_2_x) floor(box_3_x) floor(box_4_x)]);
Min_x = min([floor(box_1_x) floor(box_2_x) floor(box_3_x) floor(box_4_x)]);

Max_y = max([floor(box_1_y) floor(box_2_y) floor(box_3_y) floor(box_4_y)]);
Min_y = min([floor(box_1_y) floor(box_2_y) floor(box_3_y) floor(box_4_y)]);

Image_final = zeros(Max_x-Min_x+1,Max_y-Min_y+1);
Mask_final = Image_final;

[W,H] = size(Image_final);


for i = 1:W+1
    for j = 1:H+1
        [x, y] = transformation(Homographie_inverse, i+Min_x-1, j+Min_y-1);
        if contiens([1 Box(3,1) Box(3,1) 1 1 1 Box(3,2) Box(3,2)], x, y)
			Image_final(i,j) = Image(x,y);
        end
    end
end

% for i = 1:w
%     for j = 1:h
%         Image1(floor(Test1(i,j)-Min_x+1),floor(Test2(i,j)-Min_y+1)) = Image(i,j);
%         Mask1(Test1(i,j)-Min_x+1,Test2(i,j)-Min_y+1) = Mask(i,j);
%     end
% end

end