
t = 0.5

live_loop :tick do
  sleep 4*t
end

live_loop :drums do
  snare = :drum_snare_hard
  kick = :drum_heavy_kick
  sync :tick
  
  sample kick
  sleep t
  
  sample snare
  sleep t
  
  sample kick
  sleep t/2
  sample kick, amp: 0.5
  sleep t/2
  
  sample snare
end

live_loop :hihat do
  hihato = :drum_cymbal_open
  hihatc = :drum_cymbal_closed
  
  sync :tick
  
  3.times do
    sample hihatc, amp: 0.3, sustain: 0, release: t/2
    sleep t/2
    sample hihato, amp: 0.3, sustain: 0, release: t/2
    sleep t/2
  end
  
  sample hihatc, amp: 0.3, sustain: 0, release: t/2
  sleep t/2
  sample hihato, amp: 0.3, sustain: 0, release: t/2
end

live_loop :rithm do
  use_synth :piano
  sync :tick
  3.times do
    play (chord :C, :major).choose, release: t
    sleep t
  end
  play (chord :C, :major).choose, release: t
end
