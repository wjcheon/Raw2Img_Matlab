% writer : mp_wjcheon 
% date : 2016.11.06
% 
% 
% 

clc
clear
close all

%%
addpath('CToptm')
% FilenameOfRaws = '1';
FilenameOfRaws = 'benchmarkFastCT_full_1mm_10e8_000'
FilenameOfRaws = [FilenameOfRaws, '.dat'];
% row = 1536;
% col = 1920;
row = 576;
col = 576;

%%

fin=fopen(FilenameOfRaws,'r');
% I=fread(fin,Inf,'uint16=>double'); 
% I=fread(fin,row*col,'uint16'); 
I=fread(fin,Inf,'uint32'); 
Z=reshape(I,row,col);
Z_norm = Z./max(Z(:));
Z_inverted = abs(Z - max(Z(:))) +1;
Z_inverted_rotated = imrotate(Z_inverted,270);
% Z_inverted_rotated_min = min(Z_inverted_rotated(:));
% Z_inverted_rotated_max = max(Z_inverted_rotated(:));
Z_inverted_rotated_min = 1.0*10^9;
Z_inverted_rotated_max = 1.1*10^9;

imtool(Z)

% figure, imshow(Z,[])
% figure, imshow(Z_norm,[])
% figure, imshow(Z,[1.0*10^9  1.2*10^9])
% figure, imshow(Z_inverted_rotated,[Z_inverted_rotated_min Z_inverted_rotated_max])
% 
%%

