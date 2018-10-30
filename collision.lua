function checkCollision(a, b)
    --With locals it's common usage to use underscores instead of camelCasing
    local a_x = a.x
    local a_w = a.width
    local a_y = a.y
    local a_h = a.height

    local b_x = b.x
    local b_w = b.width
    local b_y = b.y
    local b_h = b.height

    if  a_x < b_x + b_w and
        b_x < a_x + a_w and
        a_y < b_y + b_h and
        b_y < a_y + a_h then
        --There is collision!
        return true
    else
        --If one of these statements is false, return false.
        return false
    end
end