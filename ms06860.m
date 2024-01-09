circle = imread("circle.bmp");
square = imread("square.bmp");
heart = imread("heart.bmp");
%image_bruh = [0 0 0 0 0;0 1 1 0 0;0 1 1 0 0;0 1 1 1 0;0 1 1 1 0;0 0 0 0 0];
images = ["circle.bmp" "square.bmp" "heart.bmp"];
index = 1;
%driver code
for jj=1:length(images)
    L = length(images);
    I = imread(images(jj));
    B = boundary(I);
    subplot(L,3,index);
    title('Original Image')
    index=index+1;
    imshow(I);
    subplot(L,3,index);
    title('Using bwboundaries by MATLAB')
    index=index+1;
    [X,Y] = bwboundaries(I);
    b = X{1};
    imshow(I);
    hold on
    plot(b(:,2),b(:,1),'w','LineWidth',2,'Color','green');
    subplot(L,3,index);
    title('Using Custom Made Function')
    index=index+1;
    imshow(I);
    hold on
    plot(B(:,2), B(:,1), 'w', 'LineWidth', 2, 'Color', 'red');
end









