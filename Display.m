function Display(I, name, sv)

N = size(I,3);

if N == 1
    h=figure;
    imagesc(I); axis image; axis off; colormap(gray);
    title(name);  
    
    if exist('sv') == 1 && ~isempty(sv)
        saveas(h,[sv,'.eps'],'psc2');
    end
    
end

if N == 3
    h=figure;
    image(I);axis off; axis image
    title(name);
    
    if exist('sv') == 1 && ~isempty(sv)
        saveas(h,[sv,'.eps'],'psc2');
    end

end
