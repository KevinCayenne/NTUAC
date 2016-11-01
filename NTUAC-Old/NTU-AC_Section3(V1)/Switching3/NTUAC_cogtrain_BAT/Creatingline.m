%% Setting
% picture size
pic_wid = 560;
pic_len = 800;


% line size
rec_wid = 20;
rec_maxlen = 700;       %Max line length
rec_minlen = 200;       %Min line length
rec_len_lv = 4;        %levels for line length

% Transparency (alpha)
rec_maxalpha = 1;       %Max line transparency, 1 for white
rec_minalpha = 0.1;       %Min line transparency, 0 for black
transparency_lv = 4;   %levels for line transparency

%% Loops for creating picture and save
for len_loopcount = 1 : rec_len_lv;
    for alpha_loopcount = 1 : transparency_lv;
        
        % Line length and Line transparency
        Long_rec_len = (rec_maxlen- ((rec_maxlen - rec_minlen)/3 * 2))/ ...
            rec_len_lv * len_loopcount + ((rec_maxlen - rec_minlen)/3 * 2);
        Short_rec_len = (((rec_maxlen - rec_minlen)/3 * 1) - rec_minlen)/ ...
            rec_len_lv * len_loopcount + rec_minlen;
        
        Large_rec_alpha = (rec_maxalpha- ((rec_maxalpha - rec_minalpha)/3 * 2))/ ...
            transparency_lv * alpha_loopcount + ((rec_maxalpha - rec_minalpha)/3 * 2);
        Shallow_rec_alpha = (((rec_maxalpha - rec_minalpha)/3 * 1) - rec_minalpha)/ ...
            transparency_lv * alpha_loopcount + rec_minalpha;
        
        % give the bottome left point for creating line
        rec_x = (pic_wid - rec_wid)/2;
        Long_rec_y = (pic_len - Long_rec_len)/2;
        Short_rec_y = (pic_len - Short_rec_len)/2;
        
        % How do you save the picture name?               
        LL_pic_name = ['line_rL' num2str(len_loopcount) '_aL' num2str(alpha_loopcount) '.jpg'];
        LS_pic_name = ['line_rL' num2str(len_loopcount) '_aS' num2str(alpha_loopcount) '.jpg'];
        SL_pic_name = ['line_rS' num2str(len_loopcount) '_aL' num2str(alpha_loopcount) '.jpg'];
        SS_pic_name = ['line_rS' num2str(len_loopcount) '_aS' num2str(alpha_loopcount) '.jpg'];
        
        % create picture for drawing
        pic_img = imshow(zeros(pic_len, pic_wid));
        % drwa line !!!!!!
        rectangle('Position',[rec_x, Long_rec_y, rec_wid, Long_rec_len], ...
            'FaceColor',[1 1 1]*Large_rec_alpha)
        % Transform updated graphic to image
        upd_img = getframe(gca);
        img2save = frame2im(upd_img);    
        % Save the image
        imwrite(img2save, LL_pic_name);
        close figure 1
        
        % create picture for drawing
        pic_img = imshow(zeros(pic_len, pic_wid));
        % drwa line !!!!!!
        rectangle('Position',[rec_x, Long_rec_y, rec_wid, Long_rec_len], ...
            'FaceColor',[1 1 1]*Shallow_rec_alpha)
        % Transform updated graphic to image
        upd_img = getframe(gca);
        img2save = frame2im(upd_img);    
        % Save the image
        imwrite(img2save, LS_pic_name);
        close figure 1
        
        % create picture for drawing
        pic_img = imshow(zeros(pic_len, pic_wid));
        % drwa line !!!!!!
        rectangle('Position',[rec_x, Short_rec_y, rec_wid, Short_rec_len], ...
            'FaceColor',[1 1 1]*Large_rec_alpha)
        % Transform updated graphic to image
        upd_img = getframe(gca);
        img2save = frame2im(upd_img);    
        % Save the image
        imwrite(img2save, SL_pic_name);
        close figure 1
        
        % create picture for drawing
        pic_img = imshow(zeros(pic_len, pic_wid));
        % drwa line !!!!!!
        rectangle('Position',[rec_x, Short_rec_y, rec_wid, Short_rec_len], ...
            'FaceColor',[1 1 1]*Shallow_rec_alpha)
        % Transform updated graphic to image
        upd_img = getframe(gca);
        img2save = frame2im(upd_img);    
        % Save the image
        imwrite(img2save, SS_pic_name);
        close figure 1
        
    end
end