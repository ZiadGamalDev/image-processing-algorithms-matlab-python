function newImg = Ideal_Low_Pass_Filter(oldImg, D0)
    % Calculate filter
    [M, N] = size(oldImg);
    H = zeros(M, N);
    for u = 1 : M
        for v = 1 : N
            D = ((u - M / 2)^2 + (v - N /2)^2)^0.5;
            H(u, v) = D <= D0;
        end
    end
    % Apply filter
    FTS = fftshift(fft2(oldImg));
    Real = H .* real(FTS);
    Imag = H .* imag(FTS);
    IFT = ifft2(ifftshift(Real + 1i * Imag));
    % Displaying
    newImg = uint8(real(IFT));
    subplot(1,2,1), imshow(oldImg), title('Old Image');
    subplot(1,2,2), imshow(newImg), title('New Image');
end