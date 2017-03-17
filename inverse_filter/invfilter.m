function invfilter()
	
	img = imread('C:\Users\USER1\Desktop\IMG_PRS\inverse_filter\h.jpg');
	img = rgb2gray(img);
	[row, col] = size(img);
	
	h = fspecial('motion', 10, 2);
	blurred = imfilter(img, h);
	
	%inverse filter
	
	fg = fft2(blurred);
	fh = fft2(h, row, col);
	
	ff = fg./fh;
	ff = fftshift(ff);
	
	deblurred = ifft2(ff);
	deblurred = real(deblurred);
	deblurred = uint8(deblurred);
	figure, imshow(deblurred);