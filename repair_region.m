% Code prepared by: 
% Ahmad Syarif Munalih
% asyarifm@gmail.com
% 
% the code was built in order to improve the performance of lee region

function [fvrRepair] = repair_region (fvr)

[fvr_h, fvr_w] = size(fvr);
if mod(fvr_w,2) == 0
    mid_fvr_w = fvr_w/2 + 1;
else
    mid_fvr_w = ceil(fvr_w/2);
end

cur_h = 1;

while (fvr(cur_h,mid_fvr_w) == 0) 
    cur_h = cur_h+1;
end

cur_h_up = cur_h;
check = 0;

%upside left
for i=(mid_fvr_w-1):-1:1
    if (fvr(cur_h_up-1,i) == 1)
        cur_h_up = cur_h_up-1;
        for j=1:3
            %if (fvr(cur_h_up-j,i) == 0)
            %    j = 3;
            %else
                if(fvr(cur_h_up-j,i+1) == 1)
                    j = 3;
                else
                    check = check + 1;
                end
            %end
        end
    end
    if (check == 3)
        %cur_h_up = cur_h_up+1;
        fvr(cur_h_up:-1:1,i) = 0;
    end
    check = 0;
end

cur_h_up = cur_h;

%upside right
for i=(mid_fvr_w):fvr_w
    if (fvr(cur_h_up-1,i) == 1)
        %cur_h_up = cur_h_up-1;
        for j=1:3
            %if (fvr(cur_h_up-j,i) == 0)
            %    j = 3;
            %else
                if(fvr(cur_h_up-j,i-1) == 1)
                    j = 3;
                else
                    check = check + 1;
                end
            %end
        end
    end
    if (check == 3)
        %cur_h_up = cur_h_up+1;
        fvr(cur_h_up:-1:1,i) = 0;
    end
    check = 0;
end

cur_h = fvr_h;
while (fvr(cur_h,mid_fvr_w) == 0) 
    cur_h = cur_h-1;
end


cur_h_btm = cur_h;
%downside left
for i=(mid_fvr_w-1):-1:1
    if (fvr(cur_h_btm+1,i) == 1)
        cur_h_btm = cur_h_btm+1;
        for j=1:3
            %if (fvr(cur_h_btm-j,i) == 0)
            %    j = 3;
            %else
                if(fvr(cur_h_btm+j,i+1) == 1)
                    j = 3;
                else
                    check = check + 1;
                end
            %end
        end
    end
    if (check == 3)
        fvr(cur_h_btm:fvr_h,i) = 0;
        %cur_h_btm = cur_h_btm-1;
    end
    check = 0;
end

cur_h_btm = cur_h;
%downside right
for i=(mid_fvr_w):fvr_w
    if (fvr(cur_h_btm+1,i) == 1)
         %cur_h_btm = cur_h_btm+1;
        for j=1:3
            %if (fvr(cur_h_btm+j,i) == 0)
                %j = 3;
            %else
                if(fvr(cur_h_btm+j,i-1) == 1)
                    j = 3;
                else
                    check = check + 1;
                end
            %end
        end
    end
    if (check == 3)
        fvr(cur_h_btm:fvr_h,i) = 0;
    end
    check = 0;
end
fvrRepair = fvr;

        