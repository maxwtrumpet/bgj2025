ButtonManager = {
    cur_row = 1,
    cur_column = 1,
    button_layout = nil,

    OnStart = function (self)
        if self.button_layout == nil then
            self.button_layout = {3,3}
        end
        Event.Publish("ButtonFocus", {focus = true, initial = true, row = self.cur_row, column = self.cur_column})
    end,

    OnUpdate = function (self)
        if Input.IsKeyJustDown("space") or Input.IsButtonJustDown("button down") then
            Event.Publish("ButtonPress", {row = self.cur_row, column = self.cur_column})
        elseif (Input.IsKeyJustDown("s") or Input.IsButtonJustDown("primary joystick down")) and self.cur_row < #self.button_layout then
            Event.Publish("ButtonFocus", {focus = false, initial = false, row = self.cur_row, column = self.cur_column})
            self.cur_row = self.cur_row + 1
            self.cur_column = math.min(self.cur_column,self.button_layout[self.cur_row])
            Event.Publish("ButtonFocus", {focus = true, initial = false, row = self.cur_row, column = self.cur_column})
        elseif (Input.IsKeyJustDown("w") or Input.IsButtonJustDown("primary joystick up")) and self.cur_row > 1 then
            Event.Publish("ButtonFocus", {focus = false, initial = false, row = self.cur_row, column = self.cur_column})
            self.cur_row = self.cur_row - 1
            self.cur_column = math.min(self.cur_column,self.button_layout[self.cur_row])
            Event.Publish("ButtonFocus", {focus = true, initial = false, row = self.cur_row, column = self.cur_column})
        elseif (Input.IsKeyJustDown("d") or Input.IsButtonJustDown("primary joystick right")) and self.cur_column < self.button_layout[self.cur_row] then
            Event.Publish("ButtonFocus", {focus = false, initial = false, row = self.cur_row, column = self.cur_column})
            self.cur_column = self.cur_column + 1
            Event.Publish("ButtonFocus", {focus = true, initial = false, row = self.cur_row, column = self.cur_column})
        elseif (Input.IsKeyJustDown("a") or Input.IsButtonJustDown("primary joystick left")) and self.cur_column > 1 then
            Event.Publish("ButtonFocus", {focus = false, initial = false, row = self.cur_row, column = self.cur_column})
            self.cur_column = self.cur_column - 1
            Event.Publish("ButtonFocus", {focus = true, initial = false, row = self.cur_row, column = self.cur_column})
        end
    end
}