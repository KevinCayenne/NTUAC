%%% Create Lines for switching training.
%%%
%%% created by Yu-Shiang Su (2015/10/16)

%% Setting
% picture size
pic_wid = 400;
pic_len = 750;

% line size
rec_wid = 20;
rec_len = 250;

% Transparency (alpha)
rec_maxalpha = 1;       %Max line transparency, 1 for white
rec_minalpha = 0.25;       %Min line transparency, 0 for black
transparency_lv = 4;   %levels for line transparency

% degree of turning
recver_maxtheta = 110;
recver_mintheta = 70;

rechor_maxtheta = 20;
rechor_mintheta = -20;

theta_lv = 6;


%% Loops for creating picture and save
for alpha_loopcount = 1 : transparency_lv;
    for theta_loopcount = 1 : theta_lv;

        % Divided line transparency into two distinct group
        % Then give transparency_lv for each group. 
        % i.e. Generate transparency_lv * 2 different transparency.
        Large_rec_alpha = ((rec_maxalpha - rec_minalpha)/3 * 1)/ (transparency_lv - 1) * (alpha_loopcount - 1) + ...
            (rec_maxalpha- ((rec_maxalpha - rec_minalpha)/3 * 1));
        Shallow_rec_alpha = ((rec_maxalpha - rec_minalpha)/3 * 1)/ (transparency_lv - 1) * (alpha_loopcount - 1) + ...
            rec_minalpha;
        fprintf('%s%s\n', 'L=',num2str(Large_rec_alpha))
        fprintf('%s%s\n', 'S=',num2str(Shallow_rec_alpha))
        
        % Divided line turning degree into two distinct group
        % Then give theta_lv for each group
        % i.e. Generate theta_lv * 2 different theta.
        Ver_rec_theta = (recver_maxtheta - recver_mintheta)/(theta_lv-1) * (theta_loopcount-1) + recver_mintheta;
        Hor_rec_theta = (rechor_maxtheta - rechor_mintheta)/(theta_lv-1) * (theta_loopcount-1) + rechor_mintheta;
        
        % Specify 4 points' coordinates for the rectangle
        tV_x1 = (pic_wid/2) - (sind(Ver_rec_theta)*rec_len/2) - (cosd(Ver_rec_theta)*rec_wid/2);
        tV_x2 = (pic_wid/2) - (sind(Ver_rec_theta)*rec_len/2) + (cosd(Ver_rec_theta)*rec_wid/2);
        tV_x3 = (pic_wid/2) + (sind(Ver_rec_theta)*rec_len/2) + (cosd(Ver_rec_theta)*rec_wid/2);
        tV_x4 = (pic_wid/2) + (sind(Ver_rec_theta)*rec_len/2) - (cosd(Ver_rec_theta)*rec_wid/2);
        tV_y1 = (pic_len/2) + (cosd(Ver_rec_theta)*rec_len/2) - (sind(Ver_rec_theta)*rec_wid/2);
        tV_y2 = (pic_len/2) + (cosd(Ver_rec_theta)*rec_len/2) + (sind(Ver_rec_theta)*rec_wid/2);
        tV_y3 = (pic_len/2) - (cosd(Ver_rec_theta)*rec_len/2) + (sind(Ver_rec_theta)*rec_wid/2);
        tV_y4 = (pic_len/2) - (cosd(Ver_rec_theta)*rec_len/2) - (sind(Ver_rec_theta)*rec_wid/2);
        
        tH_x1 = (pic_wid/2) - (sind(Hor_rec_theta)*rec_len/2) - (cosd(Hor_rec_theta)*rec_wid/2);
        tH_x2 = (pic_wid/2) - (sind(Hor_rec_theta)*rec_len/2) + (cosd(Hor_rec_theta)*rec_wid/2);
        tH_x3 = (pic_wid/2) + (sind(Hor_rec_theta)*rec_len/2) + (cosd(Hor_rec_theta)*rec_wid/2);
        tH_x4 = (pic_wid/2) + (sind(Hor_rec_theta)*rec_len/2) - (cosd(Hor_rec_theta)*rec_wid/2);
        tH_y1 = (pic_len/2) + (cosd(Hor_rec_theta)*rec_len/2) - (sind(Hor_rec_theta)*rec_wid/2);
        tH_y2 = (pic_len/2) + (cosd(Hor_rec_theta)*rec_len/2) + (sind(Hor_rec_theta)*rec_wid/2);
        tH_y3 = (pic_len/2) - (cosd(Hor_rec_theta)*rec_len/2) + (sind(Hor_rec_theta)*rec_wid/2);
        tH_y4 = (pic_len/2) - (cosd(Hor_rec_theta)*rec_len/2) - (sind(Hor_rec_theta)*rec_wid/2);
        
        % How do you save the picture name?               
        LV_pic_name = ['line_aL' num2str(alpha_loopcount) '_tV' num2str(theta_loopcount) '.jpg']; 
        SV_pic_name = ['line_aS' num2str(alpha_loopcount) '_tV' num2str(theta_loopcount) '.jpg'];
        LH_pic_name = ['line_aL' num2str(alpha_loopcount) '_tH' num2str(theta_loopcount) '.jpg'];
        SH_pic_name = ['line_aS' num2str(alpha_loopcount) '_tH' num2str(theta_loopcount) '.jpg'];
        
        % create picture for drawing
        pic_img = imshow(zeros(pic_len, pic_wid));

        % Draw Line!
        patch([tV_x1 tV_x2 tV_x3 tV_x4], [tV_y1 tV_y2 tV_y3 tV_y4], [1 1 1], ...
            'EdgeColor', 'none', 'FaceAlpha', Large_rec_alpha)

        % Transform updated graphic to image
        upd_img = getframe(gca);
        img2save = frame2im(upd_img);    
        % Save the image
        imwrite(img2save, LV_pic_name);
        close figure 1
        
                % create picture for drawing
        pic_img = imshow(zeros(pic_len, pic_wid));

        % Draw Line!
        patch([tV_x1 tV_x2 tV_x3 tV_x4], [tV_y1 tV_y2 tV_y3 tV_y4], [1 1 1], ...
            'EdgeColor', 'none', 'FaceAlpha', Shallow_rec_alpha)

        % Transform updated graphic to image
        upd_img = getframe(gca);
        img2save = frame2im(upd_img);    
        % Save the image
        imwrite(img2save, SV_pic_name);
        close figure 1
        
                % create picture for drawing
        pic_img = imshow(zeros(pic_len, pic_wid));

        % Draw Line!
        patch([tH_x1 tH_x2 tH_x3 tH_x4], [tH_y1 tH_y2 tH_y3 tH_y4], [1 1 1], ...
            'EdgeColor', 'none', 'FaceAlpha', Large_rec_alpha)

        % Transform updated graphic to image
        upd_img = getframe(gca);
        img2save = frame2im(upd_img);    
        % Save the image
        imwrite(img2save, LH_pic_name);
        close figure 1
        
                % create picture for drawing
        pic_img = imshow(zeros(pic_len, pic_wid));

        % Draw Line!
        patch([tH_x1 tH_x2 tH_x3 tH_x4], [tH_y1 tH_y2 tH_y3 tH_y4], [1 1 1], ...
            'EdgeColor', 'none', 'FaceAlpha', Shallow_rec_alpha)

        % Transform updated graphic to image
        upd_img = getframe(gca);
        img2save = frame2im(upd_img);    
        % Save the image
        imwrite(img2save, SH_pic_name);
        close figure 1
        
                
    end
end