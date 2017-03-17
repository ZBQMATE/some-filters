function lowpass()
	%parameter:
	img = imread('C:\Users\USER1\Desktop\IMG_PRS\gaussian_lowpass\h.jpg');
	img = rgb2gray(img);
	img = fft2(img);
	img = fftshift(img);
	
	rr = real(img);
	ii = imag(img);
	
	%rr = (rr .- min(min(rr))) ./ (max(max(rr)) - min(min(rr))) .* 255;
	%ii = (ii .- min(min(ii))) ./ (max(max(ii)) - min(min(ii))) .* 255 ;
	
	
	sss = size(rr);
	h = fspecial('gaussian', sss, 0.5);
	
	rr = imfilter(rr, h);
	ii = imfilter(ii, h);
	
	i = sqrt(-1);
	
	img = rr + i .* ii;
	
	%imgt = sqrt(rr.^2 + ii.^2);
	%imgt = (imgt - min(min(imgt))) / (max(max(imgt)) - min(min(imgt))) * 255;
	
	rst = ifft2(img);
	rst = real(rst);
	rst = uint8(rst);
	%fprintf('%d\n', rst);
	figure, imshow(rst);