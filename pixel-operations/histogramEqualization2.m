function newImg = histogramEqualization2(img)
    % Image histogram
    oldCounts = imhist(img);
    % Prefix sum
    indices = cumsum(oldCounts);
    % Max color
    maxCount = indices(end);
    % Divide and multiply
    indices = round(indices / maxCount * (numel(oldCounts) - 1));
    % Create the equalized image
    newImg = img;
    for i = 1:numel(oldCounts)
        newImg(img == (i - 1)) = indices(i);
    end
    % Displaying
    subplot(1, 2, 1), imshow(img), title('Old Image');
    subplot(1, 2, 2), imshow(newImg), title('New Image');
end