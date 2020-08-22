///c_standard

//lr movement

if(abs(hspd) < 0.2 and !aerial){ //. stopping it from bullshitting like funny
    hspd = 0;
}



//lr collision

if place_meeting(xx + hspd, yy, o_solid) {
    var i = 0;
    while !place_meeting(xx + sign(hspd), yy, o_solid) {
        xx += sign(hspd);
        i++;
        if i > sprite_width { break; } 
    }
    hspd = 0;
}

if place_meeting(xx + hspd, yy, o_slope) {
    yplus = 0;
    while (place_meeting(xx + hspd, yy - yplus, o_slope) && yplus <= abs(1 * hspd)) yplus += 1;
    if place_meeting(xx + hspd, yy - yplus, o_slope) {
        while (!place_meeting(xx + sign(hspd), yy, o_slope)) xx += sign(hspd);
        hspd = 0;
    } else {
        yy -= yplus;
    }
}

//ud movement





if aerial = true {
    prite_index = air;
}

//ud collision
if !place_meeting(xx, yy + 1, o_collide) {
    vspd += grav;
    leniance -= .5;
    hspd = lerp(hspd, 0, frict/2);
    aerial = true;
    grav = .14;
} else {
    leniance = 5;
    acc = .3;
    sprite_index = ground;
    hspd = lerp(hspd, 0, frict);
    aerial = false; 
    yy = floor(yy);
    vspd = 0;
}

if place_meeting(xx, yy + vspd, o_collide) {
    while !place_meeting(xx, yy + sign(vspd), o_collide) {
        yy += sign(vspd);
    }
    vspd = 0;
    
}


//directions and sprites



if(!aerial){
    image_speed = abs(hspd/13);
    if hspd == 0 {
      image_index = 0;
    }
    
}

//the actual going




    xx += hspd;

    yy += vspd;
//xx = floor(xx)
yy = floor(yy)
x = floor(xx);
y = floor(yy);

if(keyboard_check_pressed(vk_f1)){
    c_hitbox_create(id,"test");
}

if place_meeting(x, y, o_damage) && !inv {
    hp--;
    //audio_play_sound(something);
    if hp = 0 {
        state = c_death;
        sprite_index = death;
        hp = -1;
    } else {

        inv = true;
        alarm[0] = 60;
        image_alpha = .5;
        vspd = -2;
    }
}

//image_speed = 1;
