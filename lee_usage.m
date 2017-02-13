% This script shows how the finger region and edges can be detected.

function [rgb, edges] = lee_usage(img)

img = img( :,:,1);
mask_height=4; % Height of the mask
mask_width=40; % Width of the mask
[fvr, edges] = lee_region(img,mask_height,mask_width);

[fvrRepair] = repair_region(fvr);
rgb = fvrRepair;

