/*

    renex dialog engine
    -------------------
    v0.1 - dec 2024


- dialog control is handled by the DialogEngine system object.
- controls are locked during dialog.
- use de_begin(script,[textbox script]) to call your dialog script.
  -> this uses the default textbox when one isn't specified.
- the dialog script needs to have an if tree calling de_dialog(), and optionally de_choice()s.
  -> check the included dialog_example().
- the textbox script receives the npc sprite, the current text, and whether the dialog can be advanced.
  -> check the textbox_default() for an example.
- setting the 'remember' argument will cause the line of text, the selected option, or the runonce event, to be saved.
- setting the 'voiceover' argument will play the sound only once at the start of the text.
- text speed is in characters per frame.
- you can use '@' characters to delay text, and '#' characters to force a line break.  
- by default, the dialog keys are Up/Down and Shoot. This can be changed in de_settings().
- by default, the jump and double jump sounds are used. This can also be changed in de_settings().
- you can use de_runonce(id,[remember this]) to execute something only once inside the dialog tree.
- you can use de_active() to check if the dialog engine is currently active.
