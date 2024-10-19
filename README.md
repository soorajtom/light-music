# light-music
Light based paper strip music box

## The plan
Typical paper strip music boxes use mechanical components to interact with the perforation and produce notes. The plan with this project is to do this digitally. An array of LED phototransistor pair would sense the holes and produce the right sound.
```
                            [x] octave
                    ◯      [x] sharpen
                  ◯    ◯  [x] B
  ◯                        [x] A
     paper strip --->       [x] G
                            [x] F
            ◯              [x] E
                 ◯         [x] D
        ◯                  [x] C
```

## Requirements

* 9x LEDs -- [IR LEDs](https://robu.in/product/5mm-940nm-infrared-receiver-led-ir-diode-led-pack-of-5/)
* 9x phototransistors -- [PT334-6c](https://robu.in/product/pt334-6c-5mm-phototransistor-pack-of-10/)
* Resistors -- [pullup](https://robu.in/product/10k-ohm-0-5w-metal-film-resistor-pack-of-50/),  [current limiter](https://robu.in/product/0-5w-100-ohm-resistor-pack-of-50/)
* ESP32
* headphones/buzzer
* structural elements -- 3d print files included in repo
