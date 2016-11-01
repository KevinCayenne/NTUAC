%%% The script try to use FontSmoothing property to smooth text edge that
%%% make better image visualization. The FontSmoothing is not incorporate 
%%% in old MATLAB version. If you're runing MATLAB befor 2013b, you could 
%%% turn on the property setting by enable hg2. 
%%% Ref: http://undocumentedmatlab.com/blog/matlab-hg2
%%%
%%% created by Yu-Shiang Su (2015/10/16)

%% Setting
% picture size
pic_wid = 200;
pic_len = 250;
txtfontsize = 80;  %unit: pixel
arrfontsize = 160;

%% Drawing
% create picture for drawing
pic_img = imshow(zeros(pic_len, pic_wid));
text(pic_wid/2, pic_len*1/2, 'ен', ...
    'color', [1 1 1], ...                  % White color
    'fontsize', txtfontsize, ...     % Font size
    'FontUnits', 'pixels', ...             % Font size unit use pixels
    'FontName', 'BiauKai', ...             % Font type use BiauKai (should be change under win OS)
    'HorizontalAlignment', 'center', ...   % Centering
    'VerticalAlignment', 'middle')
% Transform updated graphic to image
upd_img = getframe(gca);
img2save = frame2im(upd_img);
imwrite(img2save, 'txt2.jpg');

