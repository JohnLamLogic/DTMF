# DTMF Generator

### `dtmf.m`

This MATLAB script generates and plays a sequence of Dual-Tone Multi-Frequency (**DTMF**) tones, the kind used by push-button telephones. It takes a user-defined sequence of digits, creates the corresponding audible tones, and adds random silent pauses to simulate a keypad being pressed. The final output is played through your computer's speakers and displayed as a waveform plot. 

---

### How It Works

The script generates DTMF tones by combining two pure sine waves: one from a **low-frequency group** (rows on the keypad) and one from a **high-frequency group** (columns). For example, the digit '5' is a combination of 770 Hz and 1336 Hz. The script calculates these tones for each digit in the sequence and concatenates them into a single audio signal. To make the sequence sound more realistic, it inserts a randomly-timed period of silence between each tone.

The sampling rate (`fs`) is set to 8000 Hz, a standard for telephony, but the script includes a check to ensure it's at least twice the highest frequency (1477 Hz) to prevent aliasing. The generated audio is then played using the `soundsc` function, which automatically scales the sound to prevent clipping.

---

### Usage

1.  Open the `dtmf_generator.m` file in MATLAB.
2.  Find the line `seq_digits = [3 0 5];` and **change the numbers** to the sequence you want to generate.
3.  Run the script. It will generate and play the DTMF tones and display a plot of the waveform.

---

### Customization

You can easily adjust the following parameters within the script:

* **Sampling Frequency**: Change the value of `fs` to use a different sampling rate.
* **Tone Duration**: The length of each tone is set to 1 second. You can shorten or lengthen this by modifying the end value in the `t` vector.
* **Amplitude**: Adjust the `A` variable to change the volume of the tones.
* **Delay**: Modify the `delay = rand;` line to change how the silent gaps are generated. For instance, `delay = 0.5;` would create a fixed half-second pause.

---

### Example Output

When you run the script, a plot will be generated showing the time-domain signal. You'll see distinct bursts of waves representing each tone, separated by flat lines indicating the silent periods. The plot's title will confirm the DTMF sequence being played. 
