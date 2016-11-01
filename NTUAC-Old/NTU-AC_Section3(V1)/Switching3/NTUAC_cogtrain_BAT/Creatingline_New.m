%%% Create Lines for switching training.
%%%
%%% created by Yu-Shiang Su (2015/10/16)

%% Setting
% picture size
pic_wid = 400;
pic_len = 750;

rec_length = 250;

% Brightness
rec_maxbrightness = 1;          %Max line transparency, 1 for white
rec_minbrightness = 0.4;       %Min line transparency, 0 for black
brightness_lv = 2;              %levels for line transparency

% Angle
rec_maxangle = +20;
rec_minangle = -20;
angle_lv = 2;

% Thickness
rec_maxthickness = 55;
rec_minthickness = 15;
thickness_lv = 2;
     

%% Loops for creating picture and save
for brightness_cond = 0:1
    for angle_cond = 0:1
        for thickness_cond = 0:1
            for location_cond = 0:1
                for brightness_lv_counter = 1:brightness_lv
                    for angle_lv_counter = 1:angle_lv
                        for thickness_lv_counter = 1:thickness_lv

% define rectangle characteristics
switch brightness_cond   % BRight/DArk
    case 0
        line_COND.brightness = 'BRight';
        rec_brightness = ((rec_maxbrightness - rec_minbrightness)/5 * 1)/ (brightness_lv - 1) * (brightness_lv_counter - 1) + ...
            (rec_maxbrightness- ((rec_maxbrightness - rec_minbrightness)/5 * 1));
    case 1
        line_COND.brightness = 'DArk';
        rec_brightness = ((rec_maxbrightness - rec_minbrightness)/5 * 1)/ (brightness_lv - 1) * (brightness_lv_counter - 1) + ...
            rec_minbrightness;
end

switch angle_cond   % VErtical/HOrizontal
    case 0
        line_COND.angle = 'HOrizontal';
        rec_angle = (rec_maxangle - rec_minangle)/(angle_lv-1) * (angle_lv_counter-1) + (90 + rec_minangle);
    case 1
        line_COND.angle = 'VErtical';
        rec_angle = (rec_maxangle - rec_minangle)/(angle_lv-1) * (angle_lv_counter-1) + rec_minangle;
end

switch thickness_cond  % THick/NArrow
    case 0
        line_COND.thickness = 'THick';
        rec_thickness = ((rec_maxthickness - rec_minthickness)/5 * 1)/ (thickness_lv-1) * (thickness_lv_counter-1) + ...
            (rec_maxthickness- ((rec_maxthickness - rec_minthickness)/5 * 1));
    case 1
        line_COND.thickness = 'NAick';
        rec_thickness = ((rec_maxthickness - rec_minthickness)/5 * 1)/ (thickness_lv-1) * (thickness_lv_counter-1) + ...
            rec_minthickness;
end

fprintf('%s%0.2f%s%s%0.2f%s%s%0.2f\n', line_COND.brightness(1:2), rec_brightness, ' ,', line_COND.angle(1:2), rec_angle, ' ,',...
    line_COND.thickness(1:2), rec_thickness)

%% define the coordinates of 4 points for the rectangle
x1 = (pic_wid/2) - (sind(rec_angle)*rec_length/2) - (cosd(rec_angle)*rec_thickness/2);
x2 = (pic_wid/2) - (sind(rec_angle)*rec_length/2) + (cosd(rec_angle)*rec_thickness/2);
x3 = (pic_wid/2) + (sind(rec_angle)*rec_length/2) + (cosd(rec_angle)*rec_thickness/2);
x4 = (pic_wid/2) + (sind(rec_angle)*rec_length/2) - (cosd(rec_angle)*rec_thickness/2);
y1 = (pic_len/2) + (cosd(rec_angle)*rec_length/2) - (sind(rec_angle)*rec_thickness/2);
y2 = (pic_len/2) + (cosd(rec_angle)*rec_length/2) + (sind(rec_angle)*rec_thickness/2);
y3 = (pic_len/2) - (cosd(rec_angle)*rec_length/2) + (sind(rec_angle)*rec_thickness/2);
y4 = (pic_len/2) - (cosd(rec_angle)*rec_length/2) - (sind(rec_angle)*rec_thickness/2);

%% define picture file name
pic_name = ['line_' ...
    line_COND.brightness(1:2) num2str(brightness_lv_counter) '_' ...
    line_COND.angle(1:2) num2str(angle_lv_counter) '_' ...
    line_COND.thickness(1:2) num2str(thickness_lv_counter) '.jpg'];

%% create picture for drawing
pic_img = imshow(zeros(pic_len, pic_wid));

%% Draw Line!
patch([x1 x2 x3 x4], [y1 y2 y3 y4], [1 1 1], ...
    'EdgeColor', 'none', 'FaceAlpha', rec_brightness)

%% Transform updated graphic to image
upd_img = getframe(gca);
img2save = frame2im(upd_img);    

%% Save the image
imwrite(img2save, pic_name);
close figure 1



                        end
                    end
                end
            end
        end
    end
end