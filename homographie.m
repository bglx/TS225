function [H, XA, YA, XB, YB] = homographie(IMG1, IMG2)

figure(1), imagesc(IMG1), colormap(gray);

[XA, YA] = ginput(4);

figure(2), imagesc(IMG2), colormap(gray);

[XB, YB] = ginput(4);

A = [XA(1) YA(1) 1 0 0 0 -XA(1)*XB(1) -YA(1)*XB(1);...
	0 0 0 XA(1) YA(1) 1 -XA(1)*YB(1) -YA(1)*YB(1);...
	XA(2) YA(2) 1 0 0 0 -XA(2)*XB(2) -YA(2)*XB(2);...
	0 0 0 XA(2) YA(2) 1 -XA(2)*YB(2) -YA(2)*YA(2);...
	XA(3) YA(3) 1 0 0 0 -XA(3)*XB(3) -YA(3)*XB(3);...
	0 0 0 XA(3) YA(3) 1 -XA(3)*YB(3) -YA(3)*YA(3);...
	XA(4) YA(4) 1 0 0 0 -XA(4)*XB(4) -YA(4)*XB(4);...
	0 0 0 XA(4) YA(4) 1 -XA(4)*YB(4) -YA(4)*YA(4)];

B = [XB(1); YB(1); XB(2); YB(2); XB(3); YB(3); XB(4); YB(4)];

X = A\B;

H = [X(1) X(2) X(3) ; X(4) X(5) X(6) ; X(7) X(8) 1];

close(1), close(2);
