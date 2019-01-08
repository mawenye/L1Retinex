function I = colorbalance(inI,s,rmin,rmax)

if exist('rmin') ~= 1 || ~isnumeric(rmin) || isempty(rmin), rmin = 0; end;
if exist('rmax') ~= 1 || ~isnumeric(rmax) || isempty(rmax), rmax = 255; end;

if exist('s') ~=1 || ~isnumeric(s) || isempty(s), s = 0; end;


[m,n,N]=size(inI);
L=m*n;

I=double(inI);

for i=1:N
    
    I1=I(:,:,i);
    
    if s ~= 0
        I2=sort(I1(:));
        minI=I2(round(L*s/2)+1);
        maxI=I2(round(L*(1-s/2)));
    else
        minI = min(I1(:));
        maxI = max(I1(:));
    end
    
    
    if maxI==minI
        I(:,:,i)=zeros(m,n);
    else
        if s ~= 0
            ind=find(I1(:)<=minI);
            I1(ind)=minI;
            ind=find(I1(:)>=maxI);
            I1(ind)=maxI;
        end
        I(:,:,i)=(I1-minI)*(rmax-rmin)/(maxI-minI)+rmin;
    end
end


